#!/bin/bash

log_folder="$HOME""/Library/Logs/kitchen-sync/$(date +%F)"

checksum_logs[0]="$log_folder/md5-src.log"
echo "${checksum_logs[@]:(-1)}"
