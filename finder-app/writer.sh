#!/bin/bash

# Check if both parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two parameters are required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile="$1"
writestr="$2"

# Extract directory from writefile
writedir=$(dirname "$writefile")

# Create the directory if it doesn't exist
mkdir -p "$writedir"

if [ ! -d "$writedir" ]; then
    echo "Error: Failed to create directory $writedir"
    exit 1
fi

# Create the file with the specified content
echo "$writestr" > "$writefile"

# Check if file creation was successful
if [ "$?" -ne 0 ]; then
    echo "Error: Could not create the file '$writefile'."
    exit 1
fi

# Print success message
echo "File '$writefile' created successfully with content: '$writestr'"

# Exit with return value 0 (success)
exit 0

