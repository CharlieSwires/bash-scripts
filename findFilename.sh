#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <dir> <filename>"
  exit 1
fi

start_dir=$1
filename=$2

find "$start_dir" -type f -iname "$filename.*" 2>/dev/null

