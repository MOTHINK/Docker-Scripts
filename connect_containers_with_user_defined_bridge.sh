#!/bin/bash

# First, check if the user defined bridge network exists in the Operating system.

networks=( `sudo docker network ls | awk 'NR>1{print $2}'` )
flag=false

for i in "${networks[@]}"
do
	if [ "${i}" == "$1" ]
	then
		flag=true
	fi
done

# Second, check if the IDs of the containers are passed as arguments [or at least one argument].

if [ $flag == true ]
then
	if [ ${#} -gt 1 ]
	then
		for((i=2;i<=$#;i++));do
			setUserDefinedBridge=`sudo docker network connect ${1} ${!i}`
		done
	else
		echo "ERROR: You didn't pass any container ID as argument"
	fi
else
	echo "ERROR: The user defined bridge network ${1} doesn't exist"
fi
