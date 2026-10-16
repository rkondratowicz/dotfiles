# ---- fnm (Fast Node Manager, a fast nvm alternative) -----
# Auto-switches Node versions on cd based on .nvmrc / .node-version
eval "$(fnm env --use-on-cd --shell zsh)"

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# ---- Eza (better ls) -----
alias ls="eza --color=always --no-filesize --icons=always --no-user --no-permissions"
alias gco="git switch"
