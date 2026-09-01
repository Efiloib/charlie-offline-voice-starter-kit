# Offline Voice Assistant Starter Kit

Local-first reference project for a Windows voice assistant using free components:

- Ollama for local language-model inference
- whisper.cpp for local speech recognition
- Piper for local text-to-speech
- PowerShell for orchestration and supervision

This publication candidate contains no model weights, installers, credentials, personal memories, private conversations, machine-specific paths, or telemetry.

## Status

Early public release. It provides reproducible validation and setup scaffolding, but deliberately does not bundle third-party executables or models.

## Quick start

1. Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\Test-Environment.ps1`.
2. Read `PREFLIGHT.md` and install missing upstream tools from their official projects.
3. Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\Initialize-Assistant.ps1`.
4. Edit the generated `config.local.json` and replace every placeholder.
5. Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\Verify-Release.ps1 -RuntimeCheck`.
6. Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\Start-Assistant.ps1`.

See `DEMO.md` for a non-destructive demonstration and `TESTING.md` for the clean-copy test procedure.

The included launcher is intentionally conservative: push-to-talk by default, loopback-only services, no purchasing or messaging tools, and no automatic external actions.

## What this kit does not promise

It is not a hosted service, a copy of any cloud model, an autonomous financial agent, or a safety-certified control system. Local model quality and speed depend heavily on hardware and selected model sizes.

## License

Project-authored files are offered under the MIT License in `LICENSE`. Ollama, whisper.cpp, Piper, and individual models retain their own licenses; users must review those licenses independently.
