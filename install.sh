#! /bin/bash
WORK=$(pwd)
echo '######################################################################'
echo '#      Install and update Lazurite Libraries                         #'
echo '######################################################################'
echo 'STEP1: Update LazDriver(Linux Kernel driver for Lazurite)'
cd ~
if [ ! -e 'driver' ]; then
	mkdir driver
fi

cd ~/driver
if [ -e 'LazDriver' ]; then
	echo 'update LazDriver'
	cd LazDriver
	git pull
	make
else
	echo 'Cannot find LazDriver. Download from github'
	git clone git://github.com/LAPIS-Lazurite/LazDriver
	cd LazDriver
	make
fi
echo ''
echo ''
echo 'STEP2: Update liblazurite(Linux dynamic link library)'
cd ~/driver
if [ -e 'liblazurite' ]; then
	echo 'update liblazurite'
	cd liblazurite
	git pull
else
	echo 'Cannot find liblazurite. Download from github'
	git clone git://github.com/LAPIS-Lazurite/liblazurite
	cd liblazurite
fi
rm lib/drv-lazurite.h
ln -s /home/pi/driver/LazDriver/drv-lazurite.h lib/drv-lazurite.h
make
echo ''
echo ''
echo 'STEP3: Update LazuriteJava (JAVA API for liblazurite)'
cd ~/driver
if [ -e 'LazuriteJava']; then
	echo 'update LazuriteJava'
	cd LazuriteJava
	git pull
else
	echo 'Cannot find LazuriteJava. Download from github'
	git clone git://github.com/LAPIS-Lazurite/LazuriteJava
	cd LazuriteJava
fi

wget https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna/4.2.2/jna-4.2.2.jar
wget central.maven.org/maven2/com/nativelibs4java/jnaerator-runtime/0.12/jnaerator-runtime-0.12.jar
sudo cp jnaerator-runtime-0.12.jar jna-4.2.2.jar /usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt/jre/lib/ext
make
make install

echo ''
echo ''
echo 'STEP4: Update LazGem (RUBY GEM for LazDriver)'
cd ~/driver
if [ -e 'LazGem' ]; then
	echo 'update LazGem'
	cd LazGem
	git pull
	sudo gem install LazGem
else
	echo 'Cannot find LazGem. Download from github'
	git clone git://github.com/LAPIS-Lazurite/LazGem
	sudo gem install LazGem

fi

echo ''
echo ''
echo 'STEP5: Update PyLaz (Python Library)'
cd ~/driver
if [ -e 'PyLaz' ]; then
	echo 'update PyLaz'
	cd LazGem
	git pull
else
	echo 'Cannot find LazGem. Download from github'
	git clone git://github.com/LAPIS-Lazurite/PyLaz

fi
echo ''
echo ''
echo ''
echo '######################################################################'
echo '#          End of process                                            #'
echo '######################################################################'
echo ''

