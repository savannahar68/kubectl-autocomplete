#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.zsh"
TARGET_FILE="${TARGET_DIR}/kubectl-shortcuts.zsh"
COMPLETIONS_DIR="${TARGET_DIR}/completions"
COMPLETIONS_FILE="${COMPLETIONS_DIR}/_k8s_aliases"
ZSHRC="${HOME}/.zshrc"
SOURCE_LINE='source ~/.zsh/kubectl-shortcuts.zsh'

mkdir -p "${TARGET_DIR}"
mkdir -p "${COMPLETIONS_DIR}"
cp "${REPO_DIR}/kubectl-shortcuts.zsh" "${TARGET_FILE}"
cp "${REPO_DIR}/completions/_k8s_aliases" "${COMPLETIONS_FILE}"

if [[ -f "${ZSHRC}" ]]; then
  if ! grep -Fxq "${SOURCE_LINE}" "${ZSHRC}"; then
    printf '\n%s\n' "${SOURCE_LINE}" >> "${ZSHRC}"
  fi
else
  printf '%s\n' "${SOURCE_LINE}" > "${ZSHRC}"
fi

echo "Installed to ${TARGET_FILE}"
echo "Installed completion to ${COMPLETIONS_FILE}"
echo "Restart your shell or run: source ~/.zshrc"
