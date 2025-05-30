#!/bin/bash

# Change directory to go resources
echo "Change directory to go resources {/usr/local/go/src}"
cd /usr/local/go/src

# Download GoCV repo
echo "Cloning GoCV repository..."
git clone https://github.com/hybridgroup/gocv.git
cd gocv

# install GoCV
echo "Running GoCV installation script..."
make install
echo "GoCV installed successfully."