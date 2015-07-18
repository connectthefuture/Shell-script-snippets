#!/bin/bash

base_dir="/Users/tom/Documents/Temp/"
dir_name="offload-"
index=1

#while [ -d "$base_dir$dir_name$( printf '%03d' $index )" ] ; do
#	index=$(( index + 1))
#done

path=""
while [ true ]; do
	path="$base_dir$dir_name$( printf '%03d' $index )"
	
	if [ ! -d "$path" ] ; then
		break
	fi
	
	index=$(( index + 1))
done

#mkdir -p "$base_dir$dir_name$( printf '%03d' $index )"
echo "$path"