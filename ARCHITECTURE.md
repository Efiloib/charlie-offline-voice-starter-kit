# Architecture

```text
microphone -> bounded recording -> whisper.cpp -> transcript confirmation
           -> Ollama chat model -> reply text -> Piper -> speakers
```

## Trust boundaries

1. Audio remains local unless the operator explicitly exports it.
2. Ollama is reached through loopback only.
3. Model output is untrusted text, never a command by itself.
4. Consequential tools require deterministic validation and human approval outside the model.
5. Plain-text source documents remain authoritative; semantic indexes are rebuildable caches.

## Reliability pattern

- Run the conversation process beneath a supervisor.
- Log component exit codes separately from harmless diagnostic output.
- Restart recoverable failures with bounded backoff.
- Keep an explicit stop control outside speech recognition.
- Benchmark speech, model generation, and synthesis independently.

## Hallucination controls

- Use low temperature for factual requests.
- Retrieve from approved local sources and cite paths.
- Require “I do not know” when evidence is absent.
- Ask the user to confirm low-confidence transcripts.
- Route factual or consequential questions to a stronger model when hardware permits.
