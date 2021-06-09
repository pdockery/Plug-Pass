#include "RelayManager.h"
#include "Arduino.h"

RelayManager::RelayManager(int Pin)
{
  mPin = Pin;
  pinMode(Pin, OUTPUT);
}

void RelayManager::TurnOff()
{
  digitalWrite(mPin, LOW);
}

void RelayManager::TurnOn()
{
  digitalWrite(mPin, HIGH);
}

void RelayManager::Test()
{
  delay(2000);
  Serial.println("HI");
  TurnOff();
  delay(2000);
  Serial.println("BYE");
  TurnOn();
}