# kubectl-zsh-shortcuts

Zsh shortcuts for day-to-day Kubernetes work, with kubectl-native autocomplete wired to every alias.

## What it includes

- Fast aliases for `get`, `describe`, `logs`, `exec`, `scale`, `delete`, `apply`, and namespace/context commands
- Autocomplete for all aliases through `_kubectl`
- Completion caching and menu selection for quicker interactive use

## Requirements

- `zsh`
- `kubectl` available in `PATH`

## Install

```bash
git clone <your-repo-url> kubectl-zsh-shortcuts
cd kubectl-zsh-shortcuts
chmod +x install.sh
./install.sh
```

Then restart your shell or run:

```bash
source ~/.zshrc
```

## Manual install

```bash
mkdir -p ~/.zsh
cp kubectl-shortcuts.zsh ~/.zsh/kubectl-shortcuts.zsh
echo 'source ~/.zsh/kubectl-shortcuts.zsh' >> ~/.zshrc
source ~/.zshrc
```

## Uninstall

```bash
rm -f ~/.zsh/kubectl-shortcuts.zsh
```

Remove this line from `~/.zshrc`:

```bash
source ~/.zsh/kubectl-shortcuts.zsh
```

## Notes

- `watch` aliases (`kwp`, `kwd`, `kwss`) require the `watch` command.
- `kubectl top` aliases require Metrics Server in your cluster.
