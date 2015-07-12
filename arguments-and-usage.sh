#!/bin/bash

PROGNAME="$(basename "$0")"

usage()
{
	if [ "$*" != "" ] ; then
		echo "Error: $*"
	fi

    cat << EOF
Usage: $PROGNAME [OPTION ...] [source] [target] [target ...]

Recursively copy files from source to one or more destinations,
performing checksums to verify target matches source.

Options
 -h, --help          display this usage message and exit
 --no-checksums      don't verify files with checksums
 --checksums-only    just compare directories with checksums
 --include-hidden    include hidden files (those starting with a '.')
EOF

	exit 1
}

VERIFY_FILES=1
CHECKSUMS_ONLY=0
INCLUDE_HIDDEN=0

args=()
while [ $# -gt 0 ] ; do
	case "$1" in
    -h|--help)
        usage
        ;;
    --no-checksums)
        VERIFY_FILES=0
        ;;
    --include-hidden)
        INCLUDE_HIDDEN=1
        shift
        ;;
    --checksums-only)
        CHECKSUMS_ONLY=1
        shift
        ;;
    -*)
        usage "Unknown option '$1'"
        ;;
    *)
        args=("${args[@]}" "$1")
        ;;
    esac
    shift
done

if [ ${#args[@]} -lt 2 ] ; then
	usage
fi

cat << EOF
VERIFY_FILES=$VERIFY_FILES
CHECKSUMS_ONLY=$CHECKSUMS_ONLY
INCLUDE_HIDDEN=$INCLUDE_HIDDEN
EOF
 
for arg in "${args[@]}" ; do
    echo "'$arg'"
done
