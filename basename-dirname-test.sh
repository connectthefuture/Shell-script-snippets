#!/bin/bash

set -e

source="/Users/tom/Source Pictures/Screen Shot 2015-05-21 at 15.11.30.png"
copies[0]="/Users/tom/Pictures/Screen Shot 2015-05-21 at 15.11.30.png"
copies[1]="/Users/tom/Documents/Temp Folder"
copies[2]="/Users/tom/Documents/Temp Folder/"

src_filename="$(basename "$source")"
src_directory="$(dirname "$source")"

echo "source directory = '$src_directory'"
echo "source filename = '$src_filename'"
	
for (( i = 0 ; i < ${#copies[@]} ; i++ )); do
	if [ $i -gt 0 ]; then
		echo
	fi
	
	dst_directory=""
	
	if [ -d "${copies[$i]}" ]; then
		dst_directory="${copies[$i]}"
	else
		dst_directory="$(dirname "${copies[$i]}")"
	fi
	
	echo "'$(basename "${copies[$i]}")'"
	echo "'$(dirname "${copies[$i]}")'"
done