#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
#
# Sample output:
#   Hostname        : hostname
#   LAN Address     : 192.168.2.2
#   LAN Hostname    : host-name-from-hosts-file
#   External IP     : 1.2.3.4
#   External Name   : some.name.from.our.isp

# Task 1: Clean up this script by moving the commands that generate the output to separate lines
#         that put each command's output into variables. Once you have that done, Use those variables
#         in the output section at the end of the script. If the commands included in this script
#         don't make sense to you, feel free to create your own commands to find your ip addresses,
#         host names, etc.

# Task 2: Add variables for the default router's name and IP address.
#         Add a name for the router's IP address to your /etc/hosts file.
#         The router's name and address must be obtained by dynamically
#         finding the router IP address from the route table, and looking
#         up the router's hostname using its IP address, not by just
#         printing out literal text.
# sample of desired output:
#   Router Address  : 192.168.2.1
#   Router Hostname : router-name-from-hosts-file

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# awk is used to extract only the data we want displayed from the commands which produce extra data
# this command is ugly done this way, so generating the output data into variables is recommended to make the script more readable.
# e.g.
#   interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')

###############################################################################

### VARIABLES ###

# TASK ONE - Output changed to variables

# uses hostname command to find hostname and assigns to variable
hostname=$(hostname)
# uses ip a command to list network information, uses awk to find the interface name.
# replaces colon in interface name with nothing and assigns to variable.
interfaceName=$(ip a | awk '/: e/{gsub(/:/,"");print $2}')
# uses ip command, interfaceName and awk to find the ip address.
# replaces netmask with nothing and assigns to variable.
lanIP=$(ip a s $interfaceName | awk '/inet /{gsub(/\/.*/,"");print $2}')
# uses ip address and awk to find the right lan hostname and assigns to variable
lanHost=$(getent hosts $lanIP | awk '{print $2}')
# uses curl command to find externap ip address and assigns to variable
externalIP=$(curl -s icanhazip.com)
# uses external ip address and awk to find the external name and assigns to variable
externalName=$(getent hosts $externalIP | awk '{print $2}')

# TASK TWO - added router ip & name variables

# uses command ip r (route) to list information, awk to find router ip addresses.
# replaces netmask with nothing and assigns to variable.
routerIP=$(ip r | awk '/def/{gsub(/\/.*/,"");print $3}')
#uses routerIP and awk to find the router name
routerName=$(getent hosts $routerIP | awk '{print $2}')

### OUTPUT ###

# cat command, calling variables to show output
cat <<EOF
Hostname        : $hostname
LAN Address     : $lanIP
LAN Hostname    : $lanHost
External IP     : $externalIP
External Name   : $externalName
Router IP       : $routerIP
Router Name     : $routerName
EOF
