#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ensure_uv() {
  if command -v uv >/dev/null 2>&1; then
    echo "uv is already installed."
    uv --version
  else
    echo "uv not found. Installing uv..."
    if command -v curl >/dev/null 2>&1; then
      curl -fsSL https://astral.sh/uv/install.sh | sh
    elif command -v wget >/dev/null 2>&1; then
      wget -qO- https://astral.sh/uv/install.sh | sh
    else
      echo "curl or wget is required to install uv." >&2
      return 1
    fi
    if ! command -v uv >/dev/null 2>&1; then
      echo "uv installation failed or uv is not on PATH." >&2
      return 1
    fi
    echo "uv installation completed."
  fi
}

sync_uv() {
  echo "Syncing dependencies with uv..."
  uv sync --link-mode=copy
  echo "Completed syncing dependencies."
}
