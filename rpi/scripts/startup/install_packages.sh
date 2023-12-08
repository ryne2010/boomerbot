#!/bin/bash

# Update system
sudo apt-get update && sudo apt-get upgrade -y

# Install Docker if not installed
USERNAME="pi"
if [ ! -x "$(command -v docker)" ]; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USERNAME
fi