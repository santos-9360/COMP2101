$totalcapacity = 0

get-wmiobject -class win32_physicalmemory |
    foreach {
	    new-object -TypeName psobject -Property @{
		    Manufacturer = $_.manufacturer
		    "Speed(MHz)" = $_.speed
		    "Size(GB)" = $_.capacity/1gb
		    Bank = $_.banklabel
		    Slot = $_.devicelocator
	    }
	    $totalcapacity += $_.capacity/1gb
    } |
    Format-Table -AutoSize Manufacturer,
                           "Size(GB)",
                           "Speed(MHz)",
                           Bank,
                           Slot

"Total RAM: ${totalcapacity}GB"