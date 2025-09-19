<#
.SYNOPSIS
    This PowerShell script sets the EnableICMPRedirect registry value to 0 under the TCP/IP Parameters key,
    disabling ICMP redirect processing to enhance network security as required by Windows 10 STIG.

.NOTES
    Author          : Zainab Issa
    LinkedIn        : linkedin.com/in/zainabissa-cybersecurity/
    GitHub          : github.com/zainabissa29
    Date Created    : 2025-09-19
    Last Modified   : 2025-09-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

#>

```powershell
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$valueName = "EnableICMPRedirect"
$valueData = 0

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the EnableICMPRedirect value (REG_DWORD)
New-ItemProperty -Path $regPath -Name $valueName -PropertyType DWord -Value $valueData -Force

Write-Output "Registry value '$valueName' set to $valueData under $regPath"
