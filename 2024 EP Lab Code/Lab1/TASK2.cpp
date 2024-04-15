/* mbed Microcontroller Library
 * Copyright (c) 2019 ARM Limited
 * SPDX-License-Identifier: Apache-2.0
 */

#include "mbed.h"

#define WAIT_TIME_MS 500
#define LED D10
#define BUTTON1 D5
#define BUTTON2 D6

// Define PWM output for LED brightness control
PwmOut led1(LED);

// Define digital inputs for push buttons
DigitalIn button1(BUTTON1);
DigitalIn button2(BUTTON2);

// Define initial brightness and step size for brightness adjustment
float brightness = 0.5;
float step = 0.1;

// Track for state of LED
bool LEDState = false;

// Function to increase LED brightness gradually
void increaseBrightness() {
    if (brightness + step <= 1.0) {
        brightness += step;
        led1.write(brightness);
    }
}

// Function to decrease LED brightness gradually
void decreaseBrightness() {
    if (brightness - step >= 0.0) {
        brightness -= step;
        led1.write(brightness);
    }
}

int main() {
    // Set initial LED brightness
    led1 = brightness;

    // Main loop to continuously monitor push buttons
    while (1) {

        thread_sleep_for(WAIT_TIME_MS);

        // Increase brightness when button is pressed

        if (!button1) {
            increaseBrightness();
            thread_sleep_for(WAIT_TIME_MS); // Debounce delay
            LEDState = true;
        }

        // Decrease brightness when button2 is pressed
        if (!button2) {
            decreaseBrightness();
            thread_sleep_for(WAIT_TIME_MS); // Debounce delay
            LEDState = true;
        }

        // Set LED brightness
        led1 = brightness;

        // Toggle LED on/off when no button is pressed
        if ((button1) && (button2)) {
            LEDState = ! LEDState;
            brightness = LEDState ? 1.0 : 0.0;
            thread_sleep_for(WAIT_TIME_MS); // Debounce delay
        }

        led1.write(brightness);

        thread_sleep_for(WAIT_TIME_MS);
    }
}

