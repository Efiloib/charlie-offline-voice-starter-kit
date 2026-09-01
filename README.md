# Offline Voice Assistant Starter Kit

Local-first reference project for a Windows voice assistant using free components:

- Ollama for local language-model inference
- whisper.cpp for local speech recognition
- Piper for local text-to-speech
- PowerShell for orchestration and supervision

This publication candidate contains no model weights, installers, credentials, personal memories, private conversations, machine-specific paths, or telemetry.

## Status

Publication candidate only. Review `RELEASE-CHECKLIST.md` and run `Verify-Release.ps1` before distributing it.

## Quick start

1. Read `PREFLIGHT.md` and install the required upstream tools from their official projects.
2. Copy `config.example.json` to `config.local.json`.
3. Replace every placeholder path and select locally installed models.
4. Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\Verify-Release.ps1 -RuntimeCheck`.
5. Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\Start-Assistant.ps1`.

The included launcher is intentionally conservative: push-to-talk by default, loopback-only services, no purchasing or messaging tools, and no automatic external actions.

## What this kit does not promise

It is not a hosted service, a copy of any cloud model, an autonomous financial agent, or a safety-certified control system. Local model quality and speed depend heavily on hardware and selected model sizes.

## License

Project-authored files are offered under the MIT License in `LICENSE`. Ollama, whisper.cpp, Piper, and individual models retain their own licenses; users must review those licenses independently.
