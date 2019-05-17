//#include <Time.h>
//#include <TimeLib.h>

#include <OneWire.h>
#include <DallasTemperature.h>



// Data wire is plugged into digital pin 2 on the Arduino
#define ONE_WIRE_BUS 2

// Setup a oneWire instance to communicate with any OneWire device
OneWire oneWire(ONE_WIRE_BUS);  

// Pass oneWire reference to DallasTemperature library
DallasTemperature sensors(&oneWire);

unsigned long time;


void setup(void)
{
  sensors.begin();  // Start up the library
  Serial.begin(9600);
//  setTime(hour,minute,second);
}

void loop(void)
{ 
  // Send the command to get temperatures
  sensors.requestTemperatures(); 

  //print the temperature in Celsius
  Serial.print("Temperature: ");
  Serial.print(sensors.getTempCByIndex(0));
  Serial.print((char)176);//shows degrees character
  Serial.print("C  |  ");
  
  //print the temperature in Fahrenheit
  Serial.print((sensors.getTempCByIndex(0) * 9.0) / 5.0 + 32.0);
  Serial.print((char)176);//shows degrees character
  Serial.println("F");

  Serial.print("Time: ");
  time = millis();

  Serial.println(time); //prints time since program started
 // time_t t = now(); 
 // Serial.print(hour(),DEC);

  
  delay(500);
}
