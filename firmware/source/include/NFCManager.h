#ifndef NFC_MANAGER_H
#define NFC_MANAGER_H

#include <Adafruit_PN532.h>

class NFCManager
{
public:
  //NFCManager();
  void Init();

private:
  Adafruit_PN532 nfc;
};

#endif