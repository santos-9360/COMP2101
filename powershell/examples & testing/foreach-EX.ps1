(1..10) |
    foreach {
        New-Object -TypeName psobject -Property @{
            Digits=$_
            Binary=[math]::Pow(2,$_)
            Octal=[math]::Pow(8,$_)
            Hexadecimal=[math]::Pow(16,$_)
        }
    } |
    Format-Table -AutoSize Digits, Binary, Octal, Hexadecimal