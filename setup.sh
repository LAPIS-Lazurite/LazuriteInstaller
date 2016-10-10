#! /bin/bash
WORK=$(pwd)
sudo apt-get install bc
git clone https://github.com/notro/rpi-source
cd rpi-source
chmod +x rpi-source
./rpi-source
cp ${WORK}/rpi/bcm* /home/pi/linux/arch/arm/boot/dts/
cd /home/pi/linux
make dtbs
sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/
#sudo reboot


