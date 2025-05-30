#!/bin/bash

# Variables
GO_VERSION="1.21.5"
GO_TAR="go$GO_VERSION.linux-amd64.tar.gz"
GO_URL="https://go.dev/dl/$GO_TAR"

# Remove any previous Go installation
sudo rm -rf /usr/local/go

# Download Go tarball
echo "Downloading Go $GO_VERSION..."
wget -q $GO_URL

# Extract to /usr/local
echo "Installing Go $GO_VERSION..."
sudo tar -C /usr/local -xzf $GO_TAR

# Clean up
rm $GO_TAR

# Set up Go environment variables (for current user)
{
  echo ''
  echo '# Go environment'
  echo 'export GOROOT=/usr/local/go'
  echo 'export GOPATH=$HOME/go'
  echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin'
} >> ~/.bashrc

# Reload bashrc
source ~/.bashrc

# Verify installation
echo "Go installation complete. Version:"
go version
