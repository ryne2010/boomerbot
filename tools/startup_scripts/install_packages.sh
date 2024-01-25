#!/bin/bash

# Update system
sudo apt-get update && sudo apt-get upgrade -y

# Install feh (used for viewing images stored on RPi with host machine over SSH)
# ! Host machine must have XQuartz installed
sudo apt-get install feh jq

# Install Docker if not installed
USERNAME="pi"
if [ ! -x "$(command -v docker)" ]; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USERNAME
fi