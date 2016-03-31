#! /bin/sh

echo '******************************************************'
echo '*****      Auto setup of Lazurite Library       ******'
echo '******************************************************'
echo ''
echo ''
echo 'STEP1:: get LazDriver from github'

cd ~/driver
git clone git://github.com/LAPIS-Lazurite/LazDriver
cd LazDriver

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
echo 'STEP4:: get LazuriteJava'
cd ~
mkdir java

cd java
git clone git://github.com/LAPIS-Lazurite/LazuriteJava
cd LazuriteJava
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
git clone git://github.com/LAPIS-Lazurite/LazuriteGraph
cd LazuriteGraph
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
echo 'STEP11:: install gem for LazGem'
sudo apt-get install gem
echo ''
echo ''
echo 'STEP12:: install LazGem'
sudo gem install LazGem
echo ''
echo ''
echo 'STEP13:: Getting source code of LazGem'
cd ~/ruby
git clone git://github.com/LAPIS-Lazurite/LazGem
echo ''
echo ''
echo 'Complete!!'
