#!/bin/bash

find "$HOME/homework/hw_2" -type f -name "*.tsv" -print0 | while IFS= read -r -d $'\0' TSV_FILE; do
	# Let's left only file name
	FILENAME=$(basename "$TSV_FILE")
	FOLDERNAME="${FILENAME%.tsv}" # Delete suffix
	FOLDER_PATH="$HOME/homework/hw_2/$FOLDERNAME" # Making folder with correct name

	# Let's create folder
	mkdir -p "$FOLDER_PATH"
	echo "Created folder"

	# Let's move our files
	mv "$TSV_FILE" "$FOLDER_PATH"
	echo "Moved our files"
done
