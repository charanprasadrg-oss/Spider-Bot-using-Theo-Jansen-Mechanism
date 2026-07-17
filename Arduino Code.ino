/*

   Spider Bot – Basic Navigation Code

   Hardware: Arduino UNO (or compatible) + L298N + 2 DC motors + battery

 

   Motion provided:

     - forward(durationMs)

     - backward(durationMs)

     - turnLeft(durationMs)

     - turnRight(durationMs)

     - stopMotors(durationMs)

     - stopMotors() [immediate stop, no delay]

 

   Assumed connections (change pin numbers if your wiring is different):

 

     Left motor:

       L298N IN1 -> D8

       L298N IN2 -> D9

       L298N ENA -> D5 (PWM)

 

     Right motor:

       L298N IN3 -> D10

       L298N IN4 -> D11

       L298N ENB -> D6 (PWM)

 

   Both motors share common GND with Arduino and battery.

*/

 

///////////////////////

// Pin Definitions  //

///////////////////////

 

// Left motor pins

const int IN1 = 8;    // L298N IN1

const int IN2 = 9;    // L298N IN2

const int ENA = 5;    // L298N ENA (PWM)

 

// Right motor pins

const int IN3 = 10;   // L298N IN3

const int IN4 = 11;   // L298N IN4

const int ENB = 6;    // L298N ENB (PWM)

 

// Motor speed (0–255). Adjust based on your motors and battery.

int motorSpeed = 180;

 

void setup() {

  // Set all control pins as outputs

  pinMode(IN1, OUTPUT);

  pinMode(IN2, OUTPUT);

  pinMode(ENA, OUTPUT);

 

  pinMode(IN3, OUTPUT);

  pinMode(IN4, OUTPUT);

  pinMode(ENB, OUTPUT);

 

  // Initially stop

  stopMotors();

 

  // Optional: Serial for debugging

  Serial.begin(9600);

  Serial.println("Spider Bot navigation started.");

}

 

void loop() {

  // Example demonstration sequence:

  Serial.println("Forward 2 seconds");

  forward(2000);        // move forward for 2 s

  stopMotors(500);      // stop for 0.5 s

 

  Serial.println("Backward 1.5 seconds");

  backward(1500);       // move backward for 1.5 s

  stopMotors(500);

 

  Serial.println("Turn left 1 second");

  turnLeft(1000);       // turn left for 1 s

  stopMotors(500);

 

  Serial.println("Turn right 1 second");

  turnRight(1000);      // turn right for 1 s

  stopMotors(1500);

 

  // Repeat

}

 

////////////////////////

// Motion Functions  //

////////////////////////

 

// Forward for a specified duration (ms)

void forward(unsigned long durationMs) {

  // Left motor forward

  digitalWrite(IN1, HIGH);

  digitalWrite(IN2, LOW);

  analogWrite(ENA, motorSpeed);

 

  // Right motor forward

  digitalWrite(IN3, HIGH);

  digitalWrite(IN4, LOW);

  analogWrite(ENB, motorSpeed);

 

  delay(durationMs);

}

 

// Backward for a specified duration (ms)

void backward(unsigned long durationMs) {

  // Left motor backward

  digitalWrite(IN1, LOW);

  digitalWrite(IN2, HIGH);

  analogWrite(ENA, motorSpeed);

 

  // Right motor backward

  digitalWrite(IN3, LOW);

  digitalWrite(IN4, HIGH);

  analogWrite(ENB, motorSpeed);

 

  delay(durationMs);

}

 

// Turn left (approx. on the spot) for a specified duration (ms)

void turnLeft(unsigned long durationMs) {

  // Left motor backward

  digitalWrite(IN1, LOW);

  digitalWrite(IN2, HIGH);

  analogWrite(ENA, motorSpeed);

 

  // Right motor forward

  digitalWrite(IN3, HIGH);

  digitalWrite(IN4, LOW);

  analogWrite(ENB, motorSpeed);

 

  delay(durationMs);

}

 

// Turn right (approx. on the spot) for a specified duration (ms)

void turnRight(unsigned long durationMs) {

  // Left motor forward

  digitalWrite(IN1, HIGH);

  digitalWrite(IN2, LOW);

  analogWrite(ENA, motorSpeed);

 

  // Right motor backward

  digitalWrite(IN3, LOW);

  digitalWrite(IN4, HIGH);

  analogWrite(ENB, motorSpeed);

 

  delay(durationMs);

}

 

// Stop both motors immediately (no delay)

void stopMotors() {

  // Disable left motor

  digitalWrite(IN1, LOW);

  digitalWrite(IN2, LOW);

  analogWrite(ENA, 0);

 

  // Disable right motor

  digitalWrite(IN3, LOW);

  digitalWrite(IN4, LOW);

  analogWrite(ENB, 0);

}

 

// Stop both motors and hold that state for durationMs

void stopMotors(unsigned long durationMs) {

  stopMotors();

  delay(durationMs);

}

 