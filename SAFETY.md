# Safety policy

The starter configuration is conversation-only. It must not autonomously:

- purchase, transfer, trade, invest, subscribe, or open financial accounts;
- send messages, publish content, accept agreements, or create external accounts;
- execute shell commands or modify files based solely on model output;
- control motors, locks, appliances, or other physical actuators.

Adding a tool requires an exact schema, argument allowlist, deterministic validation, human approval for consequential actions, audit logging, timeout handling, and a tested rollback path.

Never store passwords, tokens, recovery codes, or private keys in prompts, transcripts, example configuration, logs, or source control.
