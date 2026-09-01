# Demonstration

The safe setup path can be demonstrated without recording audio or downloading anything:

```text
PS> .\Test-Environment.ps1
Environment inspection complete. No files or system settings were changed.

PS> .\Initialize-Assistant.ps1
Created config.local.json. Replace every placeholder before starting the assistant.

PS> .\Test-CleanCopy.ps1
PASS: release audit (...)
PASS: isolated clean-copy validation in ...
```

Runtime flow:

```text
microphone -> local transcription -> local model -> local neural voice -> speakers
```

The launcher refuses non-loopback Ollama endpoints, missing component paths, or configurations that enable tools.
