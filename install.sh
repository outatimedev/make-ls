#!/bin/bash

# Define the installation directory
install_dir="/usr/local/bin"

# Define the script name
script_name="makels"

# Define the source script name
source_script="make-ls.sh"

# Check if the source script exists
if [[ ! -f "$source_script" ]]; then
	echo "Error: Source script '$source_script' does not exist."
	exit 1
fi

# Copy the script to the installation directory
if sudo cp "$source_script" "$install_dir/$script_name"; then
	echo "Script copied successfully."
else
	echo "Error: Failed to copy the script."
	exit 1
fi

# Make the script executable
if sudo chmod +x "$install_dir/$script_name"; then
	echo "Script made executable."
else
	echo "Error: Failed to make the script executable."
	exit 1
fi

echo "Installation complete. You can now use 'makels' command in any directory."
