#include <Arduino.h>

void setup()
{
  Serial.begin(115200);
}

void loop()
{
  Serial.println("HI");
  delay(500);
  Serial.println("BYE");
  delay(500);
}