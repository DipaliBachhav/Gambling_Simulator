#!/bin/bash -x
echo "Gambling Simulator"

STAKE=100
BET=1

BET=$(( RANDOM%2 ))
if [[ $BET -eq 1 ]]
then
	echo "Win"
	STAKE=$(($STAKE+50))
else
	echo "Loose"
	STAKE=$(($STAKE-50))
fi
