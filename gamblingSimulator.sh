#!/bin/bash -x
echo "Gambling Simulator"
stake=100
bet=1
STAKE=100
BET=1
TOTAL_DAYS=20

bet=$(( RANDOM%2 ))
if [[ $bet -eq 1 ]]
then
	stake=$(($stake+50))
else
	stake=$(($stake-50))
fi

amount=$STAKE
day=0
win_Amount=0
loose_Amount=0
while [[ $day -lt $TOTAL_DAYS ]]
do
	while [[ $amount -gt 50 &&  $amount -lt 150 ]]
	do
	random=$(( RANDOM%2 ))
		if [[ $random -eq 1 ]]
		then
			amount=$(( $amount+$BET ))
			win_Amount=$(( $win_Amount+$amount ))
		else
			amount=$(( $amount-$BET ))
			loose_Amount=$(( $loose_Amount+$amount ))
		fi
	done
	(( day++ ))
done
echo "Win Amount := $win_Amount"
echo "Loose Amount := $loose_Amount"
