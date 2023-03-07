#!/bin/bash

echo "============================================"
date
ls /var/run/httpd/httpd.pid &> /dev/null
if [ $? -eq 0 ]
then 
   echo "Httpd is running"
else
   echo "Httpd is Not running"
   echo "Start the httpd process"
   systemctl start httpd
   if [ $? -eq 0 ]
   then
     echo "Process is running"
   else
     echo "Process start failed"
   fi
fi
echo "============================================"
echo
