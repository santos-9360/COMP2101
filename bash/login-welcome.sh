#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
# TASK ONE AND TWO - removed myname variable (added $USER at output) and generate hostname dynamically

# uses hostname command to generate hostname and assign to a variable
hostname=$(hostname)

# TASK THREE - added date and time, added to bottom output as well

# uses date command with format arguments to find specific day, hour, second and am/pm and assign to variables
day=$(date +%A)
time=$(date "+%I:%M %p")

###############
# Titles      #
###############

# TASK FOUR - assigns title based on day

# uses if statements to see which day it currently is, assigns a title to a variable based on the day
if [[ $day == "Monday" ]]; then
  title="Powerful"
elif [[ $day == "Tuesday" ]]; then
  title="Amazing"
elif [[ $day == "Wednesday" ]]; then
  title="Knowledgable"
elif [[ $day == "Thursday" ]]; then
  title="Genius"
elif [[ $day == "Friday" ]]; then
  title="Hungry"
elif [[ $day == "Saturday" ]]; then
  title="Shocking"
elif [[ $day == "Sunday" ]]; then
  title="Sleepy"
fi

###############
# Output      #
###############
# assigns old output to a variable
output="Welcome to planet $hostname, $title $USER!
Today is $day at $time."
# use cowsay command to display variable (added to ~/.bash_login and tested with ssh)
cowsay $output
