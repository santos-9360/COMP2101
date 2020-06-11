#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same
# it also demonstrates using conditional execution

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data (i.e. TestString)
# TASK 2: Improve it by rewriting it to use the if command
#         The if command should test if they got it right, in which case it should tell them they got it right
#         The if command should tell them they got it wrong
# TASK 3: Improve it by giving them 5 tries to get it right before failing
#           *** Do not use the exit command, and do not use a loop (e.g. while or for)

################################################################################

# TASK ONE - user input for password guess

# read command to capture input from user and assign to a variable
read -p "Enter a password: " myString
referenceString="password"
# assigning integer 5 to a variable to use as a fail counter
failCount=5

# TASK TWO AND THREE - rewritten with if command. if chain for 5 incorrect guesses.

# if user entered string matches password variable, output "Correct!" message
if [[ $myString == "$referenceString" ]]; then
  echo "Correct!"
# else statement
else
  # decrease fail counter
  let failCount-=1
  # output "Incorrect." message to user along with remaining attempts.
  echo "Incorrect. $failCount tries remaining."
  # capture input from user again and compares in another if command
  # REPEAT CHAIN UNTIL FINAL FAILURE
  read -p "Enter a password: " myString
  if [[ $myString == "$referenceString" ]]; then
    echo "Correct!"
  else
    let failCount-=1
    echo "Incorrect. $failCount tries remaining."
    read -p "Enter a password: " myString
    if [[ $myString == "$referenceString" ]]; then
      echo "Correct!"
    else
      let failCount-=1
      echo "Incorrect. $failCount tries remaining."
      read -p "Enter a password: " myString
      if [[ $myString == "$referenceString" ]]; then
        echo "Correct!"
      else
        let failCount-=1
        echo "Incorrect. $failCount try remaining."
        read -p "Enter a password: " myString
        if [[ $myString == "$referenceString" ]]; then
          echo "Correct!"
        else
          let failCount-=1
          # final "Incorrect." message. no more read commands.
          echo "Incorrect. $failCount tries remaining. Goodbye."
        fi
      fi
    fi
  fi
fi
# [ $myString = $referenceString ] && echo "Correct!" || echo "Incorrect."
