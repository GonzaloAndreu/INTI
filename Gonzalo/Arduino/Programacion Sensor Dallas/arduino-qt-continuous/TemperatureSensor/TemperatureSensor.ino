//// ****** THIS FILE IS AUTOGENERATED ******
////
////          >>>> DO NOT CHANGE <<<<
////
/// 
///  Filename; F:\gonzalo andreu\INTI\Gonzalo\Arduino\Programacion Sensor Dallas\arduino-qt-continuous\drivers.py
///  Source class: TemperatureSensor
///  Generation timestamp: 2019-06-14T14:52:01.633570
///  Class code hash: db38f0a9c31023182ad24ccb107051ce64912160
///
/////////////////////////////////////////////////////////////



// Import libraries
#include <Arduino.h>

#include "inodriver_bridge.h"
#include "inodriver_user.h"

#define BAUD_RATE 9600

void setup() {
  bridge_setup();
  
  user_setup();

  Serial.begin(BAUD_RATE);
}

void loop() {
  
  bridge_loop();
  
  user_loop();
}