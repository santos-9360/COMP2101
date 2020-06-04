#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

################################################################################

# displays a prompt message and captures user input to three variables
read -p "Enter three numbers seperated by spaces: " userNum1 userNum2 userNum3

# assigns the sum and product of the entered numbers as variables
sum=$(($userNum1 + $userNum2 + $userNum3))
product=$(($userNum1 * $userNum2 * $userNum3))

# calls on variables and outputs the sum and product for the user to see
cat <<EOF
The sum of the entered numbers is $sum.
The product of the entered numbers is $product.
EOF
