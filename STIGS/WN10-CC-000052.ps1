<#
.SYNOPSIS
    This PowerShell script sets the EccCurves registry value under the SSL configuration key,
    specifying allowed elliptic curves for TLS by setting the value to "NistP384" and "NistP256".

.NOTES
    Author          : Zainab Issa
    LinkedIn        : linkedin.com/in/zainabissa-cybersecurity/
    GitHub          : github.com/zainabissa29
    Date Created    : 2025-09-18
    Last Modified   : 2025-09-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000052

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

#>

```powershell
$baseRegPath = "SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"
$valueName = "EccCurves"
$valueData = [string[]]("NistP384", "NistP256")

# Open or create the registry key using .NET
$regKey = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey($baseRegPath, $true)
if (-not $regKey) {
    $regKey = [Microsoft.Win32.Registry]::LocalMachine.CreateSubKey($baseRegPath)
}

# Set the EccCurves value as REG_MULTI_SZ
$regKey.SetValue($valueName, $valueData, [Microsoft.Win32.RegistryValueKind]::MultiString)
$regKey.Close()

Write-Output "Registry value '$valueName' set to $($valueData -join ', ') under HKLM:\$baseRegPath"
