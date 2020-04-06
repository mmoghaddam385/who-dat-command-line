# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "avit" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git osx aws zsh-autosuggestions kubectl
)

echo "sourcing oh my"
source $ZSH/oh-my-zsh.sh

# User configuration
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

IS_ZSH=true
if [[ "$(uname -s)" == "Darwin" ]]; then
    MAC=true
elif [ "$(uname -s)" == "Linux" ]; then
    LINUX=true
fi

export GOPATH="${HOME}"

if [ $MAC ] && [ -d ~/homebrew ]; then
	PATH="${HOME}/homebrew/bin:${PATH}"
fi

if [ -d ~/homebrew ]; then
	PATH="${HOME}/bin:${PATH}"
fi

if [ -d ~/bin ]; then
  PATH="${HOME}/bin:${PATH}"
fi

if [ -d ~/Library/Python/3.7/bin ]; then
	PATH="${PATH}:${HOME}/Library/Python/3.7/bin"
fi

if [ -d /usr/local/opt/coreutils/libexec/gnubin ]; then
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

if [ -d /usr/local/opt/make/libexec/gnubin ]; then
  PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
fi

if [ -d /Users/rickybarillas/Library/Python/3.7/lib/python/site-packages ]; then
  PATH="/Users/rickybarillas/Library/Python/3.7/lib/python/site-packages:$PATH"
fi


# PATH="{PATH}:/usr/local/bin"
export GOPATH=$(go env | grep -i gopath | cut -d'=' -f 2 | sed 's/"//g') # fucking hell
if [ -d "${GOPATH}" ]; then
	PATH="${PATH}:${GOPATH}/bin"
fi

# personal is my whatever computer this is
if [ -f ~/.personal_spec ]; then
  . ~/.personal_spec
fi

# Aliases
alias dockerRM='docker rm -f $(docker ps -a -q)'
alias cp="cp -iv"
alias mv="mv -iv"
alias src='echo -n "Sourcing ~/.zshrc..."; exec zsh; echo "DONE";'
# Github

alias gco="git checkout"
alias gp="git push || gpsup"
alias gpu="git push -u"
alias gpl="git pull"
alias gstat="git status -uno"
alias gstata="git status"
alias gadu="git add -u"
alias gcom="git commit"
alias gcomm="git commit -m"
alias gam="git add -u && git commit -m"
# alias gcomaa="git commit -a --amend" # equivalent to 'gadu;gcomm "f";git rebase -i HEAD~2'
alias gpfl="git push --force-with-lease"

gcomaa () {
    # equivalent to 'gadu;gcomm "f";git rebase -i HEAD~2'
    message=$(git log -1 --format=%s)
    git commit -a -m "${message}" --amend
}

gdb () {
  branch="$(git branch --show-current)"
  git branch -D delete-me || echo ""
  git branch -m delete-me
  git fetch
  gco -b ${branch} origin/master
}

# Misc

alias watchup="watch \"!!\""

# Kubernetes

alias kgc="kubectl config get-contexts"
alias katl="kubectl config use-context polygon-atl"
alias kny2="kubectl config use-context polygon-ny2"
alias kset="kubectl config set-context --current --namespace"
alias klf="kubectl logs -f"

IVR_HOME="~/ivr-auth"
APOLLO_HOME="bin/apollo.sh"

PATH="/Users/rbarillas/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# Ops
alias opss="${IVR_HOME}/${APOLLO_HOME} ops staging"
alias opsp="${IVR_HOME}/${APOLLO_HOME} ops prod"
alias opsp="${IVR_HOME}/${APOLLO_HOME} ops pre-prod"

alias ls="ls --color=auto"

alias gmt="go mod tidy"


getAccountByEmailProd() {
  curlProd /accounts --data-urlencode "email=${1}" -G
}

getAccountByEmailStaging() {
  curlStaging /accounts --data-urlencode "email=${1}" -G
}

getKeyByStringProd() {
  curlProd /keys --data-urlencode "key=${1}" -G
}

getKeyByStringStaging() {
  curlStaging /keys --data-urlencode "key=${1}" -G
}


# Completions
mkdir -p ~/.zsh/completion
fpath=(~/.zsh/completion $fpath)
autoload bashcompinit && bashcompinit

complete -C "/usr/local/bin/aws_completer" aws

autoload -Uz compinit && compinit -i

if [ ! -f ~/.zsh/completion/_docker ]; then
  curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/zsh/_docker > ~/.zsh/completion/_docker
fi

source <(kubectl completion zsh)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/Users/rbarillas/homebrew/opt/sphinx-doc/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/rbarillas/homebrew/bin/terraform terraform


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rickybarillas/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rickybarillas/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rickybarillas/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rickybarillas/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(/Users/rickybarillas/src/github.com/polygon-io/tool-pgon/bin/pgon init -)"


# Prompt

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(k8s_ps1)'$PS1
KUBE_PS1_SYMBOL_USE_IMG='true'
KUBE_PS1_SEPARATOR=''
KUBE_PS1_CTX_COLOR='yellow'
cluster_func() {
  t=$(echo "${1}" | cut -d '-' -f2)
  if [[ "${t}" == "ny2" ]]; then
    t="%{%F{1}%}${t}%{%f%}"
  fi
  echo "${t}"
}
KUBE_PS1_CLUSTER_FUNCTION=cluster_func

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
