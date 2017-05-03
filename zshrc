pathdirs=(
  /usr/local/sbin
  /usr/local/bin
  /Users/francesco/bin
  /usr/local/share/python
  /usr/local/share/npm/bin
)
pathdirs=($^pathdirs(N))

for dir in $pathdirs; do export PATH=$dir:$PATH; done

pathdirs=(
  /Users/francesco/bin
  /Users/francesco/Programmazione/buildo/infra/scripts/github
  /Users/francesco/Programmazione/buildo/infra/scripts/devops
)
pathdirs=($^pathdirs(N))

for dir in $pathdirs; do export PATH=$PATH:$dir; done

ZSH="/Users/francesco/.zsh"

# export LSCOLORS=cxhxfxdxbxegxdabagacad

# aliases
export CLICOLOR=1
# alias l='ls'
# alias ldir='ls -d */'
# alias valgrind='valgrind --leak-check=full --show-possibly-lost=no --dsymutil=yes'
# alias grepp='grep --color=auto -H -n -r -e'
alias gff='git pull --ff-only'
# alias ssh='LC_ALL=en_US.UTF-8 ssh'
alias buildo='cd ~/Programmazione/buildo/'
alias lol='cd ~/Programmazione/buildo/aliniq/labonline/web'
alias gll='git log --oneline --decorate --graph --all'
alias gclb='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias hpf='hophop gh feature'
alias hppr='hophop gh pr'
alias hpo='hophop gh open'
alias subs='subliminal download -l en .'
alias fuba="curl -X POST --data-urlencode 'payload={\"text\": \"fuba!\", \"channel\": \"#fuba\", \"username\": \"francesco\", \"icon_url\": \"https://s3-us-west-2.amazonaws.com/slack-files2/avatars/2014-09-29/2728248986_48.jpg\"}' https://hooks.slack.com/services/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"
alias flux="open /Applications/Flux.app"
alias rds="killall Flux || redshift -O"
alias rds.stop="killall redshift && flux"
alias rds.n="rds 1800 && rds 1800 &"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Antigen
source /Users/francesco/.zsh/antigen/antigen.zsh
#  bundles che ho tolto per ora..
#  robbyrussell/oh-my-zsh lib/git.zsh 
antigen bundles <<EOBUNDLES
  git
  osx
  zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen theme agnoster
antigen apply

# aliases to apply after antigen
alias gd='git diff --color'
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%C(yellow)(%an, %C(white)%ar)"'

setopt auto_cd
cdpath=()
setopt auto_pushd
setopt rm_star_wait
export EDITOR="vim"

HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000
setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt extended_history

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=0
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

setopt vi
bindkey -v
bindkey -s '^u' 'cd ..; ls^M'
bindkey -s '^l' 'ls^M'

# Fix home/end
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# search
bindkey "^R" history-incremental-search-backward
bindkey "^[[A" up-line-or-search

# Load the theme
setopt prompt_subst
# source $ZSH/agnoster.zsh-theme

# vim readonly
function vles() {
  case $# in
    0 ) vim -u ~/.dotfiles/.lessvimrc -;;
    1 ) vim -u ~/.dotfiles/.lessvimrc -R $1;;
  esac
}

# vagrant
export VAGRANT_HOME=/Volumes/VMs/Vagrant/vagrant.d

# source completions
source ~/.zsh/completions/tmuxinator.zsh

# some git shit from oh my zsh useful for agnoster theme..
source ~/.zsh/git.zsh

# aliases file, useful to dump aliases to..
source ~/.zsh/aliases.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.nvm/nvm.sh
