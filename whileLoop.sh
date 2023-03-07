#!/bin/bash

counter=0

while [ $counter -lt 5 ]
do
  echo "Looping..."
  echo "value is $counter"
  counter=$(( $counter+1 ))
done
