$ethernetAdapters = Get-WmiObject Win32_NetworkAdapter |
    Where-Object adaptertype -match "ethernet"

$configuredAdapters = foreach ($adapter in $ethernetAdapters) {
    $nac = $adapter.GetRelated('Win32_NetworkAdapterConfiguration')

    New-Object PSObject -Property @{
        Index = $adapter.Index
        DHCPEnabled = $nac.DHCPEnabled
        DHCPServer = $nac.DHCPServer
        DHCPLeased = $nac.DHCPLeaseObtained
        DHCPExpired = $nac.DHCPLeaseExpired
        #IP = $nac.IPAddress|? {$_.indexof('.') -gt 0}
        NetconnectionID = $adapter.NetconnectionID
        Name = $adapter.name
        MAC = $adapter.macaddress
        "Speed(MB)" = $adapter.speed/1000000 -as [int]
        GW = $nac.defaultipgateway
        #Netmask = $nac.ipsubnet|? {$_.indexof('.') -gt 0}
        Domain = $nac.dnsdomain
        Hostname = $nac.dnshostname
        "DNS Servers" = $nac.dnsserversearchorder
    }
}

$configuredAdapters |
    Format-List Name,
                MAC,
                "Speed(MB)",
                IP,
                Netmask,
                GW,
                Domain,
                Hostname,
                "DNS Servers"