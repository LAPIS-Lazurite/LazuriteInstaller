#! /bin/bash
WORK=$(pwd)
sudo apt-get install bc
git clone https://github.com/notro/rpi-source
cd rpi-source
chmod +x rpi-source
./rpi-source
cd /home/pi/linux/arch/arm/boot/dts
echo $WORK
$WORK/LazCnv.awk bp3596_spi
#mv bcm2708-rpi-b-plus.dts bcm2708-rpi-b-plus.dts.bak
#mv bcm2708-rpi-b.dts bcm2708-rpi-b.dts.bak
#mv bcm2708-rpi-cm.dts bcm2708-rpi-cm.dts.bak
#mv bcm2709-rpi-2-b.dts bcm2709-rpi-2-b.dts.bak
##mv bcm2710-rpi-3-b.dts bcm2710-rpi-3-b.dts.bak
#mv bcm2710-rpi-cm3.dts bcm2710-rpi-cm3.dts.bak
#mv bcm2835-rpi-a-plus.dts bcm2835-rpi-a-plus.dts.bak
#mv bcm2835-rpi-b-plus.dts bcm2835-rpi-b-plus.dts.bak
#mv bcm2835-rpi-b-rev2.dts bcm2835-rpi-b-rev2.dts.bak
#mv bcm2835-rpi-b.dts bcm2835-rpi-b.dts.bak
#mv bcm2835-rpi-cm.dts bcm2835-rpi-b.dts.bak
#cp ${WORK}/rpi/bcm* /home/pi/linux/arch/arm/boot/dts/
cd /home/pi/linux
make dtbs
sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/
#sudo reboot


