#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <dir> <ext>"
  exit 1
fi

start_dir=$1
ext=$2

find "$start_dir" -type f -iname "*.$ext" 2>/dev/null

