#!/bin/env bash
apt-get update 
apt install bpython3
apt install python-pip3
pip3 install selenium
apt install unzip  

mkdir temp
cd temp
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
rm -rf temp 

TITLE="Test Drive"
COLUMNS=$(tput cols)
printf "%*s" $(tput cols) | tr " " "="
printf "%*s\n" $(((${#TITLE}+$COLUMNS)/2)) "$TITLE"
printf "%*s" $(tput cols) | tr " " "="

#    from selenium import webdriver 
#    
#    driver = webdriver.Firefox()
#    driver.get("google.ge")
#    print (driver.title) 
