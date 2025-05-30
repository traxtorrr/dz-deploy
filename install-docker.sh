#!/bin/bash

set -e  # Exit on any error

echo "🚀 Updating package index..."
sudo apt-get update

echo "📦 Installing required packages..."
sudo apt-get install -y \
    ca-certificates \
    curl \

echo "🔐 Adding Docker’s official GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc 
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "📁 Setting up the Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package index again..."
sudo apt-get update

echo "🐳 Installing Docker Engine, CLI, and containerd..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "✅ Docker installed successfully!"

echo "🔧 Adding current user to 'docker' group (you may need to log out and back in)..."
sudo usermod -aG docker $USER

echo "🎉 Done! You can verify with: docker --version"
