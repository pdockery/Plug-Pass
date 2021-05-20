#ifndef RELAY_MANAGER_H
#define RELAY_MANAGER_H

class RelayManager
{
public:
  RelayManager(int Pin);
  void TurnOff();
  void TurnOn();

private:
  int mPin;
};

#endif