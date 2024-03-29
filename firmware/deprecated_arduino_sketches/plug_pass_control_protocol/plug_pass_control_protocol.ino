/*------------------( Include Libraries )-------------------------------*/
#include "RTClib.h"                     // For use with DS3231 to keep time when disconnected includes Date and time functions using a DS3231 RTC connected via I2C and Wire lib
#include <Wire.h>                       // Used in serial communication
#include <SPI.h>                        // Used in serial communication
#include <EEPROM.h>                     // For persistent storage of data when disconnected (future charge expiration time, verified key ids, etc.)
#include <Adafruit_PN532.h>             // For use with a PN532 to interact with RFID cards
#include <Authentication_Library.h>

/*---------------( Declare Constants and Pin Numbers )-----------------*/
// If using the breakout with SPI, define the pins for SPI communication.
//#define PN532_SCK  (13)
//#define PN532_MISO (12)
//#define PN532_MOSI (11)
#define PN532_SS   (8)

char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int relayPin = 2;                        // defines a variable to set the outut pin to D12
int chargeStartAddress = 0;               // defines a variable to set the address location for the charge Start time in the EEPROM
uint32_t chargeStart;                     // defines a variable to store the charge Start time
uint8_t chargeStatus = 0;                 // defining a dummy variable to hold the most recent command to turn off or on the outlet
uint8_t success;                          // defines a variable to check the success of an NFC card scan
bool pass;
bool red;
String cardRecord;                        // defines a variable to check the success of an NFC record scan
uint8_t startPage = 4;
uint8_t stopPage = 5;
uint8_t uid[] = { 0, 0, 0, 0, 0, 0, 0 };  // Buffer to store the returned UID after NFC card scan
uint8_t record[] = { 0, 0, 0, 0, 0, 0, 0 };  // Buffer to store the returned record after NFC card scan
uint8_t uidLength;                        // Length of the UID (4 or 7 bytes depending on ISO14443A card type) for NFC card scan
uint16_t timeout = 5000;                  // defines a variable to timeout the card reader function, in ms
uint32_t chargeTime = 1440;                 // defines the amount of time, in seconds, a standard charging time will be

/*-------------------------( Declare objects )--------------------------*/
//Adafruit_PN532 nfc(PN532_SCK, PN532_MISO, PN532_MOSI, PN532_SS); // Create a nfc object for a breakout with a software SPI connection
// Adapted to a breakout with a hardware SPI connection.  Note that
// the PN532 SCK, MOSI, and MISO pins need to be connected to the Arduino's
// hardware SPI SCK, MOSI, and MISO pins.  On an Arduino Nano Every these are
// SCK = 13, MOSI = 11, MISO = 12.  The SS line can be any digital IO pin, which we have assigned to digital pin 8 above.
Adafruit_PN532 nfc(PN532_SS);
RTC_DS3231 rtc; // Create a RealTimeClock object
KeyDatabase keyDB;

/*-------------------------------( Set up )-----------------------------*/
void setup ()
{/*------------------( Include Libraries )-------------------------------*/
#include "RTClib.h"                     // For use with DS3231 to keep time when disconnected includes Date and time functions using a DS3231 RTC connected via I2C and Wire lib
#include <Wire.h>                       // Used in serial communication
#include <SPI.h>                        // Used in serial communication
#include <EEPROM.h>                     // For persistent storage of data when disconnected (future charge expiration time, verified key ids, etc.)
#include <Adafruit_PN532.h>             // For use with a PN532 to interact with RFID cards
#include <Authentication_Library.h>

/*---------------( Declare Constants and Pin Numbers )-----------------*/
// If using the breakout with SPI, define the pins for SPI communication.
//#define PN532_SCK  (13)
//#define PN532_MISO (12)
//#define PN532_MOSI (11)
#define PN532_SS   (8)

char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int relayPin = 2;                        // defines a variable to set the outut pin to D12
int chargeEndAddress = 0;               // defines a variable to set the address location for the charge Start time in the EEPROM
uint32_t chargeEnd;                     // defines a variable to store the charge end time
uint8_t chargeStatus = 0;                 // defining a dummy variable to hold the most recent command to turn off or on the outlet
uint8_t success;                          // defines a variable to check the success of an NFC card scan
bool pass;
bool red;
String cardRecord;                        // defines a variable to check the success of an NFC record scan
uint8_t startPage = 4;
uint8_t stopPage = 5;
uint8_t uid[] = { 0, 0, 0, 0, 0, 0, 0 };  // Buffer to store the returned UID after NFC card scan
uint8_t record[] = { 0, 0, 0, 0, 0, 0, 0 };  // Buffer to store the returned record after NFC card scan
uint8_t uidLength;                        // Length of the UID (4 or 7 bytes depending on ISO14443A card type) for NFC card scan
uint16_t timeout = 5000;                  // defines a variable to timeout the card reader function, in ms
uint32_t chargeTime = 86400;                 // defines the amount of time, in seconds, a standard charging time will be

/*-------------------------( Declare objects )--------------------------*/
//Adafruit_PN532 nfc(PN532_SCK, PN532_MISO, PN532_MOSI, PN532_SS); // Create a nfc object for a breakout with a software SPI connection
// Adapted to a breakout with a hardware SPI connection.  Note that
// the PN532 SCK, MOSI, and MISO pins need to be connected to the Arduino's
// hardware SPI SCK, MOSI, and MISO pins.  On an Arduino Nano Every these are
// SCK = 13, MOSI = 11, MISO = 12.  The SS line can be any digital IO pin, which we have assigned to digital pin 8 above.
Adafruit_PN532 nfc(PN532_SS);
RTC_DS3231 rtc; // Create a RealTimeClock object
KeyDatabase keyDB;

/*-------------------------------( Set up )-----------------------------*/
void setup ()
{
  Serial.begin(9600);
  delay(1000);
  SPI.begin();
  delay(1000);                  // wait for console opening
  pinMode(relayPin, OUTPUT);    // establishing the relayPin as an OUTPUT
  pinMode(LED_BUILTIN, OUTPUT); // establishes built in LED pin as an output
  byte i = 1;
  while (! rtc.begin() && i <= 10 )
  {
    Serial.println("Couldn't find RTC");
    Serial.println("attempting to reconnected");
    digitalWrite(relayPin, LOW);
    digitalWrite(relayPin, HIGH);
    delay(1000);
    digitalWrite(relayPin, LOW);
    delay(3000);
    //Serial.print("Temperature: ");
    //Serial.print(rtc.getTemperature());
    //Serial.println(" C");
    //Serial.print("voltage: ");
    //int b_A7 = analogRead(A7);
    //float v_A7 = b_A7 * (5.0 / 1023.0);
    //Serial.println(v_A7);
    //while (1);                  // I think we're going to eventually do something different, I don't want the outlet to fail if the RTC fails
  }
  if (! rtc.begin())
  {
    Serial.println("Couldn't find RTC, reconnection attempts failed");
    //EEPROM.put(40, analogRead(A7));
    while (1);
  }
  EEPROM.get(chargeEndAddress, chargeEnd);
  if (rtc.lostPower())
  {
    Serial.println("RTC lost power, lets set the time!");
    // following line sets the RTC to the date & time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)) + 10);  // This sets the RTC time to the time the sketch was compiled.  It takes 10 seconds from compiling to get to this function, so I add 10 seconds to the time
    Serial.println("RTC time set to serial time");
    PrintDateTime(rtc.now());
  }

  if ((chargeEnd) > rtc.now().unixtime())
  {
    Serial.println("Charge End in future, Continuing charging");
    Serial.print("Current rtc time ");
    PrintDateTime(rtc.now());
    Serial.print("Charge end time ");
    PrintDateTime(chargeEnd);
    digitalWrite(relayPin, HIGH);       //if the chargeEnd time stored in the Arduino's EEPROM is in the future, close the relay
    chargeStatus = 1;                   // set dummy variable to 1 as "on"
    digitalWrite(LED_BUILTIN, HIGH);    // turn the LED on
  }
  else
  {
    Serial.println("Last charge ended before restart");
    Serial.print("Last charge end time ");
    PrintDateTime(chargeEnd);
    Serial.println("Current rtc time ");
    PrintDateTime(rtc.now());
    digitalWrite(relayPin, LOW);        //if the chargeEnd time stored in the Arduino's EEPROM is in the past, open the relay
    chargeStatus = 0;                   // set dummy variable to 1 as "off"
    digitalWrite(LED_BUILTIN, LOW);     // turn the LED off
  }

  nfc.begin();
  uint32_t versiondata = nfc.getFirmwareVersion();
  i = 1;
  while (i<=10 && ! versiondata)
    {
      Serial.println("Didn't find PN53x board");
      Serial.println("attempting to restart SPI connection");
      digitalWrite(relayPin, LOW);
      digitalWrite(relayPin, HIGH);
      delay(3000);
      digitalWrite(relayPin, LOW);
      delay(100);
      digitalWrite(relayPin, HIGH);
      delay(3000);
      digitalWrite(relayPin, LOW);
      delay(3000);
      SPI.begin(); 
      delay(100);
      nfc.begin();
      success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);
      if (success)
      {
        i=11;
      }
      uint32_t versiondata = nfc.getFirmwareVersion();
      //Serial.print("Temperature: ");
      //Serial.print(rtc.getTemperature());
      //Serial.println(" C");
      //Serial.print("voltage: ");
      //int b_A7 = analogRead(A7);
      //float v_A7 = b_A7 * (5.0 / 1023.0);
      //Serial.println(v_A7);
      Serial.println(i);
      i=i+1;
    }
    if ( ! versiondata  && !success)
    {
      Serial.println("Didn't find PN53x board, reconnection attempts failed");
      //EEPROM.put(40, analogRead(A7));
      while (1); // halt
    }
  
//  nfc.setPassiveActivationRetries(0xFF);  // Sets the maximum number of retries.  0xFF retries forever.  Currently using a timeout function in success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);
  nfc.SAMConfig();                          // configure board to read RFID tags
    switch(random(0,3))
    {
      case 0:randomSeed(analogRead(A0));
      break;
      case 1:randomSeed(analogRead(A1));
      break;
      case 2:randomSeed(analogRead(A2));
      break;
      default:randomSeed(analogRead(A3));
      break;
    }
}

/*---------------------------( Main Loop )-----------------------------*/
void loop ()
{
  if ((chargeEnd) < rtc.now().unixtime())
  {
    digitalWrite(relayPin, LOW);
    chargeStatus = 0;                   // set dummy variable to 1 as "off"
    digitalWrite(LED_BUILTIN, LOW);     // turn the LED off
  }
  uint8_t pageOne = EEPROM.read(20);
  uint8_t pageTwo = EEPROM.read(21);
  uint8_t firstTime = EEPROM.read(22);
  GetStoredCode();

//  if (digitalRead(relayPin) == LOW)
//  {
//    Serial.println("charging expired, relay opened");
//    Serial.println("Please scan a card to start charging");
//  }
//  else
//  {
//    Serial.println("current time ");
//    PrintDateTime(rtc.now());
//    Serial.println("charge time ends ");
//    PrintDateTime(chargeEnd);
//    Serial.println("Scan a card to stop charging");
//  }

  // When an NTAG203 card is found 'uid' will be populated with
  // the UID, and uidLength will indicate the size of the UUID (normally 7)
  // added a timeout to the card reading function.  it'll wait 5 seconds for a card, then move on.
  success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);
  
  if (success) 
  { 
    // Display some basic information about the card
//    Serial.print("  UID Length: "); 
//    Serial.print(uidLength, DEC); 
//    Serial.println(" bytes");
//    Serial.print("  UID Value: ");
//    nfc.PrintHex(uid, uidLength);
      
   String initializationRecord;
   red = GetCardRecord(keyDB.initializationPageOne, keyDB.initializationPageTwo);
   if(red == true)
   {
    initializationRecord = cardRecord;
    Serial.println(cardRecord);
   }
    bool admin;
    admin = keyDB.Admin(initializationRecord);
    
    bool first;
    first = keyDB.Initialization(initializationRecord);
    if(first && firstTime ==1)
    {
        String key = keyDB.replacementKey;
        SetCardRecord(keyDB.initializationPageOne, key.substring(0,4));
        SetCardRecord(keyDB.initializationPageTwo, key.substring(4,8));
    }

   String commuterRecord;
   red = false;
   red = GetCardRecord(pageOne, pageTwo);
   if(red == true)
   {
    commuterRecord = cardRecord;
    Serial.println(cardRecord);
   }
    bool commuter;
    commuter = (commuterRecord == GetStoredCode());

    bool valid = false;

    if(admin)
    {
      //Serial.println("Card validated");  
        Serial.print("Admin record: ");  
        Serial.println(initializationRecord);
        valid = true;
    }
    else if(commuter)
    {
        uint8_t newPageOne = random(4,130);
        uint8_t newPageTwo = random(4,130);
        red = false;
        red = GetCardRecord(newPageOne,newPageTwo);
        if(red == true)
        {
          SetStoredCode(cardRecord);
          Serial.println(cardRecord);
          EEPROM.put(20, newPageOne);
          EEPROM.put(21, newPageTwo);
          Serial.print("newPageOne: ");
          Serial.println(newPageOne);
          Serial.print("newPageTwo: ");
          Serial.println(newPageTwo);
        }
        valid = true;
        //Serial.println("Card validated");  
    }
    else if(first && firstTime !=1)
    {
        uint8_t newPageOne = random(4,130);
        uint8_t newPageTwo = random(4,130);
        red = false;
        red = GetCardRecord(newPageOne,newPageTwo);
        if(red == true)
        {
          SetStoredCode(cardRecord);
          EEPROM.put(20, newPageOne);
          EEPROM.put(21, newPageTwo);
          EEPROM.put(22, 1);
          Serial.print("newPageOne: ");
          Serial.println(newPageOne);
          Serial.print("newPagTwo: ");
          Serial.println(newPageTwo);
          String key = keyDB.replacementKey;
          SetCardRecord(keyDB.initializationPageOne, key.substring(0,4));
          SetCardRecord(keyDB.initializationPageTwo, key.substring(4,8));
          valid = true;
          //Serial.println("Card validated");  
        }
    }    
    
    if(valid)
    {
      Serial.println("Card validated");  
      if (chargeStatus == 0)              // if the outlet is off
      { 
        digitalWrite(relayPin, HIGH);     // Close the relay
        chargeStatus = 1;                 // set dummy variable to 1 as "on"
        digitalWrite(LED_BUILTIN, HIGH);  // turn the LED on
        // Display some basic information about the card
        Serial.println("Initiating charging");
        Serial.print("Current rtc time ");
        PrintDateTime(rtc.now());
        DateTime now = rtc.now();
        chargeEnd = now.unixtime() + chargeTime;     // saves current time when function is called
        EEPROM.put(chargeEndAddress, chargeEnd);
        Serial.print("Current charge end time is ");
        PrintDateTime(chargeEnd);
        delay(1000);                      // adding a delay to prevent inadvertent rescans
      }
      else
      {
        // Open the relay
        Serial.println("Using the NFC card to open the relay");      
        digitalWrite(relayPin, LOW);
        DateTime now = rtc.now();
        chargeEnd = now.unixtime();     // saves current time when function is called
        EEPROM.put(chargeEndAddress, chargeEnd);
        chargeStatus = 0;                 // set dummy variable to 1 as "off"
        digitalWrite(LED_BUILTIN, LOW);   // turn the LED off
        delay(1000);                      // adding a delay to prevent inadvertent rescans
      }
    }
    else
    {
      Serial.println("The card is invalid, no action taken");
      delay(1000);                      // adding a delay to prevent inadvertent rescans

    }
//    Serial.println();
//    Serial.flush();
  }
//  Serial.println();
//    Serial.print("Temperature: ");
//    Serial.print(rtc.getTemperature());
//    Serial.println(" C");
//    Serial.print("voltage: ");
//    int b_A7 = analogRead(A7);
//    Serial.println(b_A7);
//    float v_A7 = b_A7 * (5.0 / 1023.0);
//    Serial.println(v_A7);
//    EEPROM.put(40, analogRead(A7));
//    int e_A7;
//    EEPROM.get(40, e_A7);
//    Serial.println(e_A7);
  
}

/*---------------( Functions defined in the Sketch for the Sketch )------------*/
// returns the time of the most recent successful NFC scan
//uint32_t GetChargeEndTime()
//{
//  EEPROM.get(chargeEndAddress, chargeEnd);
//}

// Sets the current time in eeprom to address 0 length of 32 bits
//void SetChargeEndTime()
//{
//  DateTime now = rtc.now();
//  chargeEnd = now.unixtime() + chargeTime;     // saves current time when function is called
//  EEPROM.put(chargeEndAddress, chargeEnd);
//}

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

bool GetCardRecord(uint8_t firstPage, uint8_t secondPage)
{
    bool returnValue;
    String stringValue;
    String pageValue;
    bool success_p1 = false;
    bool success_p2 = false;

      success_p1 = nfc.ntag2xx_ReadPage(firstPage, record);   
        for(byte i=0; i < 4; i++)
        {
          //returnValue.concat(String(record[i] < 0x10 ? " 0" : " "));
          pageValue.concat(String((char)record[i]));
        }
        //Serial.println(success_p1);
      success_p2 = nfc.ntag2xx_ReadPage(secondPage, record);  
        for(byte i=0; i < 4; i++)
        {
          //returnValue.concat(String(record[i] < 0x10 ? " 0" : " "));
          pageValue.concat(String((char)record[i]));
        }
        //Serial.println(success_p2);
     returnValue = (success_p1 && success_p2);
     
     if(returnValue == true)
     {
      stringValue.concat(pageValue);
      cardRecord = stringValue.substring(0);
     }

    //Serial.println(returnValue);
    return returnValue;
}

void SetCardRecord(uint8_t page, String key)
{
    char buf[31];
    key.toCharArray(buf,30);
    nfc.ntag2xx_WritePage(4, buf);  
}

void SetStoredCode(String key)
{
  byte value;
  //Serial.println(key);
  //Serial.println(randoKey, HEX);
    for(byte i=0; i<8; i++)
    {
      byte k = i+10;
      EEPROM.put(k, key[i]);
//      value = EEPROM.read(k);
//      Serial.print(k);
//      Serial.print("\t");
//      Serial.print(value, HEX);
//      Serial.println();
    }         
  Serial.println("code set in EEPROM");
}

String GetStoredCode()
{
    String returnValue;
    for(byte k=10; k<18; k++)
    {
      returnValue.concat(String((char)EEPROM.read(k)));
    }
//    Serial.println(returnValue);    
//    Serial.println("code recovered from EEPROM");
    return returnValue.substring(0);
}
  Serial.begin(9600);
  delay(1000);
  SPI.begin();
  delay(1000);                  // wait for console opening
  pinMode(relayPin, OUTPUT);    // establishing the relayPin as an OUTPUT
  pinMode(LED_BUILTIN, OUTPUT); // establishes built in LED pin as an output
  byte i = 1;
  while (! rtc.begin() && i <= 10 )
  {
    Serial.println("Couldn't find RTC");
    Serial.println("attempting to reconnected");
    digitalWrite(relayPin, LOW);
    digitalWrite(relayPin, HIGH);
    delay(1000);
    digitalWrite(relayPin, LOW);
    delay(3000);
    //Serial.print("Temperature: ");
    //Serial.print(rtc.getTemperature());
    //Serial.println(" C");
    //Serial.print("voltage: ");
    //int b_A7 = analogRead(A7);
    //float v_A7 = b_A7 * (5.0 / 1023.0);
    //Serial.println(v_A7);
    //while (1);                  // I think we're going to eventually do something different, I don't want the outlet to fail if the RTC fails
  }
  if (! rtc.begin())
  {
    Serial.println("Couldn't find RTC, reconnection attempts failed");
    //EEPROM.put(40, analogRead(A7));
    while (1);
  }
  GetChargeStartTime();
  if (rtc.lostPower())
  {
    Serial.println("RTC lost power, lets set the time!");
    // following line sets the RTC to the date & time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)) + 10);  // This sets the RTC time to the time the sketch was compiled.  It takes 10 seconds from compiling to get to this function, so I add 10 seconds to the time
    Serial.println("RTC time set to serial time");
    PrintDateTime(rtc.now());
  }

  if ((chargeStart + chargeTime) > rtc.now().unixtime())
  {
    Serial.println("Charge End in future, Continuing charging");
    Serial.print("Current rtc time ");
    PrintDateTime(rtc.now());
    Serial.print("Charge end time ");
    PrintDateTime(chargeStart);
    digitalWrite(relayPin, HIGH);       //if the chargeStart time stored in the Arduino's EEPROM is in the future, close the relay
    chargeStatus = 1;                   // set dummy variable to 1 as "on"
    digitalWrite(LED_BUILTIN, HIGH);    // turn the LED on
  }
  else
  {
    Serial.println("Last charge ended before restart");
    Serial.print("Last charge end time ");
    PrintDateTime(chargeStart);
    Serial.println("Current rtc time ");
    PrintDateTime(rtc.now());
    digitalWrite(relayPin, LOW);        //if the chargeStart time stored in the Arduino's EEPROM is in the past, open the relay
    chargeStatus = 0;                   // set dummy variable to 1 as "off"
    digitalWrite(LED_BUILTIN, LOW);     // turn the LED off
  }

  nfc.begin();
  uint32_t versiondata = nfc.getFirmwareVersion();
  i = 1;
  while (i<=10 && ! versiondata)
    {
      Serial.println("Didn't find PN53x board");
      Serial.println("attempting to restart SPI connection");
      digitalWrite(relayPin, LOW);
      digitalWrite(relayPin, HIGH);
      delay(3000);
      digitalWrite(relayPin, LOW);
      delay(100);
      digitalWrite(relayPin, HIGH);
      delay(3000);
      digitalWrite(relayPin, LOW);
      delay(3000);
      SPI.begin(); 
      delay(100);
      nfc.begin();
      success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);
      if (success)
      {
        i=11;
      }
      uint32_t versiondata = nfc.getFirmwareVersion();
      //Serial.print("Temperature: ");
      //Serial.print(rtc.getTemperature());
      //Serial.println(" C");
      //Serial.print("voltage: ");
      //int b_A7 = analogRead(A7);
      //float v_A7 = b_A7 * (5.0 / 1023.0);
      //Serial.println(v_A7);
      Serial.println(i);
      i=i+1;
    }
    if ( ! versiondata  && !success)
    {
      Serial.println("Didn't find PN53x board, reconnection attempts failed");
      //EEPROM.put(40, analogRead(A7));
      while (1); // halt
    }
  
//  nfc.setPassiveActivationRetries(0xFF);  // Sets the maximum number of retries.  0xFF retries forever.  Currently using a timeout function in success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);
  nfc.SAMConfig();                          // configure board to read RFID tags
    switch(random(0,3))
    {
      case 0:randomSeed(analogRead(A0));
      break;
      case 1:randomSeed(analogRead(A1));
      break;
      case 2:randomSeed(analogRead(A2));
      break;
      default:randomSeed(analogRead(A3));
      break;
    }
}

/*---------------------------( Main Loop )-----------------------------*/
void loop ()
{
  if ((chargeStart + chargeTime) < rtc.now().unixtime())
  {
    digitalWrite(relayPin, LOW);
    chargeStatus = 0;                   // set dummy variable to 1 as "off"
    digitalWrite(LED_BUILTIN, LOW);     // turn the LED off
  }
  uint8_t pageOne = EEPROM.read(20);
  uint8_t pageTwo = EEPROM.read(21);
  uint8_t firstTime = EEPROM.read(22);
  GetStoredCode();

//  if (digitalRead(relayPin) == LOW)
//  {
//    Serial.println("charging expired, relay opened");
//    Serial.println("Please scan a card to start charging");
//  }
//  else
//  {
//    Serial.println("current time ");
//    PrintDateTime(rtc.now());
//    Serial.println("charge time ends ");
//    PrintDateTime(chargeStart + chargeTime);
//    Serial.println("Scan a card to stop charging");
//  }

  // When an NTAG203 card is found 'uid' will be populated with
  // the UID, and uidLength will indicate the size of the UUID (normally 7)
  // added a timeout to the card reading function.  it'll wait 5 seconds for a card, then move on.
  success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);
  
  if (success) 
  { 
    // Display some basic information about the card
//    Serial.print("  UID Length: "); 
//    Serial.print(uidLength, DEC); 
//    Serial.println(" bytes");
//    Serial.print("  UID Value: ");
//    nfc.PrintHex(uid, uidLength);
      
   String initializationRecord;
   red = GetCardRecord(keyDB.initializationPageOne, keyDB.initializationPageTwo);
   if(red == true)
   {
    initializationRecord = cardRecord;
    Serial.println(cardRecord);
   }
    bool admin;
    admin = keyDB.Admin(initializationRecord);
    
    bool first;
    first = keyDB.Initialization(initializationRecord);
    if(first && firstTime ==1)
    {
        String key = keyDB.replacementKey;
        SetCardRecord(keyDB.initializationPageOne, key.substring(0,4));
        SetCardRecord(keyDB.initializationPageTwo, key.substring(4,8));
    }

   String commuterRecord;
   red = false;
   red = GetCardRecord(pageOne, pageTwo);
   if(red == true)
   {
    commuterRecord = cardRecord;
    Serial.println(cardRecord);
   }
    bool commuter;
    commuter = (commuterRecord == GetStoredCode());

    bool valid = false;

    if(admin)
    {
      //Serial.println("Card validated");  
        Serial.print("Admin record: ");  
        Serial.println(initializationRecord);
        valid = true;
    }
    else if(commuter)
    {
        uint8_t newPageOne = random(4,130);
        uint8_t newPageTwo = random(4,130);
        red = false;
        red = GetCardRecord(newPageOne,newPageTwo);
        if(red == true)
        {
          SetStoredCode(cardRecord);
          Serial.println(cardRecord);
          EEPROM.put(20, newPageOne);
          EEPROM.put(21, newPageTwo);
          Serial.print("newPageOne: ");
          Serial.println(newPageOne);
          Serial.print("newPageTwo: ");
          Serial.println(newPageTwo);
        }
        valid = true;
        //Serial.println("Card validated");  
    }
    else if(first && firstTime !=1)
    {
        uint8_t newPageOne = random(4,130);
        uint8_t newPageTwo = random(4,130);
        red = false;
        red = GetCardRecord(newPageOne,newPageTwo);
        if(red == true)
        {
          SetStoredCode(cardRecord);
          EEPROM.put(20, newPageOne);
          EEPROM.put(21, newPageTwo);
          EEPROM.put(22, 1);
          Serial.print("newPageOne: ");
          Serial.println(newPageOne);
          Serial.print("newPagTwo: ");
          Serial.println(newPageTwo);
          String key = keyDB.replacementKey;
          SetCardRecord(keyDB.initializationPageOne, key.substring(0,4));
          SetCardRecord(keyDB.initializationPageTwo, key.substring(4,8));
          valid = true;
          //Serial.println("Card validated");  
        }
    }    
    
    if(valid)
    {
      Serial.println("Card validated");  
      if (chargeStatus == 0)              // if the outlet is off
      { 
        digitalWrite(relayPin, HIGH);     // Close the relay
        chargeStatus = 1;                 // set dummy variable to 1 as "on"
        digitalWrite(LED_BUILTIN, HIGH);  // turn the LED on
        // Display some basic information about the card
        Serial.println("Initiating charging");
        Serial.print("Current rtc time ");
        PrintDateTime(rtc.now());
        SetChargeStartTime();
        Serial.print("Current charge end time is ");
        PrintDateTime(chargeStart + chargeTime);
        delay(1000);                      // adding a delay to prevent inadvertent rescans
      }
      else
      {
        // Open the relay
        Serial.println("Using the NFC card to open the relay");      
        digitalWrite(relayPin, LOW);
        chargeStatus = 0;                 // set dummy variable to 1 as "off"
        digitalWrite(LED_BUILTIN, LOW);   // turn the LED off
        delay(1000);                      // adding a delay to prevent inadvertent rescans
      }
    }
    else
    {
      Serial.println("The card is invalid, no action taken");
      delay(1000);                      // adding a delay to prevent inadvertent rescans

    }
//    Serial.println();
//    Serial.flush();
  }
//  Serial.println();
//    Serial.print("Temperature: ");
//    Serial.print(rtc.getTemperature());
//    Serial.println(" C");
//    Serial.print("voltage: ");
//    int b_A7 = analogRead(A7);
//    Serial.println(b_A7);
//    float v_A7 = b_A7 * (5.0 / 1023.0);
//    Serial.println(v_A7);
//    EEPROM.put(40, analogRead(A7));
//    int e_A7;
//    EEPROM.get(40, e_A7);
//    Serial.println(e_A7);
  
}

/*---------------( Functions defined in the Sketch for the Sketch )------------*/
// returns the time of the most recent successful NFC scan
uint32_t GetChargeStartTime()
{
  EEPROM.get(chargeStartAddress, chargeStart);
}

// Sets the current time in eeprom to address 0 length of 32 bits
void SetChargeStartTime()
{
  DateTime now = rtc.now();
  chargeStart = now.unixtime();     // saves current time when function is called
  EEPROM.put(chargeStartAddress, chargeStart);
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

bool GetCardRecord(uint8_t firstPage, uint8_t secondPage)
{
    bool returnValue;
    String stringValue;
    String pageValue;
    bool success_p1 = false;
    bool success_p2 = false;

      success_p1 = nfc.ntag2xx_ReadPage(firstPage, record);   
        for(byte i=0; i < 4; i++)
        {
          //returnValue.concat(String(record[i] < 0x10 ? " 0" : " "));
          pageValue.concat(String((char)record[i]));
        }
        //Serial.println(success_p1);
      success_p2 = nfc.ntag2xx_ReadPage(secondPage, record);  
        for(byte i=0; i < 4; i++)
        {
          //returnValue.concat(String(record[i] < 0x10 ? " 0" : " "));
          pageValue.concat(String((char)record[i]));
        }
        //Serial.println(success_p2);
     returnValue = (success_p1 && success_p2);
     
     if(returnValue == true)
     {
      stringValue.concat(pageValue);
      cardRecord = stringValue.substring(0);
     }

    //Serial.println(returnValue);
    return returnValue;
}

void SetCardRecord(uint8_t page, String key)
{
    char buf[31];
    key.toCharArray(buf,30);
    nfc.ntag2xx_WritePage(4, buf);  
}

void SetStoredCode(String key)
{
  byte value;
  //Serial.println(key);
  //Serial.println(randoKey, HEX);
    for(byte i=0; i<8; i++)
    {
      byte k = i+10;
      EEPROM.put(k, key[i]);
//      value = EEPROM.read(k);
//      Serial.print(k);
//      Serial.print("\t");
//      Serial.print(value, HEX);
//      Serial.println();
    }         
  Serial.println("code set in EEPROM");
}

String GetStoredCode()
{
    String returnValue;
    for(byte k=10; k<18; k++)
    {
      returnValue.concat(String((char)EEPROM.read(k)));
    }
//    Serial.println(returnValue);    
//    Serial.println("code recovered from EEPROM");
    return returnValue.substring(0);
}
