source ~/.profile

# rust cargo
if [[ -d "$HOME/.cargo" ]]; then
    export PATH="$PATH:$HOME/.cargo/bin/"
fi
if [[ -f "$HOME/.cargo/env" ]]; then
    source "$HOME/.cargo/env"
fi

[[ ! -r /home/elias/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

if [[ -f "$HOME/.config/secrets" ]]; then
    source "$HOME/.config/secrets"
fi

# -- Go config -- 
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go 
export GOPATH=$HOME/.local/share/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH 

# -- Flutter path -- 
export PATH="$HOME/.local/share/flutter/bin:$PATH"
export CHROME_EXECUTABLE="/usr/bin/brave"

# Maven config
export MAVEN_HOME=$HOME/.local/share/m2/
export PATH=$MAVEN_HOME/bin/:$PATH

# AnaConda config (BORRAR ESTA PORQUERIA)
export PATH="$HOME/.local/share/anaconda3/bin:$PATH"
