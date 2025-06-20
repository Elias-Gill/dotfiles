# zmodload zsh/zprof

# "trick" to speed up compinit
skip_global_compinit=1
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

# p10k instant prompt (has to be on top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#  --------------
# | USER PLUGINS |
#  --------------
# plugin manager
export ZPLUG_HOME="$HOME/.local/share/zplug_home"
if [[ -d $ZPLUG_HOME ]] then; 
    source "$ZPLUG_HOME/init.zsh" 

    # --- plugins list --- 
    zplug "romkatv/powerlevel10k", as:theme, depth:1
    zplug "zsh-users/zsh-syntax-highlighting", defer:2
    zplug "zsh-users/zsh-autosuggestions", defer:2
    zplug "plugins/fzf", from:oh-my-zsh

    # autoswitch enviroments
    zplug "MichaelAquilina/zsh-autoswitch-virtualenv"
    zplug "alexdesousa/hab"

    # --- end --- 
    zplug load
else
    echo "zplug not installed"
    echo "run git clone https://github.com/zplug/zplug \$ZPLUG_HOME"
fi

# --- Plugins configurations ---
# Suggestions plugin
ZSH_AUTOSUGGEST_MANUAL_REBIND="true"
ZSH_AUTOSUGGEST_STRATEGY=(history)

# Autocompletition plugin
ENABLE_CORRECTION="false"

# support for zoxide cd
if [[ -f "/usr/bin/zoxide" ]]; then
    alias cd="z"
    eval "$(zoxide init zsh)"
fi

#  -----------------------
# |  Alias and utilities  |
#  -----------------------

# utilities for openning files
if [[ -f "/usr/bin/fd" ]]; then
    function open-global () {
        selection=$(FZF_DEFAULT_COMMAND="fd --type=file . $HOME" fzf)
        if [[ -n "$selection" ]]; then
            xdg-open "$selection" 2> /dev/null &
            disown
        fi
    }

    function open () {
        if [[ -n "$1" ]]; then
            xdg-open "$1" 2> /dev/null &
            disown
        else
            selection=$(FZF_DEFAULT_COMMAND="fd --type=file" fzf)
            if [[ -n "$selection" ]]; then
                xdg-open "$selection" 2> /dev/null &
                disown
            fi
        fi
    }

    # Include .gitignore files
    function opena () {
        if [[ -n "$1" ]]; then
            xdg-open "$1" 2> /dev/null &
            disown
        else
            selection=$(FZF_DEFAULT_COMMAND="fd --type=file --no-ignore-vcs" fzf)
            if [[ -n "$selection" ]]; then
                xdg-open "$selection" 2> /dev/null &
                disown
            fi
        fi
    }
fi

# better replace for ls
if [[ -f "/usr/bin/eza" ]]; then
    alias ls="eza"
    alias la="eza --all"
    alias ll="eza --icons=always --long --group-directories-first"
    alias lla="eza --icons=always --long --all --group-directories-first"
else
    alias la="ls -A --color=always"
    alias ll="ls -lA --color=always"
fi

# file explorer
if [[ -f "/usr/bin/yazi" ]]; then
    alias ranger="yazi"
fi

# usefull apps alias
alias cl="clear"
alias ml="neomutt"
alias tm="tmux"
alias v="nvim"

# alias only inside tmux
if [[ ! -z $TMUX ]]; then 
    alias cdt="cd `tmux display-message -p -F '#{session_path}'`"
fi

# facultad
alias horario="cat ~/facultad/horarios/horario.md | glow"
alias finales="cat ~/facultad/horarios/ex_finales.md | glow"
alias parciales="cat ~/facultad/horarios/ex_parciales.md | glow"

# git aliases
alias g='git'
alias gA='git add -A'
alias gl='git lg'
alias gc='git commit'
alias gs='git status'
alias gpl='git pull'
alias gps='git push'

# funcion para cambiar entre git working trees
function gw() { 
    local dir=$(git worktree list | grep -v "(bare)" | awk -F " " "{print \$1}" | fzf); 
    if [ -n "$dir" ]; then 
        cd "$dir"; 
    fi; 
}

# internet searches on cli
alias \?="lsearch"

#  -----------------------------
# |   keybinds from oh-my-zsh   |
# | WARN: do not touch anything |
#  -----------------------------

# case insensitive completition and menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
bindkey -e

# better cd experience
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
alias ..='cd ..'

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init() {
        echoti smkx
    }
    function zle-line-finish() {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# [PageUp] - Up a line of history
if [[ -n "${terminfo[kpp]}" ]]; then
    bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
    bindkey -M viins "${terminfo[kpp]}" up-line-or-history
    bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi
# [PageDown] - Down a line of history
if [[ -n "${terminfo[knp]}" ]]; then
    bindkey -M emacs "${terminfo[knp]}" down-line-or-history
    bindkey -M viins "${terminfo[knp]}" down-line-or-history
    bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${terminfo[kcuu1]}" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search

    bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
    bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
    bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${terminfo[kcud1]}" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search

    bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
    bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
    bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [Shift-Tab] - move through the completion menu backwards
if [[ -n "${terminfo[kcbt]}" ]]; then
    bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
    bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
    bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Backspace] - delete backward
bindkey -M emacs '^?' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M vicmd '^?' backward-delete-char

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

# file rename magick
bindkey "^[m" copy-prev-shell-word

# backward delete style
WORDCHARS=' *?_:,+@`-.[]~=&;"!#$%^(){}<>/'
autoload -Uz select-word-style
select-word-style normal
zstyle ':zle:*' word-style unspecified

#--- BETTER GREP EXPERIENCE ---
__GREP_CACHE_FILE="$ZSH_CACHE_DIR"/grep-alias
__GREP_ALIAS_CACHES=("$__GREP_CACHE_FILE"(Nm-1))
if [[ -n "$__GREP_ALIAS_CACHES" ]]; then
    source "$__GREP_CACHE_FILE"
else
    grep-flags-available() {
    command grep "$@" "" &>/dev/null <<< ""
}
    EXC_FOLDERS="{.bzr,CVS,.git,.hg,.svn,.idea,.tox}"
    if grep-flags-available --color=auto --exclude-dir=.cvs; then
        GREP_OPTIONS="--color=auto --exclude-dir=$EXC_FOLDERS"
    elif grep-flags-available --color=auto --exclude=.cvs; then
        GREP_OPTIONS="--color=auto --exclude=$EXC_FOLDERS"
    fi
    if [[ -n "$GREP_OPTIONS" ]]; then
        # export grep, egrep and fgrep settings
        alias grep="grep $GREP_OPTIONS"
        alias egrep="grep -E $GREP_OPTIONS"
        alias fgrep="grep -F $GREP_OPTIONS"

        # write to cache file if cache directory is writable
        if [[ -w "$ZSH_CACHE_DIR" ]]; then
            alias -L grep egrep fgrep >| "$__GREP_CACHE_FILE"
        fi
    fi
    unset GREP_OPTIONS EXC_FOLDERS
    unfunction grep-flags-available
fi
unset __GREP_CACHE_FILE __GREP_ALIAS_CACHES

# -- better history support ---
## History wrapper
function omz_history {
    local clear list
    zparseopts -E c=clear l=list

    if [[ -n "$clear" ]]; then
        # if -c provided, clobber the history file
        echo -n >| "$HISTFILE"
        fc -p "$HISTFILE"
        echo >&2 History file deleted.
    elif [[ -n "$list" ]]; then
        # if -l provided, run as if calling `fc' directly
        builtin fc "$@"
    else
        # unless a number is provided, show all history events (starting from 1)
        [[ ${@[-1]-} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
    fi
}

# Timestamp format
case ${HIST_STAMPS-} in
    "mm/dd/yyyy") alias history='omz_history -f' ;;
    "dd.mm.yyyy") alias history='omz_history -E' ;;
    "yyyy-mm-dd") alias history='omz_history -i' ;;
    "") alias history='omz_history' ;;
    *) alias history="omz_history -t '$HIST_STAMPS'" ;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.local/share/zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

setopt multios              # enable redirect to multiple streams: echo >file1 >file2
setopt long_list_jobs       # show long list format job notifications
setopt interactivecomments  # recognize comments

# Disable fzf annoying keybinds
bindkey -r '^T'   # borra Ctrl+T
bindkey -r '^[c'  # borra Alt+C
bindkey '^R' fzf-history-widget

# zprof
