# zmodload zsh/zprof
# colorscritp
FILE=$HOME/.local/bin/colorscript2
if [[ -f "$FILE" ]]; then
    colorscript2
fi

# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# "trick" to speed up compinit
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

eval "$(zoxide init zsh)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode disabled # update automatically without asking
DISABLE_AUTO_UPDATE="true"

# Plugins
plugins=(git fzf)
source $ZSH/oh-my-zsh.sh

# TODO: agregar el script de recuperacion
source ~/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# -- Go config -- 
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go 
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH 

#  --------------------
# | USER CONFIGURATION |
#  --------------------

# sugestions plugin
ZSH_AUTOSUGGEST_MANUAL_REBIND="true"
ZSH_AUTOSUGGEST_STRATEGY="history"

# autocompletition plugin
ENABLE_CORRECTION="false"

# alias 
FILE=/usr/bin/exa
if [[ -f "$FILE" ]]; then
    alias ls="exa"
    alias la="exa --all"
    alias ll="exa --long --all"
else
    alias la="ls -A"
    alias ll="ls -lA"
fi
FILE=/usr/bin/zoxide
if [[ -f "$FILE" ]]; then
    alias cd="z"
fi
alias cl="clear"
alias ml="neomutt"
alias tm="tmux"
alias v="nvim"
alias \?="lsearch"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# zprof
