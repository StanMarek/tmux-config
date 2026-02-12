#!/usr/bin/env bash
# Clear all stale catppuccin/theme options so the plugin can set fresh values on re-source.
tmux show-options -g 2>/dev/null | awk '/^@(catppuccin|thm|batt)_/{print $1}' | while read -r opt; do
  tmux set -gu "$opt" 2>/dev/null
done
