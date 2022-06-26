# If you come from bash you might have to change your $PATH.
colorscript
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export I3BLOCKS="$HOME/.config/i3blocks/"

# ZSH_THEME="my-theme"
ZSH_THEME="agnoster-custom"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Custom zsh path
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
plugins=(git fzf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go 
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH 

source ~/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#DISABLE_FZF_AUTO_COMPLETION="true"

#  --------------------
# | USER CONFIGURATION |
#  --------------------
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
