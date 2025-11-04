#!/bin/bash


# do not run this script with root permission
if (( $EUID == 0 )); then
  echo "This script should not be run as root."
  exit 1
fi

# config
for dir in */; do
    config_filepath=${dir}config.sh
    if [ -f "$config_filepath" ]; then
        bash "$config_filepath"
    fi
done

# manual intervention notice
for dir in */; do
    config_filepath=${dir}manual_intervention_notice.sh
    if [ -f "$config_filepath" ]; then
        bash "$config_filepath"
    fi
done
