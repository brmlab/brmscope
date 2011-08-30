#include <Stepper.h>
#include <Servo.h>


#define STEPS 300

Servo myservo;

Stepper stepperA(STEPS, 5, 3, 2, 4);
Stepper stepperB(STEPS, 9, 7, 6, 8);
Stepper stepperC(STEPS, 13, 11, 10, 12);


int SrvPos = 0;
int inByte = 0;

void setup()

{
  Serial.begin(115200);
  stepperA.setSpeed(50);
  stepperB.setSpeed(50);
  stepperC.setSpeed(50);
  myservo.attach(14);
}

void loop()
{
  if (Serial.available() > 0) {
     inByte = Serial.read();

if (inByte == 4){
  stepperA.step(1);
}

if (inByte == 5){
  stepperA.step(-1);
}

if (inByte == 6){
  stepperB.step(1);
}

if (inByte == 7){
  stepperB.step(-1);
}

if (inByte == 8){
  stepperC.step(1);
}

if (inByte == 9){
  stepperC.step(-1);
}

if ((inByte >= 20) and (inByte <= 100)){
  stepperA.setSpeed(inByte);
  stepperB.setSpeed(inByte);
  stepperC.setSpeed(inByte);
}

if (inByte == 110){
 digitalWrite(2, LOW);
 digitalWrite(3, LOW);
 digitalWrite(4, LOW);
 digitalWrite(5, LOW);
 digitalWrite(6, LOW);
 digitalWrite(7, LOW);
 digitalWrite(8, LOW);
 digitalWrite(9, LOW);
 digitalWrite(10, LOW);
 digitalWrite(11, LOW);
 digitalWrite(12, LOW);
 digitalWrite(13, LOW);

}

if (inByte == 111){

  digitalWrite(2, LOW);
 digitalWrite(3, LOW);
 digitalWrite(4, LOW);
 digitalWrite(5, LOW);
 digitalWrite(6, LOW);
 digitalWrite(7, LOW);
 digitalWrite(8, LOW);
 digitalWrite(9, LOW);
 digitalWrite(10, LOW);
 digitalWrite(11, LOW);
 digitalWrite(12, LOW);
 digitalWrite(13, LOW);
 
  digitalWrite(2, HIGH);
 digitalWrite(6, HIGH);
 digitalWrite(10, HIGH);

}

if (inByte == 112){
  SrvPos = SrvPos + 1;
  if (SrvPos > 180) SrvPos = 180;
  myservo.write(SrvPos); 
}


if (inByte == 113){
  SrvPos = SrvPos - 1;
  if (SrvPos < 1) SrvPos = 1;
  myservo.write(SrvPos); 
}

if (inByte == 114){
  SrvPos = 1;
  myservo.write(SrvPos); 
}

if (inByte == 115){
  SrvPos = 90;
  myservo.write(SrvPos); 
}

if (inByte == 116){
  SrvPos = 180;
  myservo.write(SrvPos); 
}


  }
}

