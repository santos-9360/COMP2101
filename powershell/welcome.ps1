# Basic welcome message. Used to create a function and added to profile
# to automatically run on PowerShell startup.
# Realizing now that this is an exact copy of your welcome message, sorry.
write-output "Welcome to planet $env:computername, Overlord $env:username."
$now = get-date -format 'HH:MM tt on dddd'
write-output "It is $now."
