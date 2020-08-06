$var = 5

switch ($var) {
    5 {
        "var is five"
      }
    default {
        "I don't test if var is '$_'"
        }
}

""
$var = 1..7

switch ($var) {
    5 {
        "var is five"
      }
    default {
        "I don't test if var is '$_'"
        }
}

""
$othervar = 6

switch ($var) {
    3 {
        "var is three"
        continue
      }
    $othervar {
        "var is the same as othervar"
        break
        }
    default {
        "I don't test if var is '$_'"
        }
}

""
$limit = 4

switch ( $var ) {
    3 {
        "var is three"
        continue
    }
    { ( $_ -gt $limit ) } {
        "at limit, shutting down"
        break
    }
    { ( $_ -is [int] ) -and ( (Get-Date).DayOfWeek -eq $_ ) } {
        "$_ is today's day of the week."
    }
    default {
        "I don't test if var is '$_'"
    }
}