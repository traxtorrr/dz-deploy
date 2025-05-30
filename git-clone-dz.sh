#!/bin/bash

# Set your GitLab SSH URL here
GIT_REPO_SSH_URL="git@gitlab-ce.arv.co.th:cloud_arv/arv-core/deepzoom_product/deepzoom.git"

# Optional: directory name (default to repo name if not set)
REPO_NAME=$(basename -s .git "$GIT_REPO_SSH_URL")
TARGET_DIR="$HOME/$REPO_NAME"

# Extract repo name from SSH URL if TARGET_DIR is empty
if [ -z "$TARGET_DIR" ]; then
  REPO_NAME=$(basename -s .git "$GIT_REPO_SSH_URL")
  TARGET_DIR="$REPO_NAME"
fi

echo "Cloning repository from: $GIT_REPO_SSH_URL"
echo "Target directory: $TARGET_DIR"

# Make sure git is installed
if ! command -v git &> /dev/null; then
  echo "Git is not installed. Installing git..."
  sudo apt update && sudo apt install -y git
fi

# Clone the repository
git clone "$GIT_REPO_SSH_URL" "$TARGET_DIR"

# Check result
if [ $? -eq 0 ]; then
  echo "Repository cloned successfully into $TARGET_DIR"
else
  echo "Failed to clone repository."
  exit 1
fi
