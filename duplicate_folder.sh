#!/bin/bash

# Check if the source directory, destination name, and open flag (optional) are provided as arguments
if [[ $# -lt 2 ]]; then
	echo "Usage: $0 <source_directory> <destination_name> <open_folder(optional)>"
	exit 1
fi

# Assign the arguments to variables
source_dir=$1
destination_name=$2
open_vscode=$3
run_node_modules=$4

# Check if the source directory exists
if [[ ! -d "$source_dir" ]]; then
	echo "Source directory does not exist."
	exit 1
fi

# Create the destination directory
mkdir "$destination_name"

# Recursive function to duplicate files and folders
function duplicate_directory {
	local source=$1
	local destination=$2

	for file in "$source"/* "$source"/.[!.]*; do
		local filename=$(basename "$file")

		if [[ "$filename" != "node_modules" ]]; then
			if [[ -d "$file" ]]; then
				local new_destination="$destination/$filename"
				mkdir "$new_destination"
				duplicate_directory "$file" "$new_destination"
			elif [[ -f "$file" ]]; then
				cp "$file" "$destination"
			fi
		else
			if [[ -d "$file" ]]; then
				local new_destination="$destination/$filename"
				mv "$file" "$new_destination"
			fi
		fi
	done
}

# Duplicate the source directory
duplicate_directory "$source_dir" "$destination_name"

# Move into new directory
cd "$destination_name"
# echo "Moved into $destination_name"

# Check the value of open_vscode
if [[ "$open_vscode" == "open" ]]; then
	# Open the newly created folder in the currently running VSCode window
	code -r .
fi

# Check the value of run_node_modules
if [[ "$run_node_modules" == "run" ]]; then
	npm start
fi

echo "Folder duplicated successfully."
