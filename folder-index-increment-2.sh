#!/bin/bash

set -e

get_auto_directory_suffix()
{
	if [ $# -ne 2 ] ; then
		echo "Usage: $0 base_dir format" >&2
		return 1
	fi
	
	base_dir="$1"
	prefix="$2"
	
	suffix=""
	index=1
	while [ true ]; do
		suffix="$prefix$(printf '%03d' $index)"
		
		if [ ! -d "$base_dir$suffix" ] ; then
			break
		fi
	
		index=$(( index + 1))
	done
	
	echo "$suffix"
}

suffix="$(get_auto_directory_suffix "$1" "$2")"
echo "$1$suffix"