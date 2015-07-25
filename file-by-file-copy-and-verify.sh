#!/bin/bash

set -e

if [ $# -lt 2 ] ; then
	echo "usage: $(basename '$0') [source-directory] [target-directory] [target-directory ...]" >&2
	exit 1
fi

source="$1"
shift
find -s "$source" -type f -exec /Users/tom/GitHub/Shell-script-snippets/echo-args.sh {} "$@" \;
