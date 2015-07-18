#!/bin/bash

AUTO_FOLDER_USE_DATE=1

base_dir="/Users/tom/Documents/Temp/"
prefix="Offload-"
index=1

#while [ -d "$base_dir$prefix$(printf '%03d' $index)" ] ; do
#	index=$(( index + 1))
#done

path=""

while [ true ]; do
	path="$base_dir"
	
	if [ $AUTO_FOLDER_USE_DATE = 1 ] ; then
		path="$path$(date +%F)/"
	fi

	path="$path$prefix$(printf '%03d' $index)"
	
	if [ ! -d "$path" ] ; then
		break
	fi
	
	index=$(( index + 1))
done

echo "Create $path"
mkdir -p "$path"
