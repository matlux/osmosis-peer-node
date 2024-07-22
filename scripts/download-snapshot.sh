#!/bin/bash

# Fetch the snapshot URL
export SNAPSHOT_URL=$(curl -s https://osmosis.fra1.digitaloceanspaces.com/osmo-test-5/snapshots/latest)

# Extract the file name from the URL
file_name=$(basename "$SNAPSHOT_URL")

# Print the file name
echo "The file name is: $file_name"

# Download the file using wget
wget "$SNAPSHOT_URL"
