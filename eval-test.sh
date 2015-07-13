#!/bin/bash

INCLUDE_HIDDEN=0

source="$1"
copy1="$2"

log_folder="$HOME""/Library/Logs/kitchen-sync"
log_file="$log_folder""/log.txt"

mkdir -p "$log_folder"

#include_hidden_opt="--exclude=\".*\""
include_hidden_opt="-not -name \".*\""

if [ "$INCLUDE_HIDDEN" == 1 ] ; then
	include_hidden_opt=""
fi

#echo "'$include_hidden_opt'"
#eval rSync -rtnv " $include_hidden_opt " "$source" "$copy1"

cd "$source"

echo "checksums on ""$source"
#eval find -s * -type f " $include_hidden_opt " "-exec md5 -r \"{}\" \;"
eval "find -s * -type f ""$include_hidden_opt" " -exec md5 -r \"{}\" \; >> ""$log_file"
