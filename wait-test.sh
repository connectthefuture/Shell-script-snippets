#!/bin/bash

source="source"
copies[0]="copy1"
copies[1]="copy2"
copies[2]="copy3"

echo "Starting copy 1: ""$source"" -> ""${copies[0]}"
sleep $(($RANDOM % 10 + 10))
echo "Finished copy 1: ""$source"" -> ""${copies[0]}"

{
	echo "Starting checksums: ""$source"
	sleep $(($RANDOM % 10 + 10))
	echo "Finished checksums: ""$source"
} &

source="${copies[0]}"

for (( i = 1 ; i < ${#copies[@]} ; i++ )); do
	{
		echo "Starting copy "$(($i+1))": ""$source"" -> ""${copies[i]}"
		sleep $(($RANDOM % 10 + 10))
		echo "Finished copy "$(($i+1))": ""$source"" -> ""${copies[i]}"
		
		echo "Starting checksums: ""${copies[i]}"
		sleep $(($RANDOM % 10 + 10))
		echo "Finished checksums: ""${copies[i]}"
	} &
done

wait

echo "Compare checksum files"