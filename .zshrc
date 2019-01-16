# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"
DEFAULT_USER="adrianjoiner"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Config for powerlevel9k theme
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" $user_symbol "
## Visual customisation of second command prompt
#local user_symbol="→"
#if [[ $(print -P "%#") =~ "#" ]]; then
#   user_symbol = "#"
#fi

# Config for gnzh theme
ZSH_THEME="gnzh"


# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  docker
  osx
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]] || export DEFAULT_USER-"adrianjoiner"; then
#   export EDITOR='nano'
# else
#   export EDITOR='nano' 
#fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases from external file
. ~/.zsh_aliases

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# My functions
# Clone a repo, cd to it and open in vs code
quickstart() {
    cd ~/dev/Repos/ && git clone "$1" && cd $(basename $_ .git) && code .
}

# set docker host
dh() {
    export DOCKER_HOST="tcp://$1"
}

# create directoruy and cd into it
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

eval "$(chef shell-init zsh)"

