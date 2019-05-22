#include <TimeLib.h>
#include <OneWire.h>
#include <DallasTemperature.h>

// En caso de usar un arduino UNO, es necesario configurar el procesador a ATmega328P
// En caso de usar un arduino NANO, es necesario configurar el procesador ATmega328P (OldBootloader)
// Ademas para un arduino NANO clonado, es necesario bajar unos drivers por que usan un chip USB distinto. Hay que instalar el driver CH340.
//                  el de esta pagina funciono:  https://www.geekfactory.mx/download/driver-ch340-windows/


// Data wire is plugged into digital pin 2 on the Arduino
#define ONE_WIRE_BUS 2

// Setup a oneWire instance to communicate with any OneWire device
OneWire oneWire(ONE_WIRE_BUS);  

// Pass oneWire reference to DallasTemperature library
DallasTemperature sensors(&oneWire);

void setup(void)
{
  sensors.begin();  // Start up the library
  Serial.begin(9600);
  time_t t= now();
  setTime(t); 
}

void loop(void)
{ 
  time_t t= now();
  // Send the command to get temperatures
  sensors.requestTemperatures(); 

  //print the temperature in Celsius
  Serial.print("Temperature: ");
  Serial.print(sensors.getTempCByIndex(0));
  Serial.print((char)167);//shows degrees character
  Serial.print("C  |  ");
  
  //print the temperature in Fahrenheit
  Serial.print((sensors.getTempCByIndex(0) * 9.0) / 5.0 + 32.0);
  Serial.print((char)167);//shows degrees character
  Serial.println("F");

  
  Serial.print(hour(t));
  Serial.print(minute(t));
  Serial.print(second(t));
  Serial.print(day(t));
  Serial.print(month(t));
  Serial.print(year(t));
  
  delay(500);
}
