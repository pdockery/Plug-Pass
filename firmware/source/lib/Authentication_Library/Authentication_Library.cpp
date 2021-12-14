#include "Arduino.h"
#include "Authentication_Library.h"

KeyDatabase::KeyDatabase()
{
}

uint32_t ConvertUint8toUint32(uint8_t int1, uint8_t int2, uint8_t int3, uint8_t int4)
{
  uint32_t convertedInt1 = (static_cast<uint32_t>(int4)) & 0x000000FF;
  uint32_t convertedInt2 = (static_cast<uint32_t>(int3) << 8) & 0x0000FF00;
  uint32_t convertedInt3 = (static_cast<uint32_t>(int2) << 16) & 0x00FF0000;
  uint32_t convertedInt4 = (static_cast<uint32_t>(int1) << 24) & 0xFF000000;
  uint32_t combined = (convertedInt1 + convertedInt2 + convertedInt3 + convertedInt4);
  return combined;
}

void KeyDatabase::ResetCommuterPairedKey()
{
  EEPROM.write(PAIRED_KEY_BYTE_1_ADDRESS, (ResetKey >> 24) & 0xFF);
  EEPROM.write(PAIRED_KEY_BYTE_2_ADDRESS, (ResetKey >> 16) & 0xFF);
  EEPROM.write(PAIRED_KEY_BYTE_3_ADDRESS, (ResetKey >> 8) & 0xFF);
  EEPROM.write(PAIRED_KEY_BYTE_4_ADDRESS, ResetKey & 0xFF);
}

void KeyDatabase::CreateNewCommuterPairedKey()
{
  EEPROM.write(PAIRED_KEY_BYTE_1_ADDRESS, random(0, 0xFF));
  EEPROM.write(PAIRED_KEY_BYTE_2_ADDRESS, random(0, 0xFF));
  EEPROM.write(PAIRED_KEY_BYTE_3_ADDRESS, random(0, 0xFF));
  EEPROM.write(PAIRED_KEY_BYTE_4_ADDRESS, random(0, 0xFF));
}

bool KeyDatabase::IsPaired()
{
  if (GetCommuterPairedKey() == ResetKey)
  {
    return false;
  }
  else
  {
    return true;
  }
}

uint32_t KeyDatabase::GetCommuterPairedKey()
{
  return ConvertUint8toUint32(
      EEPROM.read(PAIRED_KEY_BYTE_1_ADDRESS),
      EEPROM.read(PAIRED_KEY_BYTE_2_ADDRESS),
      EEPROM.read(PAIRED_KEY_BYTE_3_ADDRESS),
      EEPROM.read(PAIRED_KEY_BYTE_4_ADDRESS));
}
