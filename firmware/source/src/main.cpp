#include <Arduino.h>
#include "RelayManager.h"

RelayManager mRelayManager(2);

void setup()
{
  Serial.begin(115200);
}

void loop()
{
  Serial.println("HI");
  mRelayManager.TurnOn();
  delay(2000);
  Serial.println("BYE");
  mRelayManager.TurnOff();
  delay(2000);
}