#ifndef RTC_MANAGER_H
#define RTC_MANAGER_H

#include "RTClib.h"

#define CHARGE_LENGTH (40) // in seconds
#define CHARGE_LENGTH_RTC (CHARGE_LENGTH / 2)

#define CHARGE_START_BYTE_1_ADDRESS (10)
#define CHARGE_START_BYTE_2_ADDRESS (11)
#define CHARGE_START_BYTE_3_ADDRESS (12)
#define CHARGE_START_BYTE_4_ADDRESS (13)

class RTCManager
{
public:
  RTCManager();
  void Init();

  bool ShouldWeCharge();
  void StartChargeSession();
  void PrintDateTime();

  uint32_t GetChargeStart() { return chargeStart; }
  uint32_t GetNow() { return rtc.now().unixtime(); }

private:
  RTC_DS3231 rtc;
  uint32_t chargeStart;
  const char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

  void SetChargeStart(uint32_t start);
};

#endif