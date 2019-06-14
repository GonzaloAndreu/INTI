//// ****** THIS FILE IS AUTOGENERATED ******
////
////          >>>> DO NOT CHANGE <<<<
////
/// 
///  Filename; F:\gonzalo andreu\INTI\Gonzalo\Arduino\examples-master\examples-master\arduino-qt-toogle-led\run.py
///  Source class: LEDDriver
///  Generation timestamp: 2019-06-14T14:21:25.571754
///  Class code hash: 8647375a3d456c77a25af7a8712a5951c71a1594
///
/////////////////////////////////////////////////////////////


#include "inodriver_bridge.h"

SerialCommand sCmd;

void ok() {
  Serial.println("OK");
}

void error(const char* msg) {
  Serial.print("ERROR: ");
  Serial.println(msg);
}

void error_i(int errno) {
  Serial.print("ERROR: ");
  Serial.println(errno);
}

void bridge_loop() {
  while (Serial.available() > 0) {
    sCmd.readSerial();
  }
}

void bridge_setup() {
  //// Setup callbacks for SerialCommand commands

  // All commands might return
  //    ERROR: <error message>

  // All set commands return 
  //    OK 
  // if the operation is successfull

  // All parameters are ascii encoded strings
  sCmd.addCommand("INFO?", getInfo); 

  sCmd.setDefaultHandler(unrecognized); 


  // led
  // <B> bool as string: True as "1", False as "0" 

  // Getter:
  //   LED? 
  // Returns: <B> 
  sCmd.addCommand("LED?", wrapperGet_LED); 

  // Setter:
  //   LED <B> 
  // Returns: OK or ERROR    
  sCmd.addCommand("LED", wrapperSet_LED); 
}

//// Code 

void getInfo() {
  Serial.print("LEDDriver,");
  Serial.println(COMPILE_DATE_TIME);
}

void unrecognized(const char *command) {
  error("Unknown command");
}
//// Auto generated Feat and DictFeat Code
// COMMAND: LED, FEAT: led

void wrapperGet_LED() { 
  Serial.println(get_LED()); 
}; 


void wrapperSet_LED() {
  char *arg;
  
  arg = sCmd.next();
  if (arg == NULL) {
    error("No value stated");
    return;
  }
  int value = atoi(arg);

  int err = set_LED(value);
  if (err == 0) {
    ok();
  } else {
    error_i(err);
  }
};



