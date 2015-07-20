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

AUTO_FOLDER_USE_DATE=1

prefix="Offload "

copies[0]="/VOLUMES/RAID_01/RAW/Day_01_"
copies[1]="/VOLUMES/RAID_02/RAW/Day_01_"
copies[2]="/VOLUMES/RAID_03/RAW/Day_01_"

suffix="$(get_auto_directory_suffix "$copies[0]" $AUTO_FOLDER_USE_DATE "$prefix")"

echo "$suffix"
for (( i = 0 ; i < ${#copies[@]} ; i++ )); do
	copies[i]="${copies[i]}$suffix/"
	echo "${copies[i]}"
done
