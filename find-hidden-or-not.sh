#!/bin/bash

include_hidden=0

cd "/Users/tom/Library/Mobile Documents/com~apple~CloudDocs/iCloud Pictures/Recipes"

thing="*"
if [ $include_hidden = 1 ] ; then
	thing="."
fi

for file in "$(find -s $thing -type f | sed -e 's;^./;;')" ; do
	echo "$file"
done
