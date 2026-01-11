# ---- Launch Tmux ----
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux new-session -A -s home
fi
