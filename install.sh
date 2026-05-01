#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.zsh"
TARGET_FILE="${TARGET_DIR}/kubectl-shortcuts.zsh"
ZSHRC="${HOME}/.zshrc"
SOURCE_LINE='source ~/.zsh/kubectl-shortcuts.zsh'

mkdir -p "${TARGET_DIR}"
cp "${REPO_DIR}/kubectl-shortcuts.zsh" "${TARGET_FILE}"

if [[ -f "${ZSHRC}" ]]; then
  if ! grep -Fxq "${SOURCE_LINE}" "${ZSHRC}"; then
    printf '\n%s\n' "${SOURCE_LINE}" >> "${ZSHRC}"
  fi
else
  printf '%s\n' "${SOURCE_LINE}" > "${ZSHRC}"
fi

echo "Installed to ${TARGET_FILE}"
echo "Restart your shell or run: source ~/.zshrc"
