#!/bin/bash
#
# Copy a file to multiple target directories with checksum verification

set -e

if [ $# -lt 2 ] ; then
	echo "usage: $(basename '$0') [source] [target-directory] [target-directory ...]" >&2
	exit 1
fi

source="$1"
filename="$(basename "$source")"
copies=()
shift
while [ $# -gt 0 ] ; do
	copies=("${copies[@]}" "$1")
	shift
done

md5_source=""

for (( i = 0 ; i < ${#copies[@]} ; i++ )); do
	mkdir -p "${copies[$i]}"
	cp -pnv "$source" "${copies[$i]}"
	
	dest_path="${copies[$i]}/$filename"
	
	if [ $i -eq 0 ]; then
		md5_source=$(md5 -q "$source")
		source="$dest_path"
	fi
	
	md5_dest=$(md5 -q "$dest_path")
	if [ $md5_source != $md5_dest ]; then
		echo "Files do not match $1 $2" >&2
		return 1
	fi
done
