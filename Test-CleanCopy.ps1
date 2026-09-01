$ErrorActionPreference = 'Stop'
$tempRoot = Join-Path ([IO.Path]::GetTempPath()) ('offline-voice-kit-' + [guid]::NewGuid().ToString('N'))
try {
  New-Item -ItemType Directory -Path $tempRoot | Out-Null
  Get-ChildItem -LiteralPath $PSScriptRoot -Force | Where-Object { $_.Name -ne '.git' -and $_.Name -ne 'config.local.json' } | Copy-Item -Destination $tempRoot -Recurse
  & powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $tempRoot 'Verify-Release.ps1')
  if ($LASTEXITCODE -ne 0) { throw "Release audit failed with exit code $LASTEXITCODE." }
  & powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $tempRoot 'Initialize-Assistant.ps1')
  if ($LASTEXITCODE -ne 0) { throw "Initialization test failed with exit code $LASTEXITCODE." }
  $cfg = Get-Content -Raw -LiteralPath (Join-Path $tempRoot 'config.local.json') | ConvertFrom-Json
  if ($cfg.tools_enabled) { throw 'Clean-copy configuration unexpectedly enables tools.' }
  Write-Output "PASS: isolated clean-copy validation in $tempRoot"
}
finally { if (Test-Path -LiteralPath $tempRoot) { Remove-Item -LiteralPath $tempRoot -Recurse -Force } }
