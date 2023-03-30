export ZSH="/home/yelinaung/.oh-my-zsh"
zmodload zsh/zprof

ZSH_THEME="robbyrussell"

# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export NVM_LAZY_LOAD=true
plugins=(git zsh-z zsh-autosuggestions zsh-nvm evalcache)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# export $PATH=$PATH:$HOME/.local/kitty.app/bin
export PATH=$HOME/.local/bin:$PATH

# Go
export PATH=$PATH:/usr/local/go/bin

# Rust / Cargo
source $HOME/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source /home/yelinaung/tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Check if 'kubectl' is a command in $PATH
if [ $commands[kubectl] ]; then

  # Placeholder 'kubectl' shell function:
  # Will only be executed on the first call to 'kubectl'
  kubectl() {

    # Remove this function, subsequent calls will execute 'kubectl' directly
    unfunction "$0"

    # Load auto-completion
    source <(kubectl completion zsh)

    # Execute 'kubectl' binary
    $0 "$@"
  }
fi
complete -F __start_kubectl k

alias watch="watch -n 1"
alias k="kubectl"
alias kdr="kubectl create --dry-run=client"
alias kfd='kubectl delete --force --grace-period=0'
alias kx="kubectx"
alias kns="kubens"
alias curl="curl -s"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias ls="exa"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# added by travis gem
[ ! -s /home/yelinaung/.travis/travis.sh ] || source /home/yelinaung/.travis/travis.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

unsetopt BEEP

export TOMCAT_HOME="/home/yelinaung/tools/apache-tomcat-8.5.71"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

alias lz=lazygit
export PATH="$HOME/.pyenv/bin:$PATH"
_evalcache pyenv init --path

_evalcache pyenv virtualenv-init -

export __GL_CacheDisable=2 

HISTFILE=~/.zsh_history
HISTSIZE=999999
SAVEHIST=$HISTSIZE
_evalcache keychain --eval -q ~/.ssh/id_rsa

_evalcache rbenv init -
