#!/bin/bash
## TAG all the resourcess for an ec2 instances. 
## Get all the instance ID. 
## Auth: Sanjeev Senapati
INSTANCEIDS=`aws --profile connect ec2 describe-instances --query "Reservations[].Instances[].InstanceId" --output=text`

for I in $INSTANCEIDS; 
do  
 	# NAME=`aws --profile connect ec2 describe-instances --instance-id $I  --query "Reservations[*].Instances[*].Tags[*].Value" --output=text | tr '\t' '\n' | sort | grep -v "^#" | tail -n 1`
 	NAME=`aws --profile connect ec2 describe-instances --instance-id $I  --query "Reservations[*].Instances[*].Tags[*]" --output=text | grep "\<Name\>" | awk '{print $2}'`
 	VOLUMEID=`aws --profile connect ec2 describe-instances --instance-id $I --query "Reservations[].Instances[].BlockDeviceMappings[*].Ebs[].VolumeId" --output=text`
 	ROOTVOL=`echo $VOLUMEID | awk '{print $1}'`
 	NONROOTVOL=`echo $VOLUMEID | awk '{print $2}'`
    
    if [ ! -z $NONROOTVOL ]
    	then
 		 #echo "$NAME : $I : $NONROOTVOL"
 		 aws --profile connect ec2 create-tags --resources $NONROOTVOL --tags Key=Name,Value="dev-sdf-$NAME"
 	fi

 	
 	# aws --profile connect ec2 create-tags --resources $ROOTVOL --tags Key=Name,Value="Root-$NAME"
 	# echo "$I instance root volume has been tagged" 
 	# aws ec2 create-tags --resources $VOLUMEID --tags Key=instance,Value="$NAME"
done
