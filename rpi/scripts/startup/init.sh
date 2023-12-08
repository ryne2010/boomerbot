#!/bin/bash

# Function to run a script and check its exit status
run_script() {
    echo "Running script: $1"
    bash "$1"

    # Capture the exit status of the script
    status=$?

    if [ $status -ne 0 ]; then
        echo "Error: Script $1 failed with exit status $status."
        exit $status
    fi
}

# List of scripts to run in order
SCRIPTS=("check_network.sh" "install_packages.sh" "sync_repo.sh" "run_container.sh")

# Iterate over the scripts and run them
for script in "${SCRIPTS[@]}"; do
    run_script "$script"
done

echo "All scripts executed successfully."
