#!/bin/bash 

echo "Welcome to Flip Coin Simulation"

declare -A result

#flipping coin to display head or tail
#flipping coin multiple times and store the singlet,doublet & triplet combination in a dictonary

#computing total count of heads and tails and storing in dictionary
function compute() {
 for (( index=0; index<$1; index++ ))
  do
  totalCount=""
   for (( indexOne=0; indexOne<$2; indexOne++ ))
   do
    calTailsOrHeads=$(( RANDOM%2 ))
    if [[ $calTailsOrHeads -eq 1 ]]
    then
       totalCount+=H
    else
       totalCount+=T
    fi
  done
  result[$totalCount]=$(( ${result[$totalCount]}+1 ))
done
echo "Count of all combination: ${result[@]}"
echo "keys                      ${!result[@]}"
}

#computing percentage
function percentageFlipCoin() {
 for keys in ${!result[@]}
 do
   result[$keys]=`echo "scale=2;$((${result[$keys]}))/$coins*100" | bc -l`
 done
}

#user input
echo -n "How many times you want to flip a coin?"
read coins
echo -n "Press 1 for singlet combination or Press 2 for doublet combination or Press 3 for triplet combination"
read choice

case $choice in
  1)
  compute $coins $choice
  percentageFlipCoin
  echo "Percentage of singlet combination: ${result[@]}"
  ;;
  2)
  compute $coins $choice
  percentageFlipCoin
  echo "Percentage of doublet combination: ${result[@]}"
  ;;
  3)
  compute $coins $choice
  percentageFlipCoin
  echo "Percentage of triplet combination: ${result[@]}"
  ;;
  *)
  echo "wrong input"
  ;;
esac

#sorting singlet,doublet and triplet values
for k in "${!result[@]}" 
do
  echo -n "Sorted: " ${result[@]}
done |
sort -rn -k3
