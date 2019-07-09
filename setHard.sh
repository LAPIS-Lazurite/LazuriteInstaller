#! /bin/bash
WORK=$(pwd)
sudo cp /boot/config.txt /boot/config.bak

# enabling I2C & SPI
awk '{if (/i2c_arm|spi/){if(substr($0,0,2)=="#"){print substr($0,2,length($0));}}else{print $0}}' /boot/config.bak > /boot/config.txt

I2CDEV=`sudo cat /etc/modules |grep i2c-dev`

if [ "$I2CDEV" = "i2c-dev" ] ; then
	exit 0
fi
if [[ "$I2CDEV" = *"#"* ]] ; then
	echo "remove #"
	cp /etc/modules /etc/modules.bak
	awk '{
		if (/i2c-dev/) {
			if (substr($0,0,2)=="#"){
				print substr($0,2,length($0));
			} else { print $0 }
		} else {
			print $0;
		}
	} ' /etc/modules.bak > /etc/modules
else 
	echo "i2c-dev" >> /etc/modules
fi

