#!/bin/env bash

## Preparation
apt-get update 
apt install bpython3 python-pip3 unzip   
pip3 install selenium

##Temporery Files
WORKING_DIR=`mktemp -d -p /tmp`
cd $WORKING_DIR


## Chrome Driver
wget -N http://chromedriver.storage.googleapis.com/2.26/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod +x chromedriver
mv -f chromedriver /usr/local/share/chromedriver
ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

## Firefox Driver 
wget https://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-linux64.tar.gz
tar -xvzf geckodriver-v0.19.1-linux64.tar.gz
chmod +x geckodriver
cp geckodriver /usr/bin/geckodriver
mv -f geckodriver /usr/local/share/geckodriver
ln -s /usr/local/share/geckodriver /usr/local/bin/geckodriver
ln -s /usr/local/share/geckodriver /usr/bin/geckodriver

## Cleanning
cd ../
rm -rf $WORKING_DIR
 

## Selenium output
TITLE="Selenium Example CODE"
COLUMNS=$(tput cols)
printf "%*s" $(tput cols) | tr " " "="
printf "%*s\n" $(((${#TITLE}+$COLUMNS)/2)) "$TITLE"
printf "%*s" $(tput cols) | tr " " "="


printf  " \t from selenium import webdriver \n "

echo -e \
	\
	' \t driver = webdriver.Firefox()'

echo -e \
	\
	'\t driver.get("google.ge")'

echo -e \
	\
	'\t print (driver.title) \n'
 
echo -e "Pro Tips, problem not reading selenium library use normal user 'not ROOT' \n When using pip install selenium it is instaling on defalt place for pip it may be for 2.7 (we are using python3) pip3 install selenium if mistake was made remove and doit " 
