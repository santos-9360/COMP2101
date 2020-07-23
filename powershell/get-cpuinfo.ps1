#function get-cpuinfo {
#get-ciminstance cim_processor | format-list Name,MaxClockSpeed
#}

#function get-cpuinfo {
#get-ciminstance cim_processor | select-object @{label="Manufacturer, Model, and Cores"; Expression={$_.Name}}, @{label="Max Clock Speed"; Expression={$_.MaxClockSpeed}}
#}

# Name already contains manufacture, model, and core count.
# For some reason it always had 13 blank spaces after it, MaxClockSpeed didn't.
# Used -replace ".{13}$" to get rid of the last 13 characters of the string.
$model = (get-ciminstance cim_processor).Name -replace ".{13}$"
$speed = (get-ciminstance cim_processor).MaxClockSpeed
write-output ""
write-output "Your CPU is an $model.
Its max speed is $speed."
