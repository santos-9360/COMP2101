#Your example slides have a completed script already so I'll break it down.
#Get-WmiObject line looks for hard drives installed on the computer and pipes output.
gwmi -class win32_logicaldisk | 
#Where-Object line keeps any drives where the capacity size is above 0 and pipes output.
where size -gt 0 | 
#Creates a table with the labels DeviceID, Size(GB), Free(GB),% Free, and ProviderName.
#Takes values from .size and .freespace and divides them by 1gb (roughtly 1e+9) and then
# casts them as an integer to make them whole numbers. % Free divides free space by size
# and multiplies by 100 to get a percentage, also casted as an integer.
format-table -autosize DeviceID,
    @{n="Size(GB)"; e={$_.size/1gb -as [int]}},
    @{n="Free(GB)"; e={$_.freespace/1gb -as [int]}},
    @{n="% Free"; e={100*$_.freespace/$_.size -as [int]}},
    ProviderName