/*------------------( Include Libraries )-------------------------------*/
#include "RTClib.h"                     // For use with DS3231 to keep time when disconnected includes Date and time functions using a DS3231 RTC connected via I2C and Wire lib
#include <Wire.h>                       // Used in serial communication
#include <SPI.h>                        // Used in serial communication
#include <EEPROM.h>                     // For persistent storage of data when disconnected (future charge expiration time, verified key ids, etc.)
#include <Adafruit_PN532.h>             // For use with a PN532 to interact with RFID cards


/*---------------( Declare Constants and Pin Numbers )-----------------*/
// If using the breakout with SPI, define the pins for SPI communication.
#define PN532_SCK  (2)
#define PN532_MISO (3)
#define PN532_MOSI (4)
#define PN532_SS   (5)

char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int relayPin = 12;                        // defines a variable to set the output pin to D12
int chargeStartAddress = 0;               // defines a variable to set the address location for the charge Start time in the EEPROM
uint32_t chargeStart;                     // defines a variable to store the charge Start time
uint8_t chargeStatus = 0;                 // defining a dummy variable to hold the most recent command to turn off or on the outlet
uint8_t success;                          // defines a variable to check the success of an NFC card scan
uint8_t uid[] = { 0, 0, 0, 0, 0, 0, 0 };  // Buffer to store the returned UID after NFC card scan
uint8_t uidLength;                        // Length of the UID (4 or 7 bytes depending on ISO14443A card type) for NFC card scan
uint16_t timeout = 5000;                  // defines a variable to timeout the card reader function, in ms
uint32_t chargeTime = 30;                 // defines the amount of time, in seconds, a standard charging time will be
String cardCode;                          // defines a string variable to check against known card codes

/*-------------------------( Declare objects )--------------------------*/
Adafruit_PN532 nfc(PN532_SCK, PN532_MISO, PN532_MOSI, PN532_SS); // Create a nfc object for a breakout with a software SPI connection
RTC_DS3231 rtc; // Create a RealTimeClock object

/*-------------------------------( Set up )-----------------------------*/
void setup ()
{

  Serial.begin(9600);           // Set baud rate for serial communications
  delay(3000);                  // wait for console opening
  pinMode(relayPin, OUTPUT);    // establishing the relayPin as an OUTPUT
  pinMode(LED_BUILTIN, OUTPUT); // establishes built in LED pin as an output
  
  if (! rtc.begin())
  {
    Serial.println("Couldn't find RTC");
    while (1);                  // I think we're going to eventually do something different, I don't want the outlet to fail if the RTC fails
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
  if (! versiondata)
  {
    Serial.print("Didn't find PN53x board");
    while (1);                              // I think we're going to eventually do something different, I don't want the outlet to fail if the NFC reader fails
  }
//  nfc.setPassiveActivationRetries(0xFF);  // Sets the maximum number of retries.  0xFF retries forever.  Currently using a timeout function in success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, timeout);
  nfc.SAMConfig();                          // configure board to read RFID tags
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
    Serial.print("  UID Length: "); 
    Serial.print(uidLength, DEC); 
    Serial.println(" bytes");
    Serial.print("  UID Value: ");
    nfc.PrintHex(uid, uidLength);
      
    returnCardCode(cardCode);
    if(cardCode == "04 E0 46 4A DD 64 80")
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
        chargeStatus = 0;               // set dummy variable to 1 as "off"
        digitalWrite(LED_BUILTIN, LOW); // turn the LED off
        delay(1000);                    // adding a delay to prevent inadvertent rescans
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

void returnCardCode(String &dest)
{
    String cardRead;
    for(byte i=0; i < uidLength; i++)
    {
      cardRead.concat(String(uid[i] < 0x10 ? " 0" : " "));
      cardRead.concat(String(uid[i], HEX));
    }
    cardRead.toUpperCase();
    dest = cardRead.substring(1);
}