#!/bin/sh

VERBOSE=1

set -e

verify_files()
{
	if [ $# -ne 2 ] ; then
		echo "Usage: verify_files source target" >&2
		return 1
	fi
	
	checksum_src=$(md5 -q "$1")
	checksum_dst=$(md5 -q "$2")
	
	if [ $VERBOSE = 1 ]; then
		echo "$checksum_src $1"
		echo "$checksum_dst $2"
	fi
	
	#return $([ $checksum_src = $checksum_dst ])
	
	if [ $checksum_src = $checksum_dst ]; then
		if [ $VERBOSE = 1 ]; then
			echo "Files match"
		fi
		return 0
	else
		echo "Files do not match $1 $2" >&2
		return 1
	fi
}

copy_and_verify()
{
	if [ $# -ne 2 ] ; then
		echo "Usage: copy_and_verify source target" >&2
		return 1
	fi
	if [ $VERBOSE = 1 ]; then
		echo "copy $1 to $2"
	fi
	
	cp -pnv "$1" "$2"
	if [ $? = 0 ] ; then
		verify_files "$1" "$2"
	fi
	
	return $?
}

recursive_copy_and_verify()
{
	if [ $# -ne 3 ] ; then
		echo "Usage: recursive_copy_and_verify source target include_hidden" >&2
		return 1
	fi
	
	src_path_start="$1"
	dst_path_start="$2"
	
	result=1
	
	if [ $VERBOSE = 1 ]; then
		echo "copy $src_path_start to $dst_path_start"
	fi
	
	cd "$src_path_start"
	
	find_path="*"
	if [ $include_hidden = 1 ] ; then
		find_path="."
	fi

	for src_file in "$(find -s $find_path -type f | sed -e 's;^./;;')" ; do
		dst_path="$dst_path_start$(dirname '$src_file')"
	
		mkdir -p "$dst_path"
	
		dst_file="$dst_path/$(basename '$src_file')"

		if ! copy_and_verify "$src_file" "$dst_file"; then
			$result=0
		fi
	done
	
	return $result
}

#verify_files "$1" "$2"

copy_and_verify "$1" "$2"

