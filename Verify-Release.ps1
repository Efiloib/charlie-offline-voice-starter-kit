param([switch]$RuntimeCheck)
$ErrorActionPreference = 'Stop'
$forbiddenExtensions = @('.exe','.dll','.bin','.onnx','.wav','.mp3','.zip','.7z','.key','.pem')
$badFiles = Get-ChildItem -LiteralPath $PSScriptRoot -Recurse -File | Where-Object { $forbiddenExtensions -contains $_.Extension.ToLowerInvariant() }
if ($badFiles) { throw "Forbidden release artifacts: $($badFiles.FullName -join ', ')" }
$patterns = @('BEGIN PRIVATE KEY','api[_-]?key\s*[:=]','password\s*[:=]','bearer\s+[A-Za-z0-9._-]+','C:\\Users\\(?!path\\)')
$textFiles = Get-ChildItem -LiteralPath $PSScriptRoot -Recurse -File
$scannedFiles = $textFiles | Where-Object { $_.Name -ne 'Verify-Release.ps1' }
foreach ($file in $scannedFiles) {
  $text = Get-Content -Raw -LiteralPath $file.FullName
  foreach ($pattern in $patterns) { if ($text -match $pattern) { throw "Sensitive pattern in $($file.Name): $pattern" } }
}
$cfg = Get-Content -Raw (Join-Path $PSScriptRoot 'config.example.json') | ConvertFrom-Json
if ($cfg.tools_enabled) { throw 'Example configuration must disable tools.' }
if ($cfg.ollama_url -notmatch '^http://127\.0\.0\.1(:\d+)?$') { throw 'Example Ollama endpoint is not loopback-only.' }
if ($RuntimeCheck) {
  try { Invoke-RestMethod -Uri ($cfg.ollama_url + '/api/version') -TimeoutSec 5 | Out-Null }
  catch { throw 'Runtime check failed: local Ollama is unavailable.' }
}
Write-Output "PASS: release audit ($($scannedFiles.Count) content files plus artifact policy checked)"
