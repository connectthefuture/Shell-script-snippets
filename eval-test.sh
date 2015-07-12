#!/bin/bash

INCLUDE_HIDDEN=1

source1="$1"
copy1="$2"

include_hidden_opt="--exclude=\".*\""

if [ "$INCLUDE_HIDDEN" == 1 ] ; then
	include_hidden_opt=""
fi

#echo "'$include_hidden_opt'"
eval rSync -rtnv " $include_hidden_opt " "$source1" "$copy1"
