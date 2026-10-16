eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# ---- Eza (better ls) -----
alias ls="eza --color=always --no-filesize --icons=always --no-user --no-permissions"
alias gco="git switch"
