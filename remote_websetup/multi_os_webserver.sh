#!/bin/bash

yum --help &> /dev/null
if [ $? -eq 0 ]
then

  # Installing Dependencies
  echo "#####################################"
  echo "Installing Dependencies"
  echo "#####################################"
  sudo yum install wget httpd unzip -y > /dev/null
  echo

  # Start and enable the service
  echo "#####################################"
  echo "Start and Enable HTTPD service"
  echo "#####################################"
  sudo systemctl start httpd
  sudo systemctl enable httpd
  echo

  # Creating temporary directory
  echo "#####################################"
  echo "Starting Artifact deployment"
  echo "#####################################"
  mkdir -p /tmp/webfiles
  cd /tmp/webfiles
  echo

  wget $1 &> /dev/null
  unzip 2131_wedding_lite.zip > /dev/null
  sudo cp -r 2131_wedding_lite/* /var/www/html/
  echo

  # Bounce Service
  echo "#####################################"
  echo "Restarting HTTPD server"
  echo "#####################################"
  systemctl restart httpd
  echo

  # Clean Up
  echo "Removing Temporary files"
  rm -rf /tmp/webfiles
  echo

else
  # Installing Dependencies
  echo "#####################################"
  echo "Installing Dependencies"
  echo "#####################################"
  sudo apt update
  sudo apt install wget apache2 unzip -y > /dev/null
  echo

  # Start and enable the service
  echo "#####################################"
  echo "Start and Enable HTTPD service"
  echo "#####################################"
  sudo systemctl start apache2
  sudo systemctl enable apache2
  echo

  # Creating temporary directory
  echo "#####################################"
  echo "Starting Artifact deployment"
  echo "#####################################"
  mkdir -p /tmp/webfiles
  cd /tmp/webfiles
  echo

  wget $1 &> /dev/null
  unzip 2131_wedding_lite.zip > /dev/null
  sudo cp -r 2131_wedding_lite/* /var/www/html/
  echo

  # Bounce Service
  echo "#####################################"
  echo "Restarting HTTPD server"
  echo "#####################################"
  systemctl restart apache2
  echo

  # Clean Up
  echo "Removing Temporary files"
  rm -rf /tmp/webfiles
  echo
fi 
