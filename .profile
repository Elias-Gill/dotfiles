export XGD_CONFIG_HOME="$HOME/.config/"
export PATH="$HOME/.local/bin:$PATH"
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# browser
export BROWSER="/usr/bin/firefox","/usr/bin/lynx"

# lynx config
export LYNX_CFG=$HOME/.config/lynx/lynx.cfg
export LYNX_LSS=$HOME/.config/lynx/lynx.lss

# 'less' colors display
export LESS_TERMCAP_mb=$'\e[1;31m'  # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'  # begin blink
export LESS_TERMCAP_so=$'\e[1;91m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m' # begin underline
export LESS_TERMCAP_me=$'\e[0m'     # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'     # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'     # reset underline
export GROFF_NO_SGR=1
export LESS="-Rsi"

# rust cargo
if [[ -d "$HOME/.cargo/env" ]]; then
    source "$HOME/.cargo/env"
fi

# env variables 
if [[ -d "$HOME/.config/secrets" ]]; then
    source "$HOME/.config/secrets"
fi

# go path
export PATH=$PATH:/usr/local/go/bin

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export VISUAL='nvim'

# bat for pager and preview
FILE=/usr/bin/bat
if [[ -f "$FILE" ]]; then
    export FZF_DEFAULT_OPTS='--preview "bat --color=always --style=numbers {}"'
    export MANPAGER='sh -c "col -b | bat -l man -p"'
fi

# config for FZF
FILE=/usr/bin/rg
if [[ -f "$FILE" ]]; then
    export FZF_DEFAULT_COMMAND="rg --files -g '!.git' -g '!go/' -g '!*.class' -g '!VirtualBox*' -g '!Escritorio*' -g '!node_modules*'"
fi

FILE=/usr/bin/fd
if [[ -f "$FILE" ]]; then
    export FZF_CTRL_T_COMMAND='fd --type d --maxdepth 5 -E go -E node_modules -E Escritorio'
fi

