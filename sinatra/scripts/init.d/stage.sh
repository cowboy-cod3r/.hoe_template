#!/bin/bash
if [[ -f <%= project %> ]];then
  # Stage the file
  echo "INFO: Staging file"
  cp -rp <%= project %> /etc/init.d

  # Permissions
  echo "INFO: Change file permissions"
  chmod 755 /etc/init.d/<%= project %>
  chown -R root:root /etc/init.d/<%= project %>
else
  echo "ERROR: The file <%= project %> cannot be found"
  exit 1
fi
