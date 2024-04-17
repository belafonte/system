#!/bin/bash

# Setup Icons
read -p "Setting up Icons... " -n1 -s
echo '\n'

# Specify the directory containing the folders with .icns files
icns_directory=$(pwd)

# Loop through all folders in the directory
for folder in "$icns_directory"/*; do
	if [ -d "$folder" ]; then
		# Extract the folder name (application name)
		folder_name=$(basename "$folder")

		# Check if the application exists in /Applications
		if [ -d "/Applications/${folder_name}.app" ]; then
			# Loop through .icns files in the folder
			for icns_file in "$folder"/*.icns; do
				if [ -f "$icns_file" ]; then
					# Copy the .icns file to the application's Resources directory
					echo "$icns_file"
					echo "/Applications/${folder_name}.app/Contents/Resources/"
					cp -f "$icns_file" "/Applications/${folder_name}.app/Contents/Resources/"
					echo "Replaced icon for ${folder_name}.app"
				fi
			done
		else
			echo "Application ${folder_name}.app not found in /Applications."
		fi
	fi
done

killall Dock
