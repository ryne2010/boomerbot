#!/bin/bash

# Function to execute a script and check its exit status
execute_script() {
    echo "Executing script: $1"
    bash "$1"

    # Capture the exit status of the script
    status=$?

    if [ $status -ne 0 ]; then
        echo "Error: Script $1 failed with exit status $status."
        exit $status
    fi
}

# List of startup scripts to execute in order
DIR_NAME="startup_scripts"
STARTUP_SCRIPTS=("$DIR_NAME/check_network.sh" "$DIR_NAME/install_packages.sh" "$DIR_NAME/sync_repo.sh" "$DIR_NAME/run_container.sh")

# Iterate over the scripts and execute each
for script in "${STARTUP_SCRIPTS[@]}"; do
    chmod +x "$script"
    execute_script "$script"
done

echo "All scripts executed successfully."

# Delete temp copied files
rm -rf $DIR_NAME
rm -rf init.sh
