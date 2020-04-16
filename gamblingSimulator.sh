#!/bin/bash -x
echo "Gambling Simulator"
stake=100
bet=1
STAKE=100
BET=1
TOTAL_DAYS=20
declare -A Win
declare -A Loose

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
			win_Amount=$(( $win_Amount+$BET ))
		else
			amount=$(( $amount-$BET ))
			loose_Amount=$(( $loose_Amount+$amount ))
			loose_Amount=$(( $loose_Amount+$BET ))
		fi
	done
	(( day++ ))

#calculated total win amount ,loss amount and day win or loss
total_Win_Amount=$(($total_Win_Amount+$win_Amount))
total_Loose_Amount=$(($total_Loose_Amount+$loose_Amount))

if [ $total_Win_Amount -gt $total_Loose_Amount ]
then
	 Winner=$(($total_Win_Amount-$total_Loose_Amount))
	 ((win_day++))
else
	Looser=$(($total_Loose_Amount-$total_Win_Amount))
	((loss_day++))
fi
Win[$day]=$win_Amount
Loose[$day]=$loose_Amount
((day++))
done
#calculated luckiest day
echo " ${Win[@]}"
max_Value=${Win[1]}
for (( i=1;i<=20;i++ ))
do
	if [[ ${Win[$i]} -gt $max_Value ]]
	then
			max_Value=${Win[$i]}
			luckiest_Day=$i
	fi
done
#echo "Win Amount $win_Amount"
#echo "Loose Amount $loose_Amount"

#calculated unluckiest day
echo "${Loose[@]}"
min_Value=${Loose[1]}
for (( j=1;j<=20;j++ ))
do
	if [[ ${Loose[$j]} -lt $min_Value ]]
	then
		min_Value=${Loose[$j]}
		unluckiest_Day=$j
	fi
done

#check playing next month or not
if [[ $total_Win_Amount -gt $total_Loose_Amount ]]
then
	echo "player continue playing next month:"
else
	echo "player not countinue playing next month"
fi
