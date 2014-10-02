#!/bin/bash

# Source the environment
. $(readlink -f $(dirname $BASH_SOURCE))/../../env.sh

# Configuration Variables
declare -r images=("server")
declare -r identifier="${BASE_PREFIX}${PROJECT_NAME}/${SERVER_NAME}:${DEFAULT_JENKINS_VERSION}"

# Cleanup and start the image
for image in ${images[@]};do
  declare -r container_name="${PROJECT_NAME}-${image}"

  # Clean up
  stop "${container_name}"
  remove_container "${container_name}"

  # Start it
  echo "INFO: Starting ${identifier}"
  echo "docker run -d -i -t --name ${container_name} --volume=/opt/apps/jenkins:/var/lib/jenkins:rw --entrypoint="run" -p ${PORT_MAP} ${identifier}"
  docker run -d -i -t \
    -p "${PORT_MAP}" \
    --volume=/opt/apps/jenkins:/var/lib/jenkins:rw \
    --entrypoint="run" \
    --name $container_name \
    $identifier

  if [[ $? -ne 0 ]];then
    echo "ERROR: An error occurred attempting to deploy '${identifier}'"
    exit 1
  fi
done
