/*------------------( Include Libraries )-------------------------------*/
#include "RTClib.h"                     // For use with DS3231 to keep time when disconnected includes Date and time functions using a DS3231 RTC connected via I2C and Wire lib
#include <Wire.h>                       // Used in serial communication
#include <SPI.h>                        // Used in serial communication
#include <EEPROM.h>                     // For persistent storage of data when disconnected (future charge expiration time, verified key ids, etc.)
#include <Adafruit_PN532.h>             // For use with a PN532 to interact with RFID cards
#include <Authentication_Library.h>

/*---------------( Declare Constants and Pin Numbers )-----------------*/
// If using the breakout with SPI, define the pins for hardware SPI communication.
//#define PN532_SCK  (13)
//#define PN532_MISO (12)
//#define PN532_MOSI (11)
#define PN532_SS   (8)

uint8_t success;                          // defines a variable to check the success of an NFC card scan
String cardRecord;                        // defines a variable to check the success of an NFC record scan
uint8_t uid[] = { 0, 0, 0, 0, 0, 0, 0 };  // Buffer to store the returned UID after NFC card scan
uint8_t uidLength;                        // Length of the UID (4 or 7 bytes depending on ISO14443A card type) for NFC card scan
uint16_t timeout = 5000;                  // defines a variable to timeout the card reader function, in ms
char rx_byte = 0;                         // stores input from serial monitor
uint32_t chargeStart;                     // defines a variable to store the charge Start time
int chargeStartAddress = 0;               // defines a variable to set the address location for the charge Start time in the EEPROM
char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
//uint8_t record[32];

/*-------------------------( Declare objects )--------------------------*/
//Adafruit_PN532 nfc(PN532_SCK, PN532_MISO, PN532_MOSI, PN532_SS); // Create a nfc object for a breakout with a software SPI connection
// Adapted to a breakout with a hardware SPI connection.  Note that
// the PN532 SCK, MOSI, and MISO pins need to be connected to the Arduino's
// hardware SPI SCK, MOSI, and MISO pins.  On an Arduino Nano Every these are
// SCK = 13, MOSI = 11, MISO = 12.  The SS line can be any digital IO pin, which we have assigned to digital pin 8 above.
Adafruit_PN532 nfc(PN532_SS);
RTC_DS3231 rtc; // Create a RealTimeClock object

// For the purpose of random number generation we use analog readings from analog pins 0-3 and 6-7.
// They should remain unplugged or the library should be modified to adapt.

KeyDatabase keyDB;
void setup(void) {
 Serial.begin(9600);
 delay(100);
 SPI.begin();
 delay(3000);                  // wait for console opening

  Serial.println(EEPROM.length());
  for (int i = 0 ; i <= EEPROM.length() ; i++) 
  {
    EEPROM.write(i, 0);
    Serial.println(i);
  }
  Serial.println("eeprom - check");
  if (! rtc.begin())
  {
    Serial.println("Couldn't find RTC");
    while (1);                  // I think we're going to eventually do something different, I don't want the outlet to fail if the RTC fails
  }
  Serial.println("rtc - check");
  PrintDateTime(rtc.now());
  
  if (rtc.lostPower())
  {
    Serial.println("RTC lost power, lets set the time!");
    // following line sets the RTC to the date & time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)) + 10);  // This sets the RTC time to the time the sketch was compiled.  It takes 10 seconds from compiling to get to this function, so I add 10 seconds to the time
    Serial.println("RTC time set to serial time");
    PrintDateTime(rtc.now());
  }
  PrintDateTime(rtc.now());
  SetChargeStartTime(); 
   
  nfc.begin();
  delay(100);
  Serial.println("nfc began");
 uint32_t versiondata = nfc.getFirmwareVersion();
 Serial.println("nfc firmware success");
 Serial.println(versiondata);
  if (! versiondata)
  {
    Serial.print("Didn't find PN53x board");
    while (1);                              // I think we're going to eventually do something different, I don't want the outlet to fail if the NFC reader fails
  }
  //  nfc.setPassiveActivationRetries(0xFF);  // Sets the maximum number of retries.  0xFF retries forever.  Currently using a timeout function in success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);
 
  nfc.SAMConfig();                          // configure board to read RFID tags 
   Serial.println("NFC - check");

}

void loop(void) {
  rx_byte = 0;
  PrintDateTime(rtc.now());
  Serial.println("Enter A to program Admin card, or Enter C to program Commuter card");
  while(!Serial.available()){}
  if (Serial.available() > 0) {    // is a character available?
    char c = Serial.read();       // get the character
    if (c == 'A' || c == 'C')
    {
      rx_byte = c;
      Serial.println(rx_byte);
    }
    
  }
      if (rx_byte == 'A')
        Serial.println("programming as an Admin card");
      else if (rx_byte == 'C')
        Serial.println("programming as an Commuter card");
      else
        Serial.println("this'll be a useless card");
    
  Serial.println("please scan an NTAG 215 nfc card");
  success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);
    if (success) 
      { 
        // Display some basic information about the card
        Serial.print("  UID Length: "); 
        Serial.print(uidLength, DEC); 
        Serial.println(" bytes");
        Serial.print("  UID Value: ");
        nfc.PrintHex(uid, uidLength);
            
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

      Serial.println("");
      Serial.println("Writing randomly generated codes to pages 4..129");
      Serial.println("");
      for (uint8_t i = 4; i <= 129; i++) 
      {
        String randomKey = keyDB.GeneratePsuedoRandomKey();
        Serial.println(randomKey);
        SetCardRecord(i, randomKey);
        delay(10);
        PrintCardRecord(i);
      }    
       
       if (rx_byte == 'A')
       {
        Serial.println("setting Admin code");  
        String key = keyDB.validAdminKeys[0];
        SetCardRecord(keyDB.initializationPageOne, key.substring(0,4));
        delay(10);
        PrintCardRecord(keyDB.initializationPageOne);
        SetCardRecord(keyDB.initializationPageTwo, key.substring(4,8));
        delay(10);
        PrintCardRecord(keyDB.initializationPageTwo);
       }  
       if (rx_byte == 'C')
       {
        Serial.println("setting Commuter code");  
        String key = keyDB.validOneTimeKeys[0];
        SetCardRecord(keyDB.initializationPageOne, key.substring(0,4));
        delay(10);
        PrintCardRecord(keyDB.initializationPageOne);
        SetCardRecord(keyDB.initializationPageTwo, key.substring(4,8));
        delay(10);
        PrintCardRecord(keyDB.initializationPageTwo);
       }  
    }
    else
    {
      Serial.println("This doesn't seem to be an NTAG203 tag (UUID length != 7 bytes)!");
    }
    
    // Wait a bit before trying again
    Serial.println("save successful");
}
delay(3000);
Serial.flush(); 
while(Serial.available()){Serial.read();}
}

void SetChargeStartTime()
{
  DateTime now = rtc.now();
  chargeStart = now.unixtime();     // saves current time when function is called
  EEPROM.put(chargeStartAddress, chargeStart);
}

void SetCardRecord(uint8_t page, String key)
{
//    Serial.println(page);
    char buf[6];
    memset(buf,0,sizeof(buf));
//    Serial.println(buf);
    key.toCharArray(buf,5);
//    Serial.println(buf[0]);
//    Serial.println(buf[1]);
//    Serial.println(buf[2]);
//    Serial.println(buf[3]);
//    Serial.println(buf[4]);
//    Serial.println(buf[5]);
//    Serial.println(buf);
//    Serial.println(key);
    nfc.ntag2xx_WritePage(page, buf);  
}

void PrintCardRecord(uint8_t page)
{
    uint8_t data[32];
    success = nfc.ntag2xx_ReadPage(page, data);
    Serial.print("Page ");
    Serial.print(page);
    Serial.print(": ");
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
