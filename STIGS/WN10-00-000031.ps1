<#
.SYNOPSIS
    This PowerShell script sets BitLocker policy registry values under the FVE key, configuring UseAdvancedStartup, UseTPMPIN, and UseTPMKeyPIN
    as required for Windows 10 STIG compliance (WN10-00-000031), supporting both standard and network unlock scenarios.

.NOTES
    Author          : Zainab Issa
    LinkedIn        : linkedin.com/in/zainabissa-cybersecurity/
    GitHub          : github.com/zainabissa29
    Date Created    : 2025-09-21
    Last Modified   : 2025-09-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

#>

```powershell
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Standard BitLocker configuration
New-ItemProperty -Path $regPath -Name "UseAdvancedStartup" -PropertyType DWord -Value 1 -Force
New-ItemProperty -Path $regPath -Name "UseTPMPIN" -PropertyType DWord -Value 1 -Force
New-ItemProperty -Path $regPath -Name "UseTPMKeyPIN" -PropertyType DWord -Value 1 -Force

Write-Output "BitLocker standard policy values set: UseAdvancedStartup=1, UseTPMPIN=1, UseTPMKeyPIN=1"

# To configure for BitLocker Network Unlock, uncomment the following lines:
<# 
New-ItemProperty -Path $regPath -Name "UseTPMPIN" -PropertyType DWord -Value 2 -Force
New-ItemProperty -Path $regPath -Name "UseTPMKeyPIN" -PropertyType DWord -Value 2 -Force
Write-Output "BitLocker Network Unlock values set: UseTPMPIN=2, UseTPMKeyPIN=2"
#>
