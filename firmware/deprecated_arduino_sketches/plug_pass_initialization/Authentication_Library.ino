/*
#include "Authentication_Library.h"
// For the purpose of random number generation we use analog readings from analog pins 0-3 and 6-7.
// They should remain unplugged or the library should be modified to adapt.

KeyDatabase keyDB;
void setup() {
 Serial.begin(9600);
}

void loop() {
  String randoKey = keyDB.GeneratePsuedoRandomKey();
  String goodKey = "B9873D79";
  Test(goodKey);
  Test(randoKey);
  delay(1000);
}


void Test(String key)
{
  Serial.print(key);
  if (keyDB.Contains(key))
  {
    Serial.println(" is in the database");
  }
  else
  {
   Serial.println(" is not in the database");
  }
}
*/
