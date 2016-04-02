#! /bin/bash

echo '*********************************************************'
echo '**** Install/Update LazuriteGraph for Raspberry Pi ******'
echo '*********************************************************'
echo ''
echo ''
echo 'STEP1:: get or update LazDriver from github'
cd ~/driver
if [ -e 'LazDriver' ]; then
	echo 'update LazDriver'
	cd LazDriver
	git pull
else
	echo 'downloading LazDriver'
	git clone git://github.com/LAPIS-Lazurite/LazDriver
	cd LazDriver
fi
echo ''
echo ''
echo 'STEP2:: build LazDriver'
make

echo ''
echo ''
echo 'STEP3:: installing rxtx serial library'
sudo apt-get install librxtx-java

echo ''
echo ''
echo 'STEP4:: get or update LazDriver from LazuriteJava'
cd ~
if [ ! -e 'java' ]; then
	mkdir java
fi
cd java
if [ -e 'LazuriteJava' ]; then
	cd LazuriteJava
	git pull
else
	git clone git://github.com/LAPIS-Lazurite/LazuriteJava
	cd LazuriteJava
fi

echo ''
echo ''
echo 'STEP5:: build LazuriteJava'
make
echo ''
echo ''
echo 'STEP6:: Install LazuriteJava'
make install
echo ''
echo ''
echo 'STEP7:: get LazuriteGraph'
cd ~/java
if [ -e 'LazuriteGraph' ]; then
	cd LazuriteGraph
	git pull
else
	git clone git://github.com/LAPIS-Lazurite/LazuriteGraph
	cd LazuriteGraph
fi
echo ''
echo ''
echo 'STEP8:: install external library'
make install
echo ''
echo ''
echo 'STEP9:: build LazuriteGraph'
make
echo ''
echo 'STEP10:: enabling SubGHz tab'
cp lib/linux/graph.pref .
echo ''
echo ''
echo 'Complete !!'
echo ''



