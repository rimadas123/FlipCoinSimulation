#!/bin/bash -x

echo "Welcome to Flip Coin Simulation"

echo -n "How many times you to want flip a coin?"
read count

declare -A result

#flipping coin to display head or tail
#flipping coin multiple times and store the singlet combination in a dictonary

headCount=0
tailCount=0

for (( index=0; index<$count; index++ ))
do
   calTailsOrHeads=$(( RANDOM%2 ))
   if [[ $calTailsOrHeads -eq 1 ]]
   then
      headCount=$(( headCount+1 ))
   else
      tailCount=$(( tailCount+1 ))
   fi
done

#Storing the result in dictionary
result[H]=$headCount
result[T]=$tailCount

#Computing Percentage of heads
percentageOfHeads=`echo "scale=2;$headCount/$count*100" | bc -l`
#Computing Percentage of tails
percentageOfTails=`echo "scale=2;$tailCount/$count *100" | bc -l`

echo "Percentage of heads $percentageOfHeads"
echo "Percentage of tails $percentageOfTails"
