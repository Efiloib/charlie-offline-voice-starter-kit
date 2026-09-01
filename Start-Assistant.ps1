param([string]$Config = (Join-Path $PSScriptRoot 'config.local.json'))
$ErrorActionPreference = 'Stop'
if (-not (Test-Path -LiteralPath $Config)) { throw "Copy config.example.json to config.local.json and configure it first." }
$cfg = Get-Content -Raw -LiteralPath $Config | ConvertFrom-Json
if ($cfg.tools_enabled) { throw 'This starter launcher requires tools_enabled=false.' }
foreach ($item in @($cfg.whisper_executable,$cfg.whisper_model,$cfg.piper_executable,$cfg.piper_model)) {
  if (-not (Test-Path -LiteralPath $item)) { throw "Missing configured local file: $item" }
}
if ($cfg.ollama_url -notmatch '^http://127\.0\.0\.1(:\d+)?$') { throw 'ollama_url must be loopback-only.' }
Write-Host 'Configuration validated. The reference kit intentionally leaves audio-device capture integration platform-specific.'
Write-Host 'Use the component commands in ARCHITECTURE.md to connect capture, transcription, chat, and speech.'
