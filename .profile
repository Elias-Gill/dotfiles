export XDG_CONFIG_HOME="$HOME/.config/"
export XGD_CONFIG_HOME="$HOME/.config/"
export PATH="$HOME/.local/bin:$PATH"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# browser
export BROWSER="/usr/bin/firefox","/usr/bin/lynx"

# lynx config
export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"
export LYNX_LSS="$HOME/.config/lynx/lynx.lss"

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

# --- personal env vars ---
if [[ -f "$HOME/.config/secrets" ]]; then
    source "$HOME/.config/secrets"
fi

# --- env and bin config for prog.languages ---
# rust cargo
if [[ -d "$HOME/.cargo" ]]; then
    export PATH="$PATH:$HOME/.cargo/bin/"
fi

# go path
if [[ -d "/usr/local/go/bin" ]]; then
    export PATH=$PATH:/usr/local/go/bin
fi

# --- Preferred editor for local and remote sessions ---
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="vim"
    export VISUAL="vim"
else
    export EDITOR="nvim"
    export VISUAL="nvim"
fi

# -- bat for manpager and preview --
if [[ -f "/usr/bin/bat" ]]; then
    export MANPAGER='sh -c "col -b | bat -l man -p"'
fi

if [[ -f "/usr/bin/fd" ]]; then
    export FZF_CTRL_T_COMMAND='fd --type d --maxdepth 5 -E go -E node_modules -E Escritorio'
fi

# preview script for fzf
if [[ -f "$HOME/.config/scripts/preview" ]]; then
    export FZF_DEFAULT_OPTS='--bind "ctrl-/:change-preview-window(down|)" --preview "$HOME/.config/scripts/preview {}"'
fi
