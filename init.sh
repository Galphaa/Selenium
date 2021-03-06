#!/bin/env bash

## Temporery Files
WORKING_DIR=`mktemp -d -p /tmp`
cd $WORKING_DIR


## Preparation
apt-get -y update 
apt install -y bpython3  python-pip3 unzip   
pip3 install selenium


## Chrome Driver
wget -N https://chromedriver.storage.googleapis.com/2.45/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod +x chromedriver
mv -f chromedriver /usr/local/share/chromedriver
ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

## Firefox Driver 
wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-linux64.tar.gz
tar -xvzf geckodriver-v0.23.0-linux64.tar.gz
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

printf "from selenium import webdriver \n"
printf 'driver = webdriver.Firefox() \n'
printf 'driver.get("google.ge") \n'
printf 'print (driver.title) \n'
printf '\n'
printf "Pro Tips, not reading selenium library use normal user 'not ROOT' \nWhen using pip install selenium, it is instaling on defalt place for pip it may be for 2.7 (if we are using python 3) use pip3 install selenium, if error occurred remove selenium and do it again. \n" 
