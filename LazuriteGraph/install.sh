#! /bin/sh

cd ~
cd driver
git clone git://github.com/LAPIS-Lazurite/LazDriver
cd LazDriver
make

cd ~
mkdir java
cd java

git clone git://github.com/LAPIS-Lazurite/LazuriteJava
cd LazuriteGraph
make
make install

cd ~/java
git clone git://github.com/LAPIS-Lazurite/LazuriteGraph
cd LazuriteGraph
make install
make
cp lib/linux/graph.pref .

