//// ****** THIS FILE IS AUTOGENERATED ******
////
////          >>>> PLEASE ADAPT IT TO YOUR NEEDS <<<<
////
/// 
///  Filename; F:\gonzalo andreu\INTI\Gonzalo\Arduino\Programacion Sensor Dallas\arduino-qt-continuous\drivers.py
///  Source class: TemperatureSensor
///  Generation timestamp: 2019-06-14T14:52:01.613570
///  Class code hash: db38f0a9c31023182ad24ccb107051ce64912160
///
/////////////////////////////////////////////////////////////


#include "inodriver_user.h"
#include <OneWire.h>
#include <DallasTemperature.h>

// Data wire is plugged into digital pin 2 on the Arduino
#define ONE_WIRE_BUS 2

// Setup a oneWire instance to communicate with any OneWire device
OneWire oneWire(ONE_WIRE_BUS);  

// Pass oneWire reference to DallasTemperature library
DallasTemperature sensors(&oneWire);

void user_setup() {

    sensors.begin();  // Start up the library
}

void user_loop() {
    // Send the command to get temperatures 
  sensors.requestTemperatures(); 
}
// COMMAND: TEMP, FEAT: temperature
float get_TEMP() {
  return sensors.getTempCByIndex(0);
};
