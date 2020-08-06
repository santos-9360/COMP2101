[int]$startingNumber = Read-Host -Prompt "Enter a number for a countdown: "

$myCount = $startingNumber

while ( $myCount -gt 0 ) {
    "$myCount"
    $myCount--
    sleep 1
    }
    "Done."