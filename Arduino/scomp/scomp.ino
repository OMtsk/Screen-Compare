#include <Servo.h>

Servo servo;

void setup() {
  Serial.begin(9600);
  
  pinMode(11, OUTPUT);
  digitalWrite(11, LOW);
 
  servo.attach(6);
  servo.write(90);
}

void loop() {
  if(Serial.available()){
    if(Serial.read() == '1'){
        //digitalWrite(11, HIGH);
        //delay(500);
        //digitalWrite(11, LOW);

        servo.write(85);
        delay(100);
        servo.write(90);
      }
    }
}
