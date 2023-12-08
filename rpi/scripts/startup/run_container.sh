#!/bin/bash

# Function to handle Docker build and run
docker_build_and_run() {
    docker build -t boomerbot .
    if [ $? -eq 0 ]; then
        docker run -d --privileged -p 5000:5000 boomerbot
        # TODO: remove `--privileged` and reduce to only what is needed
    else
        echo "Docker build failed. Exiting script."
        exit 1
    fi
}

# Navigate to the repo directory and build/run Docker container with `docker` group
cd ~/boomerbot
newgrp docker
docker_build_and_run
