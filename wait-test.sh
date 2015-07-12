#!/bin/bash

echo "Starting copy 1"
sleep $(($RANDOM % 10 + 10))
echo "Finished copy 1"

{
	echo "Starting verify 1"
	sleep $(($RANDOM % 10 + 10))
	echo "Finished verify 1"
} &

for (( i = 2 ; i < 6 ; i++ )); do
	{
		echo "Starting copy "$i
		sleep $(($RANDOM % 10 + 10))
		echo "Finished copy "$i
		
		echo "Starting verify "$i
		sleep $(($RANDOM % 10 + 10))
		echo "Finished verify "$i
	} &
done

wait

echo "Compare checksum files"