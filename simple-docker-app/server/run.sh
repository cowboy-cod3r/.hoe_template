#!/bin/bash

declare -r log_file_loc="/var/log/jenkins/jenkins.log"
declare -r max=5
declare count=0

# Configure Git
git config --global user.email "sean.humbarger@issinc.com"
git config --global user.name "jenkins"

# Correct perms
chown -R jenkins:jenkins /var/lib/jenkins

# Start Jenkins
/etc/init.d/jenkins start

# Give jenkins a bit of time to start
while [[ "${count}" -lt ${max} ]];do
  if [[ -f "${log_file_loc}" ]];then
    break;
  fi
  count=$[$count +1]
  sleep 1
done

# Tail the log so the process doesn't exit
tail -f $log_file_loc
