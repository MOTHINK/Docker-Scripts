#!/bin/bash

output=$(getent group | grep docker)
if [ ${#output} -lt 1];
then
	`groupadd docker`
	`usermod -aG docker $USER`
fi
