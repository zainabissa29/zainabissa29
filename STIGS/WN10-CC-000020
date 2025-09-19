<#
.SYNOPSIS
    This PowerShell script sets the DisableIpSourceRouting registry value to 2 under the TCP/IPv6 Parameters key,
    disabling IP source routing to enhance network security in compliance with security best practices.

.NOTES
    Author          : Zainab Issa
    LinkedIn        : linkedin.com/in/zainabissa-cybersecurity/
    GitHub          : github.com/zainabissa29
    Date Created    : 2025-09-18
    Last Modified   : 2025-09-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

#>

```powershell
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
$valueName = "DisableIpSourceRouting"
$valueData = 2

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DisableIpSourceRouting value (REG_DWORD)
New-ItemProperty -Path $regPath -Name $valueName -PropertyType DWord -Value $valueData -Force

Write-Output "Registry value '$valueName' set to $valueData under $regPath"
