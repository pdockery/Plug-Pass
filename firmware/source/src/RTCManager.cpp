#include "RTCManager.h"
#include "Authentication_Library.h"
#include <EEPROM.h>

RTCManager::RTCManager()
{
}

void RTCManager::Init()
{
  Serial.println("RTC Init");
  if (!rtc.begin())
  {
    Serial.println("ERROR: Couldn't find RTC");
  }
  if (rtc.lostPower())
  {
    Serial.println("RTC lost power, lets set the time!");
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)) + 10);
  }
  else
  {
    Serial.println("RTC did not lose power");
  }
  chargeStart = ConvertUint8toUint32(
      EEPROM.read(CHARGE_START_BYTE_1_ADDRESS),
      EEPROM.read(CHARGE_START_BYTE_2_ADDRESS),
      EEPROM.read(CHARGE_START_BYTE_3_ADDRESS),
      EEPROM.read(CHARGE_START_BYTE_4_ADDRESS));
  Serial.print("TIME READ FROM EEPROM: ");
  Serial.println(chargeStart, HEX);
}

void RTCManager::SetChargeStart(uint32_t start)
{
  Serial.print("TIME WROTE TO EEPROM: ");
  Serial.println(start, HEX);
  EEPROM.write(CHARGE_START_BYTE_1_ADDRESS, (start >> 24) & 0xFF);
  EEPROM.write(CHARGE_START_BYTE_2_ADDRESS, (start >> 16) & 0xFF);
  EEPROM.write(CHARGE_START_BYTE_3_ADDRESS, (start >> 8) & 0xFF);
  EEPROM.write(CHARGE_START_BYTE_4_ADDRESS, start & 0xFF);
  chargeStart = start;
}

bool RTCManager::ShouldWeCharge()
{
  if (chargeStart + CHARGE_LENGTH_RTC > GetNow())
  {
    return true;
  }
  else
  {
    return false;
  }
}

void RTCManager::StartChargeSession()
{
  SetChargeStart(GetNow() + CHARGE_LENGTH_RTC);
}

void RTCManager::EndChargeSession()
{
  SetChargeStart(GetNow());
}

void RTCManager::PrintDateTime()
{
  DateTime time = rtc.now();
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
