export ZSH_CUSTOM="$HOME/.config/oh-my-zsh"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# ---- Autosuggestion key bindings ----
bindkey '^[l' complete-word
bindkey '^ ' autosuggest-accept

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --icons=always --long --no-user --no-permissions"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"
