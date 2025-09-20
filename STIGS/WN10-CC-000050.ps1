<#
.SYNOPSIS
    This PowerShell script sets the required HardenedPaths registry values under the NetworkProvider key,
    ensuring both NETLOGON and SYSVOL shares require mutual authentication and integrity for Windows 10 STIG compliance.

.NOTES
    Author          : Zainab Issa
    LinkedIn        : linkedin.com/in/zainabissa-cybersecurity/
    GitHub          : github.com/zainabissa29
    Date Created    : 2025-09-19
    Last Modified   : 2025-09-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000050

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

#>

```powershell
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths"
$netlogonName = "\\*\NETLOGON"
$sysvolName   = "\\*\SYSVOL"
$regValue     = "RequireMutualAuthentication=1, RequireIntegrity=1"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the NETLOGON and SYSVOL values (REG_SZ)
New-ItemProperty -Path $regPath -Name $netlogonName -PropertyType String -Value $regValue -Force
New-ItemProperty -Path $regPath -Name $sysvolName   -PropertyType String -Value $regValue -Force

Write-Output "Registry values for '$netlogonName' and '$sysvolName' set to '$regValue' under $regPath"
