// Date and time functions using a DS3231 RTC connected via I2C and Wire lib
#include "RTClib.h" // For use with DS3231 to keep time when disconnected 
#include <EEPROM.h> // For persistent storage of data when disconnected (future charge expiration time, verified key ids, etc.)
#include <Wire.h> // Used in serial communication
#include <SPI.h> // Used in serial communication
#include <Adafruit_PN532.h> // For use with a PN532 to interact with RFID cards
#include "RfidDb.h" // Database tools for storing ids in EEPROM

// Using an arduino nano we have 1KB of EEPROM
// We are using the first 4 bytes to store the timestamp when the current valid charge will end
// Therefore we offset the database 4 bytes
uint16_t eepromOffset = 4;

// A database designed to store a number of RFIDs of 32 bits up to a fixed
// size. The database is stored in EEPROM and requires (N * 4) + 2 bytes of 
// storage where N is the maximum number of entries.

uint8_t maxDbSize = 100;
RfidDb db = RfidDb(maxDbSize, eepromOffset);

uint32_t id1 = 0xFFFFFF01;

// If using the breakout with SPI, define the pins for SPI communication.
#define PN532_SCK  (2)
#define PN532_MOSI (3)
#define PN532_SS   (4)
#define PN532_MISO (5)

// Use this line for a breakout with a software SPI connection (recommended):
Adafruit_PN532 nfc(PN532_SCK, PN532_MISO, PN532_MOSI, PN532_SS);

RTC_DS3231 rtc;

char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

void setup () {
/*
#ifndef ESP8266
  while (!Serial); // for Leonardo/Micro/Zero
#endif
*/
  Serial.begin(9600);

  #if defined(ARDUINO_ARCH_ESP8266) || defined(ARDUINO_ARCH_ESP32)
    EEPROM.begin(db.dbSize());
  #endif
  db.begin();
  delay(3000); // wait for console opening

  if (! rtc.begin()) {
    Serial.println("Couldn't find RTC");
    while (1);
  }

  nfc.begin();

  uint32_t versiondata = nfc.getFirmwareVersion();
  if (! versiondata) {
    Serial.print("Didn't find PN53x board");
    while (1); // halt
  }
  
  // configure board to read RFID tags
  nfc.SAMConfig();

  if (rtc.lostPower()) {
    Serial.println("RTC lost power, lets set the time!");
    // following line sets the RTC to the date & time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
    // This line sets the RTC with an explicit date & time, for example to set
    // January 21, 2014 at 3am you would call:
    // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));
  }
  else // More Eli code if the rtc is a reliable provider of datetime
  {
    if(GetChargeEndTime() > rtc.now().unixtime())
    {
      Serial.println("Charge End in future, Continuing charging");  
      Serial.print("Current time ");
      Serial.print(rtc.now().unixtime());
      Serial.println();
      Serial.print("Charge end time ");
      Serial.print(GetChargeEndTime());
      Serial.println();
    }
    else
    {
      Serial.println("Last charge ended before restart");
    }
  }
}

int chargeEndAddress = 0;
uint32_t chargeEnd;

uint32_t GetChargeEndTime()
{
  return EEPROM.get(chargeEndAddress, chargeEnd);
}

// Adds 8 hours to current time and sets it in eeprom to address 0 length of 32 bits
void SetChargeEndTime()
{
  DateTime now = rtc.now();
  chargeEnd = now.unixtime() + 28800; // current time + 8 hours
  EEPROM.put(chargeEndAddress, chargeEnd); 
}



void loop () {

  Serial.println("Please scan a card");
   uint8_t success;
  uint8_t uid[] = { 0, 0, 0, 0, 0, 0, 0 };  // Buffer to store the returned UID
  uint8_t uidLength;                        // Length of the UID (4 or 7 bytes depending on ISO14443A card type)
    
  // Wait for an NTAG203 card.  When one is found 'uid' will be populated with
  // the UID, and uidLength will indicate the size of the UUID (normally 7)
  success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength);
  
  if (success) {
    // Display some basic information about the card
    Serial.println("Found an ISO14443A card");
    Serial.println("We'll update the charge time despite not yet validating the card");
    SetChargeEndTime();

    Serial.print("Current charge end time is ");
    Serial.print(GetChargeEndTime());
    Serial.println();
    Serial.print("  UID Length: ");Serial.print(uidLength, DEC);Serial.println(" bytes");
    Serial.print("  UID Value: ");
    nfc.PrintHex(uid, uidLength);
    Serial.println("");
    
    if (uidLength == 7)
    {
      uint8_t data[32];
      
      // We probably have an NTAG2xx card (though it could be Ultralight as well)
      Serial.println("Seems to be an NTAG2xx tag (7 byte UID)");    
      
      // NTAG2x3 cards have 39*4 bytes of user pages (156 user bytes),
      // starting at page 4 ... larger cards just add pages to the end of
      // this range:
      
      // See: http://www.nxp.com/documents/short_data_sheet/NTAG203_SDS.pdf

      // TAG Type       PAGES   USER START    USER STOP
      // --------       -----   ----------    ---------
      // NTAG 203       42      4             39
      // NTAG 213       45      4             39
      // NTAG 215       135     4             129
      // NTAG 216       231     4             225      

      for (uint8_t i = 0; i < 42; i++) 
      {
        success = nfc.ntag2xx_ReadPage(i, data);
        
        // Display the current page number
        Serial.print("PAGE ");
        if (i < 10)
        {
          Serial.print("0");
          Serial.print(i);
        }
        else
        {
          Serial.print(i);
        }
        Serial.print(": ");

        // Display the results, depending on 'success'
        if (success) 
        {
          // Dump the page data
          nfc.PrintHexChar(data, 4);
        }
        else
        {
          Serial.println("Unable to read the requested page!");
        }
      }      
    }
    else
    {
      Serial.println("This doesn't seem to be an NTAG203 tag (UUID length != 7 bytes)!");
    }
    
    // Wait a bit before trying again
    Serial.println("\n\nSend a character to scan another tag!");
    Serial.flush();
    while (!Serial.available());
    while (Serial.available()) {
    Serial.read();
    }
    Serial.flush();    
  }
  Serial.println();
  delay(3000);
}
