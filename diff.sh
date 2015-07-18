#!/bin/bash

if diff $1 $2 >/dev/null ; then
	echo "Files are the same"
else
	echo "Files are different"
fi
