#! /bin/sh

echo '******************************************************'
echo '***** Installing LazuriteGraph for Raspberry Pi ******'
echo '******************************************************'
echo ''
echo ''
echo 'get LazDriver from github'
cd ~
cd driver
git clone git://github.com/LAPIS-Lazurite/LazDriver
cd LazDriver

echo ''
echo ''
echo 'build LazDriver'
make
echo ''
echo ''
echo 'installing rxtx serial library'
sudo apt-get install librxtx-java

echo ''
echo ''
echo 'get LazuriteJava'
cd ~
mkdir java
cd java

echo ''
echo ''
echo 'build LazuriteJava'
git clone git://github.com/LAPIS-Lazurite/LazuriteJava
cd LazuriteJava
make
echo ''
echo ''
echo 'Install LazuriteJava'
make install
echo ''
echo ''
echo 'get LazuriteGraph'
cd ~/java
git clone git://github.com/LAPIS-Lazurite/LazuriteGraph
cd LazuriteGraph
echo ''
echo ''
echo 'install external library'
make install
echo ''
echo ''
echo 'build LazuriteGraph'
make
echo ''
echo 'enabling SubGHz tab'
cp lib/linux/graph.pref .
echo ''
echo ''
echo 'End of install'

