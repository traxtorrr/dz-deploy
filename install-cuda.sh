#!/bin/bash

# # Install the nvidia-driver-<version>
# echo 'Install nvidia-driver'
# sudo apt install nvidia-driver-570

# # Install the cuda-keyring package:
# echo 'Install cuda-keyring'
# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
# sudo dpkg -i cuda-keyring_1.1-1_all.deb

# #Install CUDA SDK
# echo 'Install CUDA SDK'
# sudo apt-get update
# sudo apt-get -y install cuda-toolkit-12-9

# # Set up CUDA environment variables (for current user)
# echo 'Update CUDA PATH'
# {
#   echo ''
#   echo '# CUDA environment'
#   echo 'export PATH=${PATH}:/usr/local/cuda-12.9/bin'
#   echo 'export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda-12.9/lib64'
# } >> ~/.bashrc

# Install nvidia-container-runtime
echo 'Install nvidia-container-runtime'
curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
sudo apt-get update
sudo apt-get install nvidia-container-runtime