#!/bin/bash -x

echo "Welcome to Flip Coin Simulation"

declare -A result

#flipping coin to display head or tail
#flipping coin multiple times and store the singlet,doublet & triplet combination in a dictonary

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

function percentageFlipCoin() {
 for j in ${!result[@]}
 do
   result[$j]=`echo "scale=2;$((${result[$j]}))/$coins*100" | bc -l`
 done
}

echo -n "How many times you want to flip a coin?"
read coins
echo -n "Press 1 for singlet combination or Press 2 for doublet combination Press 3 for triplet combination"
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
  *)
  echo "wrong input"
  ;;
esac

