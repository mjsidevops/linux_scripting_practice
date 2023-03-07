#!/bin/bash

USR='devops'

for host in `cat remhosts`
do
  echo "================================"
  echo "Connecting to $host"
  echo "Pushing scripts to $host"
  scp multi_os_webserver.sh $USR@$host:/tmp/
  ssh $USR@$host /tmp/multi_os_webserver.sh https://www.tooplate.com/zip-templates/2131_wedding_lite.zip
  echo "================================="
  echo
done
