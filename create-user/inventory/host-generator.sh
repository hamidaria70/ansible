#!/bin/bash

set -e

server (){
	echo [servers] >> inventory/hosts
	
	for index in $(seq 0 $((${#SERVER[@]}-1)))
	do
		echo "${SERVER[$index]}" >> inventory/hosts
	done
}

echo "Enter Your Servers IP List & in the end for registration press ctrl+D:"
while read line
do
    SERVER=("${SERVER[@]}" $line)
done

server
