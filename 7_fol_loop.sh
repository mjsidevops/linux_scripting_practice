#!/bin/bash

MYUSERS="terrafrom jenkins k8s"

for var in $MYUSERS
do 
  echo "adding the user $var"
  useradd $var
  echo "=============================="
done
