# zmodload zsh/zprof
# "trick" to speed up compinit
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

# case insensitive completition and menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
bindkey -e

# p10k instant prompt (has to be on top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#  --------------
# | USER PLUGINS |
#  --------------
# plugin manager
export ZPLUG_HOME="$HOME/.local/share/zplug_home"
source "$ZPLUG_HOME/init.zsh"

# --- plugins list --- 
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "plugins/fzf", from:oh-my-zsh
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"
# --- end --- 
zplug load

# --- configurations ---
# sugestions plugin
ZSH_AUTOSUGGEST_MANUAL_REBIND="true"
ZSH_AUTOSUGGEST_STRATEGY=(history)

# autocompletition plugin
ENABLE_CORRECTION="false"

# support for zoxide cd
FILE=/usr/bin/zoxide
if [[ -f "$FILE" ]]; then
    alias cd="z"
    eval "$(zoxide init zsh)"
fi

#  --------------------
# | USER CONFIGURATION |
#  --------------------

# -- Go config -- 
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go 
# local
export GOPATH=$HOME/.local/share/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH 
export MAVEN_HOME=$HOME/.m2/
export PATH=$HOME/.m2/bin/:$PATH

# ---- alias ----
# better replace for ls
FILE=/usr/bin/exa
if [[ -f "$FILE" ]]; then
    alias ls="exa"
    alias la="exa --all"
    alias ll="exa --long --all"
else
    alias la="ls -A --color=always"
    alias ll="ls -lA --color=always"
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

# better cd experience
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
alias -g ..='cd ..'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# zprof

#  -------------------------
# | keybinds from oh-my-zsh |
#  -------------------------
#  WARN: do not touch anything

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

# Use emacs key bindings
bindkey -e

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

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
    bindkey -M emacs "${terminfo[khome]}" beginning-of-line
    bindkey -M viins "${terminfo[khome]}" beginning-of-line
    bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
    bindkey -M emacs "${terminfo[kend]}"  end-of-line
    bindkey -M viins "${terminfo[kend]}"  end-of-line
    bindkey -M vicmd "${terminfo[kend]}"  end-of-line
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
# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
    bindkey -M emacs "${terminfo[kdch1]}" delete-char
    bindkey -M viins "${terminfo[kdch1]}" delete-char
    bindkey -M vicmd "${terminfo[kdch1]}" delete-char
else
    bindkey -M emacs "^[[3~" delete-char
    bindkey -M viins "^[[3~" delete-char
    bindkey -M vicmd "^[[3~" delete-char

    bindkey -M emacs "^[3;5~" delete-char
    bindkey -M viins "^[3;5~" delete-char
    bindkey -M vicmd "^[3;5~" delete-char
fi

# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

bindkey '\ew' kill-region                       
bindkey -s '\el' 'ls\n'                         
bindkey '^r' history-incremental-search-backward
bindkey ' ' magic-space                         

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
