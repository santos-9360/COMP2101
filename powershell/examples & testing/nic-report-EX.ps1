$adapters = Get-WmiObject Win32_NetworkAdapter
$filteredadapters = $adapters | where-object {$_.adaptertype -match "ethernet" -and $_.netenabled -eq $true}
$myNetworkObjects = $filteredadapters |
						Foreach { $adapter = $_;
						$nac = $adapter.GetRelated("Win32_NetworkAdapterConfiguration");
						New-Object PSObject -Property @{Name=$adapter.name;
								ConnectionName=$adapter.netconnectionid;
								IPAddress=$nac.ipaddress;
								Gateway=$nac.defaultipgateway;
								"Speed(MBps)" = $adapter.speed / 1000000
								}
						}
$myNetworkObjects | format-table Name, ConnectionName, IPAddress, Gateway, "Speed(Mbps)"