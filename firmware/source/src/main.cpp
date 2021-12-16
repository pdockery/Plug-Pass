#include <Arduino.h>
#include <Adafruit_PN532.h>
#include <EEPROM.h>

#include "Authentication_Library.h"
#include "RelayManager.h"
#include "RTCManager.h"

#define RELAY_PIN 2

#define PN532_SCK (13)
#define PN532_MOSI (11)
#define PN532_SS (10)
#define PN532_MISO (12)

RelayManager relayManager(RELAY_PIN);
RTCManager rtcManager;
KeyDatabase keyDB;

Adafruit_PN532 nfc{PN532_SCK, PN532_MISO, PN532_MOSI, PN532_SS};
uint8_t uid[] = {0, 0, 0, 0, 0, 0, 0};
uint8_t uidLength;

void SetCardRecord(uint8_t page, uint32_t word)
{
  const int WORD_SIZE = 4;

  uint8_t bytes[WORD_SIZE];
  bytes[0] = (word >> 24) & 0xFF;
  bytes[1] = (word >> 16) & 0xFF;
  bytes[2] = (word >> 8) & 0xFF;
  bytes[3] = word & 0xFF;

  Serial.print("Writing to page: ");
  Serial.print(page);
  Serial.print(", Bytes: 0x");
  for (int i = 0; i < WORD_SIZE; i++)
    Serial.print(bytes[i], HEX);
  Serial.println();

  bool success = nfc.ntag2xx_WritePage(page, bytes);
  byte i = 1;
  while (!success && i <= 10)
  {
    Serial.println("Unable to write to the requested page! retrying");
    delay(100);
    success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength);
    if (success)
    {
      success = nfc.ntag2xx_WritePage(page, bytes);
    }
    i++;
  }
}

uint32_t ReadCardRecord(uint8_t page)
{
  const int WORD_SIZE = 4;
  uint8_t data[32];

  bool success = nfc.ntag2xx_ReadPage(page, data);
  Serial.print("Reading page: ");
  Serial.print(page);
  Serial.print(", Bytes: 0x");
  if (success)
  {
    for (int i = 0; i < WORD_SIZE; i++)
      Serial.print(data[i], HEX);
    Serial.println();
  }

  byte i = 1;
  while (!success && i <= 10)
  {
    Serial.println("Unable to read the requested page! retrying");
    delay(100);
    success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength);
    if (success)
    {
      success = nfc.ntag2xx_ReadPage(page, data);
      for (int i = 0; i < WORD_SIZE; i++)
        Serial.print(data[i], HEX);
      Serial.println();
    }
  }
  i = i + 1;

  uint32_t combined_data1 = (static_cast<uint32_t>(data[3])) | static_cast<uint32_t>(data[2] << 8);
  combined_data1 = combined_data1 & 0x0000FFFF;
  uint32_t combined_data2 = (static_cast<uint32_t>(data[1]) << 16) | (static_cast<uint32_t>(data[0]) << 24);
  uint32_t combined_data = combined_data1 + combined_data2;
  return combined_data;
}

void setup()
{
  Serial.begin(115200);
  delay(100);
  rtcManager.Init();
  nfc.begin();
  delay(500);
  uint32_t versiondata = nfc.getFirmwareVersion();
  if (!versiondata)
  {
    Serial.print("ERROR: Didn't find PN53x board");
  }
  uint8_t success = nfc.SAMConfig();
  randomSeed(analogRead(A0));
}

void InitLoop()
{
  Serial.flush();
  delay(500);
  Serial.println("Enter A for AdminCard, R for ResetCard, C for CommuterCard");
  while (!Serial.available())
  {
  }

  if (Serial.available() > 0)
  {
    char rx_byte = Serial.read();
    if (rx_byte == 'A' || rx_byte == 'C' || rx_byte == 'R')
    {
      delay(3000);
      Serial.println("please scan an NTAG 215 nfc card");

      bool success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, 5000);
      if (success && uidLength == 7)
      {
        if (rx_byte == 'A')
        {
          Serial.println("Programming AdminCard");
          SetCardRecord(5, keyDB.GetAuthKey());
          delay(100);
          SetCardRecord(6, keyDB.GetAdminKey());
        }
        else if (rx_byte == 'C')
        {
          Serial.println("Programming CommuterCard");
          SetCardRecord(5, keyDB.GetAuthKey());
          delay(100);
          SetCardRecord(6, keyDB.GetCommuterInitKey());
        }
        else if (rx_byte == 'R')
        {
          Serial.println("Programming ResetCard");
          SetCardRecord(5, keyDB.GetAuthKey());
          delay(100);
          SetCardRecord(6, keyDB.GetResetKey());
        }
        else
        {
          Serial.println("this'll be a useless card");
        }
        delay(500);
        Serial.println("Reading back card:");
        ReadCardRecord(5);
        delay(200);
        ReadCardRecord(6);
      }
    }
  }
}

void ControlLoop()
{
  if (rtcManager.ShouldWeCharge())
  {
    Serial.println("ON");
    relayManager.TurnOn();
  }
  else
  {
    Serial.println("OFF");
    relayManager.TurnOff();
  }
  delay(100);

  bool success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, 2000);
  if (success && uidLength == 7)
  {
    Serial.println("Seems to be an NTAG2xx tag (7 byte UID)");

    uint32_t auth = ReadCardRecord(5);
    if (auth == keyDB.GetAuthKey())
    {
      Serial.println("Card Passed Auth");
      delay(100);

      uint32_t cardType = ReadCardRecord(6);
      if (cardType == keyDB.GetAdminKey())
      {
        Serial.println("We found an AdminKey!");
        if (rtcManager.ShouldWeCharge())
        {
          rtcManager.EndChargeSession();
          relayManager.TurnOff();
        }
        else
        {
          rtcManager.StartChargeSession();
          relayManager.TurnOn();
        }
      }
      else if (cardType == keyDB.GetResetKey())
      {
        Serial.println("We found an ResetKey!");
        keyDB.ResetCommuterPairedKey();
      }
      else if (cardType == keyDB.GetCommuterInitKey())
      {
        Serial.println("We found an CommuterInitKey!");
        if (keyDB.IsPaired())
        {
          Serial.println("Station already paired to key, use ResetKey to reset station for a new key");
        }
        else
        {
          keyDB.CreateNewCommuterPairedKey();
          SetCardRecord(5, keyDB.GetAuthKey());
          SetCardRecord(6, keyDB.GetCommuterPairedKey());
        }
      }
      else if (cardType == keyDB.GetCommuterPairedKey())
      {
        Serial.println("We found our PairedKey!");
        if (rtcManager.ShouldWeCharge())
        {
          rtcManager.EndChargeSession();
          relayManager.TurnOff();
        }
        else
        {
          rtcManager.StartChargeSession();
          relayManager.TurnOn();
        }
      }
      else
      {
        Serial.println("We found an UnknownCard!");
      }
    }
    else
    {
      Serial.println("ERROR: Invalid AuthKey");
    }
    delay(5000);
  }
  else
  {
    Serial.println("Scan timed out, retrying....");
  }
}

void loop()
{
  //InitLoop();
  ControlLoop();
}
