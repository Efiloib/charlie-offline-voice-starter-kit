# Testing

Run the release audit without user profiles:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\Verify-Release.ps1
```

Run the isolated clean-copy test:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\Test-CleanCopy.ps1
```

This copies distributable files into a new temporary directory, excludes Git metadata and local configuration, runs the audit, creates a fresh configuration, confirms tools remain disabled, and removes the temporary copy.

This is not a substitute for testing on a physically separate clean Windows installation. Please report clean-machine results using the repository's test-report issue form.
