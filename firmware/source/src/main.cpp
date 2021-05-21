#include <Arduino.h>
#include <Adafruit_PN532.h>
#include <EEPROM.h>
#include "RTClib.h"
#include "RelayManager.h"

RelayManager mRelayManager(2);
Adafruit_PN532 NFC(8);
RTC_DS3231 rtc;

char rx_byte = 0;
char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

void PrintDateTime(DateTime time);

void setup()
{
  Serial.begin(115200);
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

  if (rtc.lostPower())
  {
    Serial.println("RTC lost power, lets set the time!");
    // following line sets the RTC to the date & time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)) + 10);  // This sets the RTC time to the time the sketch was compiled.  It takes 10 seconds from compiling to get to this function, so I add 10 seconds to the time
    Serial.println("RTC time set to serial time");
    PrintDateTime(rtc.now());
  }
  PrintDateTime(rtc.now());

  // SPI.begin();
  // delay(1000);
  // NFC.begin();
  // Serial.println("nfc began");
  // delay(1000);
  // uint32_t versiondata = NFC.getFirmwareVersion();
  // Serial.println(versiondata);
  // if (! versiondata)
  // {
  //   Serial.print("Didn't find PN53x board");
  //   while (1);                              // I think we're going to eventually do something different, I don't want the outlet to fail if the NFC reader fails
  // }
  // Serial.println(versiondata);

  // NFC.SAMConfig();                          // configure board to read RFID tags
  // Serial.println("NFC - check");
  // switch(random(0,3))
  // {
  //   case 0:randomSeed(analogRead(A0));
  //   break;
  //   case 1:randomSeed(analogRead(A1));
  //   break;
  //   case 2:randomSeed(analogRead(A2));
  //   break;
  //   default:randomSeed(analogRead(A3));
  //   break;
  // }
}

void loop()
{
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

  PrintDateTime(rtc.now());
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

  // Serial.println(EEPROM.length());
  // for (int i = 0 ; i <= EEPROM.length() ; i++)
  // {
  //   EEPROM.write(i, 0);
  //   Serial.println(i);
  // }
  // Serial.println("eeprom - check");
  // if (! rtc.begin())
  // {
  //   Serial.println("Couldn't find RTC");
  //   while (1);                  // I think we're going to eventually do something different, I don't want the outlet to fail if the RTC fails
  // }
  // Serial.println("rtc - check");
  // PrintDateTime(rtc.now());

  // if (rtc.lostPower())
  // {
  //   Serial.println("RTC lost power, lets set the time!");
  //   // following line sets the RTC to the date & time this sketch was compiled
  //   rtc.adjust(DateTime(F(__DATE__), F(__TIME__)) + 10);  // This sets the RTC time to the time the sketch was compiled.  It takes 10 seconds from compiling to get to this function, so I add 10 seconds to the time
  //   Serial.println("RTC time set to serial time");
  //   PrintDateTime(rtc.now());
  // }
  // PrintDateTime(rtc.now());
  // SetChargeStartTime();

  // nfc.begin();
  // delay(100);
  // Serial.println("nfc began");
  // uint32_t versiondata = nfc.getFirmwareVersion();
  // Serial.println("nfc firmware success");
  // Serial.println(versiondata);
  // if (! versiondata)
  // {
  //   Serial.print("Didn't find PN53x board");
  //   while (1);                              // I think we're going to eventually do something different, I don't want the outlet to fail if the NFC reader fails
  // }
  // //  nfc.setPassiveActivationRetries(0xFF);  // Sets the maximum number of retries.  0xFF retries forever.  Currently using a timeout function in success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);

  // nfc.SAMConfig();                          // configure board to read RFID tags
  // Serial.println("NFC - check");
}