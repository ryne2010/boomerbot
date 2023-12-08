#!/bin/bash

# Function to check network connectivity
check_network() {
    wget -q --spider http://google.com
    if [ $? -eq 0 ]; then
        echo "Network is online."
    else
        echo "Network is offline. Exiting script."
        exit 1
    fi
}

# Check for network connectivity
check_network;