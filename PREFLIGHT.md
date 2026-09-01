# Preflight

## Suggested minimum

- Windows 10 or 11, 64-bit
- 8 GB RAM; 16 GB recommended
- 10 GB free disk space for tools, logs, and small models
- Working microphone and speaker
- A modern four-core CPU; a supported GPU is optional

## Required upstream components

Install only from official upstream sources and verify published checksums when available:

- Ollama: `https://ollama.com/`
- whisper.cpp: `https://github.com/ggml-org/whisper.cpp`
- Piper: `https://github.com/OHF-Voice/piper1-gpl`

Models are not included. Review every model card and license before downloading. Choose a model that leaves memory headroom; larger is not automatically better for interactive voice latency.

## Safety preflight

- Bind model and speech services to `127.0.0.1`, not all interfaces.
- Do not place secrets or personal memory inside prompts or distributable configuration.
- Keep external tools disabled until each tool has an approval policy and test coverage.
- Never give a voice model direct purchasing, messaging, shell, or hardware authority.
