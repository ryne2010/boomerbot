#!/bin/bash

# Function to log messages
log() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1"
}

# Repository information
REPO_OWNER="your-username"
REPO_NAME="your-repository"

# GitHub API URL for the latest release
API_URL="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/latest"

# Determine the host architecture
HOST_ARCH=$(uname -m)
log "Host architecture: $HOST_ARCH"

# Fetch the latest release data
RELEASE_DATA=$(curl -s $API_URL)
if [ $? -ne 0 ]; then
    log "Error: Failed to fetch release data from GitHub."
    exit 1
fi

# Find the appropriate asset based on host architecture
ASSET_URL=$(echo $RELEASE_DATA | jq -r ".assets[] | select(.name | contains(\"$HOST_ARCH\")) | .browser_download_url")
if [ -z "$ASSET_URL" ]; then
    log "Error: No suitable asset found for architecture $HOST_ARCH."
    exit 1
fi

# Extract the filename
FILENAME=$(basename "$ASSET_URL")

# Download the asset
log "Downloading $FILENAME..."
curl -L -o "$FILENAME" "$ASSET_URL"
if [ $? -ne 0 ]; then
    log "Error: Failed to download the file."
    exit 1
fi

# Set execution permission
chmod +x "$FILENAME"
if [ $? -ne 0 ]; then
    log "Error: Failed to set execution permission on $FILENAME."
    exit 1
fi

# Execute the binary
log "Executing $FILENAME..."
./"$FILENAME"
EXEC_STATUS=$?

if [ $EXEC_STATUS -ne 0 ]; then
    log "Error: Execution of $FILENAME failed with status $EXEC_STATUS."
else
    log "Execution of $FILENAME completed successfully."
fi
