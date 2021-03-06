#include <OneWire.h>                
#include <DallasTemperature.h>
 
OneWire ourWire(2);                   //Se establece el pin 2  como bus OneWire
 
DallasTemperature sensors(&ourWire); //Se declara una variable u objeto para nuestro sensor

DeviceAddress address1 = {0x28, 0xB8, 0x25, 0xA6, 0x8, 0x0, 0x0, 0x17};//dirección del sensor 1
DeviceAddress address2 = {0x28, 0x71, 0xD, 0xA6, 0x8, 0x0, 0x0, 0xD8};//dirección del sensor 2

void setup() {
  delay(1000);
  Serial.begin(9600);
  sensors.begin();   //Se inicia el sensor
  sensors.setResolution(address1, 12);  //configuro 9 bits de resolución (disponible 9 a 12)
  sensors.setResolution(address2, 12);  //configuro 9 bits de resolución (disponible 9 a 12)
}
 
void loop() {
  sensors.requestTemperatures();   //envía el comando para obtener las temperaturas
  float temp1= sensors.getTempC(address1);//Se obtiene la temperatura en °C del sensor 1
  float temp2= sensors.getTempC(address2);//Se obtiene la temperatura en °C del sensor 2

  Serial.print("Temperatura 1 = ");
  Serial.print(temp1);
  Serial.print(" C");
  Serial.print("   Temperatura 2 = ");
  Serial.print(temp2);
  Serial.println(" C");
  delay(1);  
            
}
