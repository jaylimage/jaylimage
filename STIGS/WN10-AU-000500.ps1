 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jaylen Limage
    LinkedIn        : linkedin.com/in/jaylen-limage/
    GitHub          : github.com/jaylimage
    Date Created    : 2025-21-02
    Last Modified   : 2025-21-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE
# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Define the registry value name and data
$regName = "MaxSize"
$regData = 0x8000  # 32768 in decimal

# Check if the registry path exists, create it if not
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $regName -Value $regData -Type DWord

# Confirm the change
Write-Output "Registry key updated: $regPath\$regName = $regData"
 
