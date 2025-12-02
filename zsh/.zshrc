export XDG_CONFIG_HOME="$HOME/.config"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

alias ls="eza --icons=always"

eval "$(zoxide init zsh)"

alias cd="z"

#starship
export STARSHIP_CONFIG="$HOME/dotfiles/.config/starship/starship.toml"
eval "$(starship init zsh)"

export PATH=$PATH:/Users/kagaseo/.spicetify
