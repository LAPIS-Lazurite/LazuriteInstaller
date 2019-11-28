#! /bin/bash
WORK=$(pwd)
sudo cp /boot/config.txt /boot/config.bak

# enabling I2C & SPI
sudo raspi-config nonint do_spi 0
sudo raspi-config nonint do_i2c 0
