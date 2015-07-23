#!/bin/sh

set -e

VERBOSE=1
INCLUDE_HIDDEN=0

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

if [ $# -ne 2 ] ; then
	echo "usage: $(basename '$0') source target" >&2
	exit 1
fi

copy_and_verify "$1" "$2"
