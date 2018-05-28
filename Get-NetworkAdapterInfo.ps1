<#
.SYNOPSIS
Get-NetworkAdapterInfo retrieves information about network adapters configuration from one or more computers.
.DESCRIPTION
Get-NetworkAdapterInfo uses WMI to retrieve the Win32_NetworkAdapterConfiguration instances from one or more computers.
.PARAMETER computerName
The computer(s) to query.
.PARAMETER dhcpEnabled
Display only adapters with DHCP enabled.
.PARAMETER ipEnabled
Display only adapters with the IP Protocol enabled.
.EXAMPLE
Get-NetworkAdapterInfo -computerName it5 -dhcpEnabled -ipEnabled
Display information about the network adapters of the it5 computer, which have DHCP and the IP Protocol enabled. 
#>

[CmdletBinding()]
param (
    [string] $computerName = 'localhost',
    [switch] $dhcpEnabled,
    [switch] $ipEnabled
)

if ($PSBoundParameters.keys -contains "dhcpEnabled" -and $PSBoundParameters.keys -contains "ipEnabled") {
    write-host "WORKS"
    Get-WmiObject -ComputerName $computerName -Class Win32_NetworkAdapterConfiguration -Filter "dhcpEnabled=$true and ipEnabled=$true"    
} elseif ($PSBoundParameters.keys -contains "ipEnabled") {
    Get-WmiObject -ComputerName $computerName -Class Win32_NetworkAdapterConfiguration -Filter "ipEnabled=$true"    
} elseif ($PSBoundParameters.keys -contains "dhcpEnabled") {
    Get-WmiObject -ComputerName $computerName -Class Win32_NetworkAdapterConfiguration -Filter "dhcpEnabled=$true"    
}  else {
    Get-WmiObject -ComputerName $computerName -Class Win32_NetworkAdapterConfiguration
}
