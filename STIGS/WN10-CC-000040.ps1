<#
.SYNOPSIS
    This PowerShell script sets the NodeType registry value to 2 under the Netbt Parameters key,
    configuring NetBIOS over TCP/IP to operate in Peer-Peer mode as required for Windows 10 STIG compliance.

.NOTES
    Author          : Zainab Issa
    LinkedIn        : linkedin.com/in/zainabissa-cybersecurity/
    GitHub          : github.com/zainabissa29
    Date Created    : 2025-09-19
    Last Modified   : 2025-09-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000040

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

#>

```powershell
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netbt\Parameters"
$valueName = "NodeType"
$valueData = 2

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the NodeType value (REG_DWORD)
New-ItemProperty -Path $regPath -Name $valueName -PropertyType DWord -Value $valueData -Force

Write-Output "Registry value '$valueName' set to $valueData under $regPath"
