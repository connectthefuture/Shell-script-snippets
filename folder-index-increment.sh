#!/bin/bash

get_auto_directory_suffix()
{
	if [ $# -ne 3 ] ; then
		echo "Usage: $0 base-dir use-date prefix" >&2
		return 1
	fi
	
	base_dir="$1"
	use_date="$2"
	prefix="$3"
	
	suffix=""
	index=1
	while [ true ]; do
	
		if [ $use_date = 1 ] ; then
			suffix="$suffix$(date +'%Y-%m-%d')/"
		fi
		
		suffix="$suffix$prefix$(printf '%03d' $index)"

		if [ ! -d "$base_dir$suffix" ] ; then
			break
		fi
	
		index=$(( index + 1))
	done
	
	echo "$suffix"
}

AUTO_FOLDER_USE_DATE=0

base_dir="/Users/tom/Documents/Temp/"
prefix="Offload-"

#mkdir -p "$path"
#path="$(AutoDirectory '$base_dir' $AUTO_FOLDER_USE_DATE '$prefix')"
suffix="$(get_auto_directory_suffix "$base_dir" $AUTO_FOLDER_USE_DATE "$prefix")"

echo "$suffix"
echo "$base_dir$suffix"
