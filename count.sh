#!/bin/bash

# Function to count the lines of source code in a file
count_lines() {
    local file="$1"
    local extension="${file##*.}"
    if [[ "$extension" =~ ^(c|h|cpp|hpp|java|py|rb|sh|pl|cs|xml|jsp|html|json|properties|css|js|sql|md|txt)$ ]]; then
        # Count the non-blank lines of the file
        local lines=$(grep -vcE "^\s*$" "$file")
        echo "$lines"
    else
        echo "0"
    fi
}

# Function to recursively count the lines of source code in a directory
count_lines_recursive() {
    local dir="$1"
    local count=0
    for file in "$dir"/*; do
        if [[ -d "$file" ]]; then
            count=$(($count + $(count_lines_recursive "$file")))
        else
            count=$(($count + $(count_lines "$file")))
        fi
    done
    echo "$count"
}

# Main program
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

dir="$1"
if [[ ! -d "$dir" ]]; then
    echo "$dir is not a directory"
    exit 1
fi

count=$(count_lines_recursive "$dir")
echo "Total lines of source code: $count"
