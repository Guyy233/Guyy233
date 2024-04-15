#include "mbed.h"
#include "platform/mbed_thread.h"

// Define bus for 7-segment display segments
BusOut display(D2, D3, D4, D5, D6, D9, D10, D11); //segments A,B,C,D,E,F,G,DP
// Define pins for push buttons
DigitalIn buttonUp(D1, PullDown);
DigitalIn buttonDown(D0, PullDown);
// bool ledstate = false;
// Function to display a digit on the 7-segment display
void displayDigit(int digit) {
    switch (digit) {
        case 0: display = 0x3F; break; // 0
        case 1: display = 0x06; break; // 1
        case 2: display = 0x5B; break; // 2
        case 3: display = 0x4F; break; // 3
        case 4: display = 0x66; break; // 4
        case 5: display = 0x6D; break; // 5
        case 6: display = 0x7D; break; // 6
        case 7: display = 0x07; break; // 7
        case 8: display = 0x7F; break; // 8
        case 9: display = 0x6F; break; // 9
    }
    thread_sleep_for(1000);
}
int main() {
    int counter = 0; // Initialize counter
    while (1) {
        // Check if the up button is pressed
        while (buttonDown) {
            counter++; // Increment counter
            if (counter > 9) {
                counter = 0; // Reset counter if it exceeds 9
            }
            displayDigit(counter);
            // ledstate = true;
        }
        //Check if the down button is pressed
        while (buttonDown) {
            counter--; // Decrement counter
            if (counter < 0) {
                counter = 9; // Set counter to 9 if it goes below 0
            }
            displayDigit(counter);
            // ledstate = true;
        }
        // ledstate = true ;
        // Check if ledstate is true and display accordingly
        // if (ledstate) {
        //     displayDigit(counter);
        //     ledstate = false; // Reset ledstate after displaying
        // }
        thread_sleep_for(250);
    }
    return 0;
}
