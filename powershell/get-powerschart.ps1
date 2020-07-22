# Example script from slides remains largely unchanged. Not sure if instructions
# are unclear or if it is intended.
# Changing the table size from 4 to 10 by altering (1..#)
foreach ($c in (1..10)) {   new-object -typename psobject -property @{
       PlaceCount=$c;
       MaxValueInBinary=[math]::pow(2,$c);
       MaxValueInOctal=[math]::pow(8,$c);
       MaxValueInHex=[math]::pow(16,$c)
   }
 }