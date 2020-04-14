#!/bin/bash -x
echo "Gambling Simulator"
stake=100
bet=1
STAKE=100
BET=1
TOTAL_DAYS=20
declare -A array1
declare -A array2

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
total_win_amount=$(($total_win_amount+$win_Amount))
total_loose_amount=$(($total_loose_amount+$loose_Amount))

if [ $total_win_amount -gt $total_loose_amount ]
then
	 result1=$(($total_win_amount-$total_loose_amount))
	 ((win_day++))
else
	result1=$(($total_loose_amount-$total_win_amount))
	((loss_day++))
fi
array1[$day]=$win_Amount
array2[$day]=$loose_Amount
((day++))
done
#calculated luckiest day
echo " ${array1[@]}"
max_value=${array1[1]}
for (( i=1;i<=20;i++ ))
do
	if [[ ${array1[$i]} -gt $max_value ]]
	then
			max_value=${array1[$i]}
			luckiest_day=$i
	fi
done
echo "Win Amount $win_Amount"
echo "Loose Amount $loose_Amount"

#calculated unluckiest day
echo "${array2[@]}"
min_value=${array2[1]}
for (( j=1;j<=20;j++ ))
do
	if [[ ${array2[$j]} -lt $min_value ]]
	then
		min_value=${array1[$j]}
		unluckiest_day=$j
	fi
done

#check playing next month or not
if [[ $total_win_amount -gt $total_loose_amount ]]
then
	echo "player continue playing next month:"
else
	echo "player not countinue playing next month"
fi
