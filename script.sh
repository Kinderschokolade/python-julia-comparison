#!/bin/bash

# Check if folder path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <folder_path>"
  exit 1
fi

FOLDER_PATH="$1"

# Iterate over each file in the specified folder
for FILE in "$FOLDER_PATH"/*; do
  if [ -f "$FILE" ]; then
    # Get the current modification time of the file in a human-readable format
    CURRENT_DATE=$(stat -c %y "$FILE")
    
    # Calculate the new date by subtracting 2 years and 4 months
    NEW_DATE=$(date -d "$CURRENT_DATE +10 months" +"%Y-%m-%d %H:%M:%S")
    
    # Update the file's modification and access timestamps
    touch -d "$NEW_DATE" "$FILE"
    
    echo "Updated timestamp for: $FILE"
  fi
done

echo "All timestamps updated successfully."

