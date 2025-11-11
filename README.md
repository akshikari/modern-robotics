# Modern Robotics — Offline Study (Python)

Offline-first repo for working through _Modern Robotics_ without Internet because I've got some long flights ahead of me.
Generated setup and tools/\* scripts via ChatGPT based on prompt of "Give me a repo to go through Modern Robotics on some long flights."

- Caches PDFs and Python wheels
- Provides minimal math scaffolding
- Includes tests and notebooks per chapter

## Quickstart

### Online

```bash
make setup
make cache

```

### Offline

```bash
make offline
make verify
uv run jupyter notebook
```
