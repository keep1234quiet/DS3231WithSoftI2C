/*

Sets the time and prints back time stamps for 5 seconds

Based on DS3231_set.pde
by Eric Ayars
4/11

Added printing back of time stamps and increased baud rate
(to better synchronize computer and RTC)
Andy Wickert
5/15/2011

*/

//#include <DS3231.h>
//#include <Wire.h>

#include "DS3231WithSoftI2C.h"
extern SoftWire Wire;

DS3231 Clock;

bool Century = true,PM = true,h12 = false;

void setup() {
	// Start the serial port
	Serial.begin(57600);

	// Start the I2C interface
	Wire.begin();


  Serial.println("------TIME NOW------");
}

void loop() {

	delay(1000);
	Serial.print(Clock.getYear(), DEC);
	Serial.print("-");
	Serial.print(Clock.getMonth(Century), DEC);
	Serial.print("-");
	Serial.print(Clock.getDate(), DEC);
	Serial.print(" ");
	Serial.print(Clock.getHour(h12, PM), DEC); //24-hr
	Serial.print(":");
	Serial.print(Clock.getMinute(), DEC);
	Serial.print(":");
	Serial.println(Clock.getSecond(), DEC);
}

