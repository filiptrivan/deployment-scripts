param(
    [string]$projectPath,
    [string]$projectOutputPath
)

if (-not $projectPath) {
    Write-Output "Error: The -projectPath parameter must be provided."
    exit 1
}

if (-not $projectOutputPath) {
    Write-Output "Error: The -projectOutputPath parameter must be provided."
    exit 1
}

if (-not (Test-Path $projectPath) -or (-not $projectPath.EndsWith(".csproj") -and -not $projectPath.EndsWith(".sln"))) {
    Write-Output "Error: The provided project path '$projectPath' is not a valid .csproj or .sln file."
    exit 1
}

# Build
dotnet build $projectPath --configuration Release
if ($LASTEXITCODE -ne 0) {
    Write-Output "Error: Build failed."
    exit 1
}

# Publish
dotnet publish $projectPath --configuration Release --output "$projectOutputPath\data"
if ($LASTEXITCODE -ne 0) {
    Write-Output "Error: Publish failed."
    exit 1
}

Compress-Archive -Path "$projectOutputPath\data\*" -DestinationPath "$projectOutputPath\publish.zip" -Force
if ($LASTEXITCODE -ne 0) {
    Write-Output "Error: Zip creation failed."
    exit 1
}

Write-Output "Publishing completed. Please manually copy the files from '$projectOutputPath' to the server (e.g., C:\inetpub\wwwroot\YourApp)."
