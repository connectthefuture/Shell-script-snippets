#!/bin/bash

some_function()
{
	while [ $# -gt 0 ] ; do
		echo "$1"
		shift
	done
}

some_function "a" "b" "c" "d"
