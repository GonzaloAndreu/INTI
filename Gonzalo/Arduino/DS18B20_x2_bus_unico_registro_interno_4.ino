/* DOS SENSORES DE TEMPERATURA DS18B20, UNO DE TEMPERATURA Y HUMEDAD DHT22
 * COLOCAR EL SERIAL EN 115200 BAUDIOS
 */

#include <OneWire.h>              // para utilizar lazos serie  
#include <DallasTemperature.h>    // para utilizar el DS18B20
#include <Average.h>              // libreria para cálculos matemáticos
#include <EEPROM.h>               // para utilizar la EEPROM  (BORRRAR SI NO LO VOY A UTILIZAR)
#include <DHT.h>                  // (NUEVO) para utilizar el DHT11 y/o DHT22

#define N 60                       // cantidad de datos a recoger para promediar (máximo 120)
//#define N2 24                       // cantidad de promedios a guardar en un array (máximo 100)
#define DELTA 50                    // tiempo entre toma de datos en "decimas de segundo" 2 para 9bits
#define PRECISION 12                 // define precision en bits (9 a 12)
#define RESTART asm("jmp 0x0000")   // funcion RESTART para resetear el arduino.
 

OneWire ourWire(2);                   // pin 2 tipo OneWire para varios DS18B20
DallasTemperature sensors(&ourWire);  // objeto sensors 
DeviceAddress address1 = {0x28, 0xB8, 0x25, 0xA6, 0x8, 0x0, 0x0, 0x17};  //dirección IP del sensor 1
DeviceAddress address2 = {0x28, 0x71, 0xD, 0xA6, 0x8, 0x0, 0x0, 0xD8};   //dirección IP del sensor 2

DHT dht(4, DHT22);   // (NUEVO) elijo pin 4 y tipo DHT22 ó DHT11

byte i=0;                                   //para hacer el contador de datos a promediar
unsigned long tViejo = 0, tNuevo = 0;       //para definir el delta entre toma de datos
// int medio [N2][4];                       // (NUEVO)
Average<float> DS1(N);                     // se puede poner en int, pero da overflow en funcion de cantidad de datos.
Average<float> DS2(N);
Average<float> THT(N);                     // 
Average<float> THH(N);                     // 


void setup() {
  Serial.begin(115200);
  sensors.begin();                             //Se inician los DS18B20
  sensors.setResolution(address1, PRECISION);  //configuro bits de resolución (disponible 9 a 12)
  sensors.setResolution(address2, PRECISION);  
  dht.begin();                                 // (NUEVO) Se inicia el DHT11 ó DHT22
  Serial.println("PARAMETROS CONFIGURADOS...");        // Quitar en caso de ser necesario, ocupan memoria
  Serial.print("Tiempo entre toma de datos (s):,,, ");
  Serial.println(DELTA/10);
  Serial.print("Precision en bits (DS18B20):,,, ");
  Serial.println(PRECISION);
  Serial.print("Tamaño de la muestra a promediar:,,, ");
  Serial.println(N);
}
 
void loop() {
    tNuevo = millis()/100;
    Recibe();                     //función que recibe comandos desde puerto Serie de la PC.
       
    if (tNuevo >= tViejo+DELTA)
    {
      tViejo = millis()/100;
      sensors.requestTemperatures();                  //envía el comando para obtener las temperaturas. Este demora el mayor tiempo
      DS1.push(sensors.getTempC(address1));          //Se obtiene la temperatura en °C de los DS18B20
      DS2.push(sensors.getTempC(address1));          //Se obtiene la temperatura en °C de los DS18B20
      THT.push(dht.readTemperature());                //Se obtiene la temperatura en ºC del DHT22
      THH.push(dht.readHumidity());                   //Se obtiene la humedad relativa del DHT22
      i++;
    }

    if (i >= N) 
    {
      //Serial.print("Tiempo al iniciar envio de datos [s]: "); Serial.println(millis()/1000); //solo para chequear el tiempo
/*      for(int x=0; x<N; x++) //IMPRIME TODOS LOS DATOS UTILIZADOS PARA EL ESTADÍSTICO
      {
        Serial.print(x+1); Serial.print(","); Serial.print(DS1.get(x)); Serial.print(","); Serial.print(DS2.get(x)); Serial.print(",");
        Serial.print(THT.get(x)); Serial.print(","); Serial.println(THH.get(x));
      }*/
      i=0;
      Serial.print(DS1.mean()); Serial.print(","); Serial.print(DS1.stddev()); Serial.print(",");
      Serial.print(DS2.mean()); Serial.print(","); Serial.print(DS2.stddev()); Serial.print(",");
      Serial.print(THT.mean()); Serial.print(","); Serial.print(THT.stddev()); Serial.print(",");
      Serial.print(THH.mean()); Serial.print(","); Serial.println(THH.stddev());
/*      for (int x=0 ; x<(N2-1) ; x++)
      {
         medio[x][0]=medio[x+1][0];
         medio[x][1]=medio[x+1][1];
         medio[x][2]=medio[x+1][2];
         medio[x][3]=medio[x+1][3];
      }
      medio[N2-1][0]=DS1.mean()*100;
      medio[N2-1][1]=DS1.stddev()*100;
      medio[N2-1][2]=DS2.mean()*100;
      medio[N2-1][3]=DS2.stddev()*100;
      Serial.print("VALOR MEDIO Y DESVIO ESTANDAR ");
      Serial.print(",,,");
      Serial.print(medio[N2-1][0]);
      Serial.print(",");
      Serial.print(medio[N2-1][1]);
      Serial.print(",");
      Serial.print(medio[N2-1][2]);
      Serial.print(",");
      Serial.println(medio[N2-1][3]);
*/
    }

    // Reseteo el Arduino. Una vez por día, es 1000*3600*24 = 86.400.000
    if (millis() > 86400000)    // 86400000 representa una vez al dia
    {
       // Antes de Resetear debería mandar los datos por Puerto Serie.
       Serial.println("RESETEANDO...");
       RESTART;
    }
  }
  
void Recibe() {
  byte conf;
  char recibe;
  if (Serial.available());
    {
      recibe = Serial.read();
      switch (recibe)
      {
        case '?':
          Serial.println("La ayuda es la siguiente...");     //Agregar el listado de letras
          Serial.println("t ó T, tiempo en 0,1s entre lecturas. Valor aceptado entre 2 y 255");
          Serial.println("n ó N, cantidad de datos a promediar. Valor aceptado entre 5 y 100");
          break;
        case 't':
        case 'T':
          Serial.print("Tiempo entre toma de lectura actual (0,1s) (2-255) ");
          Serial.println(EEPROM.read(0));       // se carga en posición 0
          break;
        case 'n':
        case 'N':
          Serial.print("Cantidad de datos a promediar (5-255) ");
          Serial.println(EEPROM.read(1));       // se carga en posición 1
          break;
        case 'd':
        case 'D':
          Serial.println("Enviando datos ");
          /*for (int x=0 ; x<N2 ; x++)
          {
            Serial.print(medio[x][0]);
            Serial.print(",");
            Serial.print(medio[x][1]);
            Serial.print(",");
            Serial.print(medio[x][2]);
            Serial.print(",");
            Serial.println(medio[x][3]);
         }*/
          break;
        default:
          break;
          
      }
    }
 }
  
 

