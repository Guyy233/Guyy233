#include "mbed.h"

SPI spi(A6, A5, A4); // MOSI, MISO, SCLK
DigitalOut cs(D9); //SS
int main() 
{
    cs = 1; // Set CS high initially
    spi.format(8, 0); // 8 bits, mode 0
    spi.frequency(1000000); // Configure 1 MHz
    printf("SPI Loopback Code Started!\n");
    while (1) 
    {
        // Set CS low, to select slave
        cs = 0;
        thread_sleep_for(100);
        char SendMes[] = "Hello world!";
        char RevMes[sizeof(SendMes)]; // Array to store received message
        // Send data, MOSI
        for (int i = 0; i < sizeof(SendMes); i++) 
        {
            RevMes[i] = spi.write(SendMes[i]);
        }
        // Print
        printf("Received message is: %s\n", RevMes);
        // Set CS high to deselect slave
        cs = 1;
        thread_sleep_for(1000);// Rest
    }
    return 0;
}
