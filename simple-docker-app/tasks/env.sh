#!/bin/bash

# Source the environment
. $(readlink -f $(dirname $BASH_SOURCE))/../../../parent/docker.sh
. $(readlink -f $(dirname $BASH_SOURCE))/../../../parent/portAllocations.sh


# Get the ports for this service
declare -r PORT_MAP=$(port_allocation_getPortMapForService jenkins)

# Project variables
declare -r PROJECT_DIR=$(readlink -f $(dirname $BASH_SOURCE))/..
declare -r PROJECT_NAME=$(basename $(readlink -f $(dirname $PROJECT_DIR/..)))

# Image Folder Name
declare -r SERVER_NAME="server"
declare -r AGENT_NAME="agent"

# Image Dirs (full paths)
declare -r SERVER_DIR="${PROJECT_DIR}/${SERVER_NAME}"
declare -r AGENT_DIR="${PROJECT_DIR}/${AGENT_NAME}"
