#! /bin/bash
WORK=$(pwd)
sudo apt-get install -y bc doxygen npm node-gyp
git clone https://github.com/notro/rpi-source
cd rpi-source
chmod +x rpi-source
./rpi-source --skip-gcc
cd /home/pi/linux/arch/arm/boot/dts
echo $WORK
$WORK/LazCnv.awk bp3596_spi
cd /home/pi/linux
make dtbs
sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/
#sudo reboot


