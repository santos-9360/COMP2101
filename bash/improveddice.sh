#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

################################################################################

# assigning a range variable
numRange=6

# assigning a bias variable
numBias=1

# Tell the user we have started processing
echo "Rolling..."

# roll the dice and save the results
die1=$(( RANDOM % $numRange + $numBias))
die2=$(( RANDOM % $numRange + $numBias))

# display the results
echo "Rolled $die1, $die2."

# display the sum of the rolls
dieSum=$(($die1+$die2))
echo "The sum is $dieSum."

# display the average of the rolls
dieAve=$(($dieSum/2))
echo "The average is $dieAve."
