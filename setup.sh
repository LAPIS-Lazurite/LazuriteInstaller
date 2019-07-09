#! /bin/bash
WORK=$(pwd)
echo "*******************************************************************"
echo "*****  Start setup Lazurite Installer                  ************"
echo "*****    installing required software                  ************"
echo "*******************************************************************"
sudo apt-get install -y git bc bison flex libssl-dev doxygen ruby ruby-dev

# enabling I2C & SPI
echo "*******************************************************************"
echo "*****    Enabling I2C and SPI                          ************"
echo "*******************************************************************"
sudo bash setHard.sh

echo "*******************************************************************"
echo "*****    Downloading Linux kernel source               ************"
echo "*******************************************************************"
echo Kernel Version = $VER
    git clone https://github.com/notro/rpi-source
    cd rpi-source
    chmod +x rpi-source
    ./rpi-source -g --skip-gcc

cd /home/pi/linux/arch/arm/boot/dts
echo "*******************************************************************"
echo "*****    Change device-tree-file                       ************"
echo "*******************************************************************"
echo $WORK
$WORK/LazCnv.awk bp3596_spi
cd /home/pi/linux
echo "*******************************************************************"
echo "*****    Building device tree file                     ************"
echo "*******************************************************************"
make dtbs
sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/

echo "*******************************************************************"
echo "***** End of setup.  Please reboot Raspberry Pi.       ************"
echo "***** Then please execute install.sh                   ************"
echo "*******************************************************************"
#sudo reboot


