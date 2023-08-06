# zmodload zsh/zprof
# "trick" to speed up compinit
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

# case insensitive completition
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# p10k instant prompt (has to be on top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# plugin manager
source $HOME/.local/share/zplug/init.zsh
# -- plugins list --- 
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "plugins/fzf", from:oh-my-zsh
# --- end --- 
zplug load

# support for zoxide cd
eval "$(zoxide init zsh)"

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

# ---- alias ----
# better replace for ls
FILE=/usr/bin/exa
if [[ -f "$FILE" ]]; then
    alias ls="exa"
    alias la="exa --all"
    alias ll="exa --long --all"
else
    alias la="ls -A"
    alias ll="ls -lA"
fi

# zoxide for autojumps
FILE=/usr/bin/zoxide
if [[ -f "$FILE" ]]; then
    alias cd="z"
fi

# usefull apps alias
alias cl="clear"
alias ml="neomutt"
alias tm="tmux"
alias v="nvim"
alias git_log='git log --graph --decorate --pretty=format:"\"%Cgreen%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\""'

# internet searches on cli
alias \?="lsearch"
alias \?\?="bard_api"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# zprof
