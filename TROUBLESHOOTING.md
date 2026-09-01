# Troubleshooting

## Speech is inaccurate

- Confirm the intended microphone is selected.
- Reduce echo and move the microphone away from speakers and fans.
- Compare models using the same saved recording.
- Preserve a short pre-roll so initial words are not clipped.
- Confirm uncertain transcripts before acting on them.

## Replies are slow

- Benchmark transcription, language generation, and speech separately.
- Use a smaller quantized chat model for casual dialogue.
- Reduce context and maximum output length.
- Keep the model warm between turns.
- Avoid installing “optimizer” software that cannot demonstrate reproducible gains.

## The window closes

- Launch from an existing PowerShell window to see the exit message.
- Capture native-process stderr separately and inspect the actual exit code.
- Use a supervisor with bounded restart delays.
- Do not use ordinary spoken words as the only shutdown trigger.
