#Filters out any entry with the vendor name 'Microsoft Corporation' and pipes output
gwmi -class win32_product -filter "vendor!='Microsoft Corporation'" | 
#Sorts remaining data by Install Date and pipes output
sort InstallDate | 
#Creates a table using Name, Vendor, Verson and Install Date columns
Format-Table -autosize Name,Vendor,Version,InstallDate  