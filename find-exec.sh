#!/bin/bash

set -e

#find -s * -type f -exec sh -c "echo file: {}; echo 'Do something else'" \;

find -s * -type f -exec sh -c "filename='Stuff: ' ; echo '$filename {}'" \;