Do {
    $annoyed = Read-Host -Prompt "Are you annoyed yet? [y/N] "
    } while ($annoyed -notlike "ye*" )
    "Sorry!"