#!/usr/bin/env bash
set -euo pipefail

WHEEL_DIR="vendor/wheels"

echo "[1/3] Creating uv venv"
uv venv

echo "[2/3] Installing from local wheels only (no index)"
uv run python -m pip install --no-index --find-links "$WHEEL_DIR" \
  numpy scipy matplotlib jupyter ipykernel sympy \
  ruff black mypy pytest pytest-cov

echo "[3/3] Installing this project (editable, no deps)"
uv run python -m pip install -e .
echo "✅ Offline environment ready."
