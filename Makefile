PY=python3

.PHONY: help setup cache offline verify test lint format

help:
	@echo "make setup    - create venv, sync deps (online), format+lint"
	@echo "make cache    - cache wheels & PDFs for offline use (online)"
	@echo "make offline  - create venv and install from cached wheels only"
	@echo "make verify   - run offline verification"
	@echo "make test     - run unit tests"
	@echo "make lint     - ruff + mypy"
	@echo "make format   - black"

setup:
	uv venv
	uv sync
	uv run ruff check --fix .
	uv run black .
	uv run mypy src

cache:
	bash tools/bootstrap_offline.sh

offline:
	bash tools/offline_install.sh

verify:
	uv run python tools/verify_offline.py

test:
	uv run pytest

lint:
	uv run ruff check .
	uv run mypy src

format:
	uv run black .
