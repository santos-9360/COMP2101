""
#####HW#####
"### HW ###"
# Lists HW information and trims output.
$HW=get-wmiobject -class win32_computersystem |
    Format-List Manufacturer, Model, Name
($HW | Out-String).trim()
""

#####OS#####
"### OS ###"
# Lists the OS and version of the computer, trims the output.
$OS=get-wmiobject -class win32_operatingsystem | 
    Format-List @{N='Operating System'; E={$_.Caption}},
                @{N='Version'; E={$_.Version}}
($OS | Out-String).trim()
""

#####CPU#####
"### CPU ###"
# Lists processor information, filling in empty properties with 'N/A' for the caches, then trims the output.
$CPU=get-wmiobject -class win32_processor | 
    Format-List @{N='Vendor and Model'; E={$_.Name}},
                @{N='Clock Speed'; E={$_.MaxClockSpeed}},
                @{N='Number Of Cores'; E={$_.NumberOfCores}},
                @{N='L1 Cache Size'; E={if ($_.L1CacheSize) {$_.L1CacheSize} else {"N/A"}}},
                @{N='L2 Cache Size'; E={if ($_.L2CacheSize) {$_.L2CacheSize} else {"N/A"}}},
                @{N='L3 Cache Size'; E={if ($_.L3CacheSize) {$_.L3CacheSize} else {"N/A"}}}
($CPU | Out-String).Trim()
""

#####GPU#####
"### GPU ###"
# Lists make, model, and resolution settings for the GPU, trims the output.
$GPU=get-wmiobject -class win32_videocontroller | 
    Format-List @{N='Vendor'; E={$_.AdapterCompatibility}},
                @{N='Model'; E={$_.VideoProcessor}},
                @{N='Resolution'; E={$_.VideoModeDescription}}
($GPU | Out-String).trim()
""

#####RAM#####
"### RAM ###"
# Your example used, trims the output.
$totalcapacity = 0
$RAM=get-wmiobject -class win32_physicalmemory |
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
($RAM | Out-String).Trim()
"Total RAM: ${totalcapacity}GB"
""

#####STORAGE#####
"### STORAGE ###"
# Get related information from other classes to use in created object,
#formats on table and trims the output.
$logical = get-wmiobject -class win32_logicaldisk

$myDrives = foreach ($disk in $logical) {
    $partition = $disk.GetRelated('win32_diskpartition')
    $physical = $partition.GetRelated('win32_diskdrive')

        New-Object PSObject -Property @{
            "Vendor and Model" = $physical.Model
            "Size(GB)" = $disk.size/1gb -as [int]
            "Free(GB)" = $disk.freespace/1gb -as [int]
            "% Available" = 100*$disk.freespace/$disk.size -as [int]
            }
        }
($myDrives |  Format-Table -AutoSize "Vendor and Model",
                                     "Size(GB)",
                                     "Free(GB)",
                                     "% Available" | 
Out-String).Trim()