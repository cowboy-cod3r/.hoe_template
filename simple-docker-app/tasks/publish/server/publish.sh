#!/bin/bash

# Source the environment and docker files
. $(readlink -f $(dirname $BASH_SOURCE))/../../env.sh

# Publish the image
publish "${SERVER_NAME}" "${PROJECT_NAME}"
