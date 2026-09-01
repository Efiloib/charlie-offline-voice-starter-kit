param([switch]$Force)
$ErrorActionPreference = 'Stop'
$source = Join-Path $PSScriptRoot 'config.example.json'
$target = Join-Path $PSScriptRoot 'config.local.json'
if (-not (Test-Path -LiteralPath $source)) { throw 'config.example.json is missing.' }
if ((Test-Path -LiteralPath $target) -and -not $Force) { throw 'config.local.json already exists. Use -Force only if you intend to replace it.' }
Copy-Item -LiteralPath $source -Destination $target -Force
Write-Output 'Created config.local.json. Replace every placeholder before starting the assistant.'
Write-Output 'This helper downloads nothing, changes no system settings, and enables no tools.'
