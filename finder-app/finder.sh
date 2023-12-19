#!/bin/bash

# Check if both parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two parameters are required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory."
    exit 1
fi

# Find matching lines and count
num_files=$(find "$filesdir" -type f | wc -l)
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the result
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

# Exit with return value 0 (success)
exit 0

