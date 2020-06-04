#!/bin/bash
#
# this script rolls a six-sided die
#

# Task: Improve this script by making it roll as many dice as there are letters in your first name, instead of just one

################################################################################

# roll the dice and display the result
echo "Rolling...
$(( RANDOM % 6 + 1)) rolled."

# roll five (Shawn) dice and display the results
echo "
Rolling as many dice as letters in my name...
$(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1)) rolled."
