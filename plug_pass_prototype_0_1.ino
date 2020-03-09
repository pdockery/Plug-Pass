/*-----( Include LIbraries )-----*/
#include "RTClib.h" // For use with DS3231 to keep time when disconnected includes Date and time functions using a DS3231 RTC connected via I2C and Wire lib
#include <Wire.h> // Used in serial communication
#include <SPI.h> // Used in serial communication
#include <EEPROM.h> // For persistent storage of data when disconnected (future charge expiration time, verified key ids, etc.)
#include <Adafruit_PN532.h> // For use with a PN532 to interact with RFID cards


/*-----( Declare Constants and Pin Numbers )-----*/
// If using the breakout with SPI, define the pins for SPI communication.
#define PN532_SCK  (2)
#define PN532_MOSI (3)
#define PN532_SS   (4)
#define PN532_MISO (5)
char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int relayPin = 12;                        // defines a variable to set the output pin to D12
int chargeEndAddress = 0;                 // defines a variable to set the address location for the charge end time in the EEPROM
uint32_t chargeEnd;                       // defines a variable to store the charge end time
uint8_t success;                          // defines a variable to check the success of an NFC card scan
uint8_t uid[] = { 0, 0, 0, 0, 0, 0, 0 };  // Buffer to store the returned UID after NFC card scan
uint8_t uidLength;                        // Length of the UID (4 or 7 bytes depending on ISO14443A card type) for NFC card scan
int reader_delay = 5000;                  // defines a variable to timeout the card reader function, in ms

/*-----( Declare objects )-----*/
Adafruit_PN532 nfc(PN532_SCK, PN532_MISO, PN532_MOSI, PN532_SS); // Create a nfc object for a breakout with a software SPI connection
RTC_DS3231 rtc; // Create a RealTimeClock object


void setup ()
{
  pinMode(relayPin, OUTPUT);  // set relayPin as an output pin
  Serial.begin(9600);  //Set baud rate for serial communications
  delay(3000); // wait for console opening

  if (! rtc.begin())
  {
    Serial.println("Couldn't find RTC");
    while (1);  // I think we're going to eventually do something different, I don't want the outlet to fail if the RTC fails
  }

  GetChargeEndTime();

  if (chargeEnd > rtc.now().unixtime())
  {
    digitalWrite(relayPin, HIGH);  //if the chargeEnd time stored in the Arduino's EEPROM is in the future, close the relay
  }
  else
  {
    digitalWrite(relayPin, LOW);  //if the chargeEnd time stored in the Arduino's EEPROM is in the past, open the relay
  }

  nfc.begin();
  uint32_t versiondata = nfc.getFirmwareVersion();
  if (! versiondata)
  {
    Serial.print("Didn't find PN53x board");
    while (1); // I think we're going to eventually do something different, I don't want the outlet to fail if the NFC reader fails
  }

  nfc.SAMConfig(); // configure board to read RFID tags
  // When an NTAG203 card is found 'uid' will be populated with
  // the UID, and uidLength will indicate the size of the UUID (normally 7)
  // added a timeout to the card reading function.  it'll wait 5 seconds for a card, then move on.


  if (rtc.lostPower())
  {
    Serial.println("RTC lost power, lets set the time!");
    // following line sets the RTC to the date & time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)) + 10);
    Serial.println("RTC time set to serial time");
    PrintDateTime(rtc.now());
  }
  else // rtc is a reliable provider of datetime
  {
    if (chargeEnd > rtc.now().unixtime())
    {
      Serial.println("Charge End in future, Continuing charging");
      Serial.print("Current rtc time ");

      PrintDateTime(rtc.now());

      Serial.print("Charge end time ");
      PrintDateTime(chargeEnd);
    }
    else
    {
      Serial.println("Last charge ended before restart");
      Serial.print("Last charge end time ");

      PrintDateTime(chargeEnd);

      Serial.println("Current rtc time ");
      PrintDateTime(rtc.now());
    }
  }
}

void loop ()
{
  if (chargeEnd < rtc.now().unixtime())
  {
    digitalWrite(relayPin, LOW);
    Serial.println("charging expired, relay opened");
    Serial.println("current time ");
    PrintDateTime(rtc.now());
    Serial.println("charge time ends ");
    PrintDateTime(chargeEnd);
  }

  Serial.println("Please scan a card");
  success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, reader_delay);
  if (success) {
    // Display some basic information about the card
    Serial.println("Found an ISO14443A card");

    Serial.println("We'll update the charge time despite not yet validating the card for now...");

    Serial.print("Current rtc time ");
    PrintDateTime(rtc.now());

    SetChargeEndTime();
    Serial.print("Current charge end time is ");
    PrintDateTime(chargeEnd);

    digitalWrite(relayPin, HIGH);

    Serial.print("  UID Length: "); Serial.print(uidLength, DEC); Serial.println(" bytes");
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
    // while (!Serial.available());
    while (Serial.available()) {
      Serial.read();
    }
    Serial.flush();
  }
  else

  {
    Serial.println("nfc.readPassiveTargetID Failed");
  }

  PrintDateTime(rtc.now());

  Serial.println();


  //delay(3000);  we don't need the delay since we're waiting for the card earlier in the loop
}

//Functions defined in the Sketch for the Sketch
uint32_t GetChargeEndTime()
{
  EEPROM.get(chargeEndAddress, chargeEnd);
}

// Adds 8 hours to current time and sets it in eeprom to address 0 length of 32 bits
void SetChargeEndTime()
{
  DateTime now = rtc.now();
  chargeEnd = now.unixtime() + 10; // current time + 8 hours
  EEPROM.put(chargeEndAddress, chargeEnd);
}

void PrintDateTime(DateTime time)
{
  Serial.print(time.year(), DEC);
  Serial.print('/');
  Serial.print(time.month(), DEC);
  Serial.print('/');
  Serial.print(time.day(), DEC);
  Serial.print(" (");
  Serial.print(daysOfTheWeek[time.dayOfTheWeek()]);
  Serial.print(") ");
  Serial.print(time.hour(), DEC);
  Serial.print(':');
  Serial.print(time.minute(), DEC);
  Serial.print(':');
  Serial.print(time.second(), DEC);
  Serial.println();
}
