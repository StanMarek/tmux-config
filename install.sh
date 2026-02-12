#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Initializing submodules..."
git -C "$SCRIPT_DIR" submodule update --init --recursive

echo "==> Installing custom Material Darker theme into catppuccin..."
cp "$SCRIPT_DIR/themes/catppuccin_material-darker_tmux.conf" \
   "$SCRIPT_DIR/plugins/tmux/themes/catppuccin_material-darker_tmux.conf"

echo "==> Linking tmux.conf..."
TMUX_CONF="$HOME/.config/tmux/tmux.conf"
if [ "$SCRIPT_DIR/tmux.conf" != "$TMUX_CONF" ]; then
  mkdir -p "$(dirname "$TMUX_CONF")"
  ln -sf "$SCRIPT_DIR/tmux.conf" "$TMUX_CONF"
  echo "    Symlinked $TMUX_CONF -> $SCRIPT_DIR/tmux.conf"
else
  echo "    Already in place at $TMUX_CONF"
fi

echo "==> Done. Reload tmux with: tmux source-file ~/.config/tmux/tmux.conf"
