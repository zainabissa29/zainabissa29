<#
.SYNOPSIS
    This PowerShell script sets the RequireSecuritySignature registry value to 1 under the LanManServer Parameters key,
    ensuring SMB server security signatures are required as specified by Windows 10 STIG.

.NOTES
    Author          : Zainab Issa
    LinkedIn        : linkedin.com/in/zainabissa-cybersecurity/
    GitHub          : github.com/zainabissa29
    Date Created    : 2025-09-20
    Last Modified   : 2025-09-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000120

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

#>

```powershell
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters"
$valueName = "RequireSecuritySignature"
$valueData = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the RequireSecuritySignature value (REG_DWORD)
New-ItemProperty -Path $regPath -Name $valueName -PropertyType DWord -Value $valueData -Force

Write-Output "Registry value '$valueName' set to $valueData under $regPath"
