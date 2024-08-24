param(
    [string]$appPoolName,
    [string]$deployPath,
    [string]$backupPath
)

function Test-Admin {
    $currentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $currentPrincipal = [Security.Principal.WindowsPrincipal]$currentIdentity
    return $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-Admin)) {
    Write-Output "This script requires administrative privileges. Please run PowerShell as Administrator."
    # exit 1
}

if (-not (Get-Module -ListAvailable -Name WebAdministration)) {
    Write-Output "Error: The WebAdministration module is not available. Please ensure IIS management tools are installed."
    # exit 1
}

Import-Module WebAdministration

if (-not $appPoolName) {
    Write-Output "Error: The -appPoolName parameter must be provided."
    exit 1
}

if (-not $deployPath) {
    Write-Output "Error: The -deployPath parameter must be provided."
    exit 1
}

if (-not $backupPath) {
    Write-Output "Error: The -backupPath parameter must be provided."
    exit 1
}

# Stop the IIS
Stop-WebAppPool -Name $appPoolName
Write-Output "Stopped application pool: $appPoolName"

if (Test-Path $backupPath) {
    Remove-Item -Recurse -Force $backupPath
}
Copy-Item -Path $deployPath -Destination $backupPath -Recurse
Write-Output "Backed up current application to: $backupPath"

Copy-Item -Path "$deployPath\*" -Destination $deployPath -Recurse -Force
Write-Output "Copied new application files to: $deployPath"

# Start the IIS
Start-WebAppPool -Name $appPoolName
Write-Output "Started application pool: $appPoolName"

Restart-WebAppPool -Name $appPoolName
Write-Output "Restarted application"

Write-Output "Deployment completed successfully."
