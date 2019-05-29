#! /bin/bash
WORK=$(pwd)
sudo apt-get install -y git bc bison flex libssl-dev
VER=`uname -r | sed -e 's/[+-].*//'`
echo Kernel Version = $VER
if [ "$VER" = "4.9.80" ]; then   # 4.9.80 only 
    cd ~/
    wget https://github.com/raspberrypi/linux/archive/rpi-4.9.y-stable.zip
    unzip rpi-4.9.y-stable.zip
    ln -s linux-rpi-4.9.y-stable linux
    $WORK/replace_Module_symvers.rb
    cd ~/linux
    KERNEL=kernel7
    make bcm2709_defconfig
else
    git clone https://github.com/notro/rpi-source
    cd rpi-source
    chmod +x rpi-source
    ./rpi-source -g --skip-gcc
fi

cd /home/pi/linux/arch/arm/boot/dts
echo $WORK
$WORK/replace_Module_symvers.rb
$WORK/LazCnv.awk bp3596_spi
cd /home/pi/linux
make dtbs
sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/

if [ "$VER" = "4.9.80" ]; then   # 4.9.80 only 
    cd /lib/modules/4.9.80-v7+
    sudo ln -s /home/pi/linux build
    sudo ln -s /home/pi/linux source
fi
#sudo reboot


