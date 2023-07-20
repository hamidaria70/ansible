#!/bin/bash

worker (){
	echo [worker] >> inventory/new-hosts
	
	for index in $(seq 0 $((${#WORKER[@]}-1)))
	do
		echo "${WORKER[$index]}" >> inventory/new-hosts
	done

	echo -e "\n[worker:vars]\nansible_user=root\n" >> inventory/new-hosts
}

echo "Enter one of your master nodes ip here:"

read IP

echo -e "[master]\n$IP\n\n[master:vars]\nansible_user=root\n" > inventory/new-hosts

echo "Enter Your New Worker IP List & in the end for registration press ctrl+D:"
while read line
do
    WORKER=("${WORKER[@]}" $line)
done

worker
