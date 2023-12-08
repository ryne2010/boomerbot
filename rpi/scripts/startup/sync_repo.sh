#!/bin/bash

# Set up GitHub SSH keys (Ensure this is secure)
# Assuming keys are already in place
REPO_DIR="/boomerbot"
REPO_URL="https://github.com/ryne2010/boomerbot.git"

# Check if this is the first boot
if [ ! -d "$REPO_DIR" ]; then
    # Clone repo if directory doesn't exist (first boot)
    # git clone "$REPO_URL" "$REPO_DIR"
    git clone "$REPO_URL"
    echo "Successfully cloned repo."
else
    # Pull latest changes otherwise
    cd "$REPO_DIR"
    git pull
    echo "Successfully updated repo."
fi