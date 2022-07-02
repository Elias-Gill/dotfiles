colorscript
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster-custom"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# FUZZY_COMPELTION=100

# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 10
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="false"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true" # faster Git performance 

# HIST_STAMPS="mm/dd/yyyy"

# Custom zsh path
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
plugins=(git fzf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# -- Go config -- 
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go 
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH 

source ~/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#DISABLE_FZF_AUTO_COMPLETION="true"

#  --------------------
# | USER CONFIGURATION |
#  --------------------

 #Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export FZF_DEFAULT_COMMAND='rg --files --ignore-file /home/elias/.config/rg.ignore'

# alias 
alias ls="exa"
alias cl="clear"
alias la="exa -a"
alias ll="exa -l"

# vi mode
bindkey -v
export KEYTIMEOUT=20
source ~/.config/scripts/vi-display-mode.zsh

# -- NVM config -- 
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

