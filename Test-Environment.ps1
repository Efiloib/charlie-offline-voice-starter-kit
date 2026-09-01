$ErrorActionPreference = 'Stop'
$checks = @(
  [pscustomobject]@{ Component='PowerShell'; Found=$true; Detail=$PSVersionTable.PSVersion.ToString() },
  [pscustomobject]@{ Component='Ollama'; Found=[bool](Get-Command ollama -ErrorAction SilentlyContinue); Detail='Required for local chat inference' },
  [pscustomobject]@{ Component='whisper.cpp'; Found=[bool](Get-Command whisper-cli -ErrorAction SilentlyContinue); Detail='May instead be configured by absolute path' },
  [pscustomobject]@{ Component='Piper'; Found=[bool](Get-Command piper -ErrorAction SilentlyContinue); Detail='May instead be configured by absolute path' }
)
$checks | Format-Table -AutoSize
if ($checks.Where({-not $_.Found}).Count) { Write-Warning 'One or more components were not found on PATH. Follow PREFLIGHT.md and use absolute paths in config.local.json.' }
Write-Output 'Environment inspection complete. No files or system settings were changed.'
