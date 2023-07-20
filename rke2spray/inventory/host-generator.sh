#!/bin/bash

workers (){
	echo [worker] >> inventory/hosts
	
	for index in $(seq 0 $((${#WORKER[@]}-1)))
	do
		echo "${WORKER[$index]}" >> inventory/hosts
	done

	echo -e "\n[worker:vars]\nansible_user=root\n" >> inventory/hosts
}
	
master (){
	echo -e "[master]\n${MASTER[0]}\n\n[master:vars]\nansible_user=root\n" > inventory/hosts
}

ha_master (){
	
	echo -e "[master]\n${MASTER[0]}" > inventory/hosts
	for index in $(seq 1 $((${#MASTER[@]}-1)))
	do
		echo "${MASTER[$index]}" >> inventory/hosts
	done

	echo -e "\n[master:vars]\nansible_user=root\n" >> inventory/hosts
}

echo "For High Availibility must use odd number of masters and at least 3"
echo "Enter Your Master IP List & in the end for registration press ctrl+D:"
while read line
do
    MASTER=("${MASTER[@]}" $line)
done

echo "Enter Your Worker IP List & in the end for registration press ctrl+D:"
while read line
do
    WORKER=("${WORKER[@]}" $line)
done

if [ ${#MASTER[@]} -eq 1 ]
then
	master
	workers
elif [ ${#MASTER[@]} -ge 3 ]
then
	ha_master
	workers
elif [ $((${#MASTER[@]} %2)) -eq 0 ]
then
	echo You must use odd number of masters
	exit 0
fi
