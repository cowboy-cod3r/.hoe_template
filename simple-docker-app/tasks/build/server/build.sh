#!/bin/bash

# Source the environment
. $(readlink -f $(dirname $BASH_SOURCE))/../../env.sh

# Configuration Variables
declare -r images=("${SERVER_NAME}")

# Base Dockerfile variables
declare -r dockerfile_template_loc="${SERVER_DIR}/${DOCKERFILE_TEMPLATE}"

# Replacements
declare -A replacements=(["DEFAULT_OS_TAG"]="${DEFAULT_OS_TAG}" \
                         ["DOCKER_REGISTRY_IP"]="${DOCKER_REGISTRY_IP}" \
                         ["DOCKER_REGISTRY_PORT"]="${DOCKER_REGISTRY_PORT}" \
                         ["DEFAULT_RUBY_TAG"]="${DEFAULT_RUBY_TAG}" \
                         ["DEFAULT_JAVA_TAG"]="${DEFAULT_JAVA_TAG}" \
                         ["PSI_INFRA_EMAIL"]="${PSI_INFRA_EMAIL}")

# Variable replacements
dockerfile_variable_replacement "$(declare -p replacements)" $dockerfile_template_loc

# Build each image in the project
build_images "${images}" "${PROJECT_NAME}" "${PROJECT_DIR}"
