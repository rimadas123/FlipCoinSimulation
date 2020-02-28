#!/bin/bash

echo "Welcome to Flip Coin Simulation"

#flipping coin to display head or tail

calTailsOrHeads=$(( RANDOM%2 ))
if [[ $calTailsOrHeads -eq 1 ]]
then
   echo "It's head"
else
   echo "It's tail"
fi

