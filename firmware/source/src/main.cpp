#include <Arduino.h>
#include <Adafruit_PN532.h>
#include <EEPROM.h>
#include "Authentication_Library.h"
#include "RTClib.h"
#include "RelayManager.h"

RelayManager mRelayManager(2);
Adafruit_PN532 NFC(2, 3);
RTC_DS3231 rtc;

uint8_t success;                       // defines a variable to check the success of an NFC card scan
String cardRecord;                     // defines a variable to check the success of an NFC record scan
uint8_t uid[] = {0, 0, 0, 0, 0, 0, 0}; // Buffer to store the returned UID after NFC card scan
uint8_t uidLength;                     // Length of the UID (4 or 7 bytes depending on ISO14443A card type) for NFC card scan
uint16_t timeout = 5000;               // defines a variable to timeout the card reader function, in ms
char rx_byte = 0;                      // stores input from serial monitor
uint32_t chargeStart;                  // defines a variable to store the charge Start time
int chargeStartAddress = 0;
char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

void PrintDateTime(DateTime time);

void setup()
{
  Serial.begin(9600);
  delay(100);

  Serial.println(EEPROM.length());
  for (int i = 0; i <= EEPROM.length(); i++)
  {
    EEPROM.write(i, 0);
    Serial.println(i);
  }
  Serial.println("eeprom - check");
  if (!rtc.begin())
  {
    Serial.println("Couldn't find RTC");
    while (1)
      ; // I think we're going to eventually do something different, I don't want the outlet to fail if the RTC fails
  }
  Serial.println("rtc - check");
  PrintDateTime(rtc.now());

  Serial.print("LOST POWER ");
  Serial.println(rtc.lostPower());
  if (rtc.lostPower())
  {
    Serial.println("RTC lost power, lets set the time!");
    // following line sets the RTC to the date & time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)) + 10); // This sets the RTC time to the time the sketch was compiled.  It takes 10 seconds from compiling to get to this function, so I add 10 seconds to the time
    Serial.println("RTC time set to serial time");
    PrintDateTime(rtc.now());
  }
  PrintDateTime(rtc.now());

  //SPI.begin();
  delay(1000);
  NFC.begin();
  Serial.println("nfc began");
  delay(1000);
  Serial.println("Getting data");
  uint32_t versiondata = NFC.getFirmwareVersion();
  Serial.println("Got data");
  Serial.println(versiondata);
  if (!versiondata)
  {
    Serial.print("Didn't find PN53x board");
    while (1)
      ; // I think we're going to eventually do something different, I don't want the outlet to fail if the NFC reader fails
  }
  Serial.println(versiondata);

  success = NFC.SAMConfig(); // configure board to read RFID tags
  Serial.print("SAM Config: ");
  Serial.println(success);
  Serial.println("NFC - check");
  switch (random(0, 3))
  {
  case 0:
    randomSeed(analogRead(A0));
    break;
  case 1:
    randomSeed(analogRead(A1));
    break;
  case 2:
    randomSeed(analogRead(A2));
    break;
  default:
    randomSeed(analogRead(A3));
    break;
  }
}

void loop()
{
  //mRelayManager.Test();

  rx_byte = 0;
  Serial.flush();
  Serial.println("Enter A to program Admin card, or Enter C to program Commuter card");
  while (!Serial.available())
  {
  }
  if (Serial.available() > 0)
  {                         // is a character available?
    char c = Serial.read(); // get the character
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
  delay(7000);
  Serial.println("please scan an NTAG 215 nfc card");
  success = NFC.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);
  Serial.println(success);
  if (success)
  {
    // Display some basic information about the card
    Serial.print("  UID Length: ");
    Serial.print(uidLength, DEC);
    Serial.println(" bytes");
    Serial.print("  UID Value: ");
    NFC.PrintHex(uid, uidLength);

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
        // String randomKey = keyDB.GeneratePsuedoRandomKey();
        // //SetCardRecord(i, randomKey);
        // delay(10);
        // //PrintCardRecord(i);
      }

      if (rx_byte == 'A')
      {
        // Serial.println("setting Admin code");
        // String key = keyDB.validAdminKeys[0];
        // SetCardRecord(keyDB.initializationPageOne, key.substring(0, 4));
        // delay(10);
        // PrintCardRecord(keyDB.initializationPageOne);
        // SetCardRecord(keyDB.initializationPageTwo, key.substring(4, 8));
        // delay(10);
        // PrintCardRecord(keyDB.initializationPageTwo);
      }
      if (rx_byte == 'C')
      {
        // Serial.println("setting Commuter code");
        // String key = keyDB.validOneTimeKeys[0];
        // SetCardRecord(keyDB.initializationPageOne, key.substring(0, 4));
        // delay(10);
        // PrintCardRecord(keyDB.initializationPageOne);
        // SetCardRecord(keyDB.initializationPageTwo, key.substring(4, 8));
        // delay(10);
        // PrintCardRecord(keyDB.initializationPageTwo);
      }
    }
    else
    {
      Serial.println("This doesn't seem to be an NTAG203 tag (UUID length != 7 bytes)!");
    }

    // Wait a bit before trying again
    Serial.println("save successful");

    PrintDateTime(rtc.now());
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

void SetCardRecord(uint8_t page, String key)
{
  uint8_t buf[6];
  memset(buf, 0, sizeof(buf));

  //key.toCharArray(buf,5);

  success = NFC.ntag2xx_WritePage(page, buf);
  byte i = 1;
  while (!success && i <= 10)
  {
    Serial.println("Unable to write to the requested page! retrying");
    delay(100);
    success = NFC.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength);
    if (success)
    {
      success = NFC.ntag2xx_WritePage(page, buf);
    }
    i = i + 1;
  }
}

void PrintCardRecord(uint8_t page)
{
  uint8_t data[32];

  success = NFC.ntag2xx_ReadPage(page, data);
  Serial.print("Page ");
  Serial.print(page);
  Serial.print(": ");

  if (success)
  {
    // Dump the page data
    NFC.PrintHexChar(data, 4);
  }

  byte i = 1;
  while (!success && i <= 10)
  {
    Serial.println("Unable to read the requested page! retrying");
    delay(100);
    success = NFC.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength);
    if (success)
    {
      success = NFC.ntag2xx_ReadPage(page, data);
      NFC.PrintHexChar(data, 4);
    }
    i = i + 1;
  }
}