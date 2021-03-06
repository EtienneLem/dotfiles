# Totally ripped off @rafbm's dotfiles... teehee


# =============== #
#   Environment   #
# =============== #

export EDITOR='mate -w'
# export EDITOR='atom -w'

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Ruby
export PATH="$HOME/.rbenv/shims:$PATH"

# Python
# export PATH="/usr/local/share/python:$PATH"

# Custom
export PATH="$HOME/bin:$PATH"

# Node
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"


# =========== #
#   Aliases   #
# =========== #

alias code="cd ~/Code"
alias hosts="mate /etc/hosts"
alias config="mate ~/.zshrc"
alias reload="source ~/.zshrc"
alias back='cd $OLDPWD'
alias m.="mate ."
alias tm="m."
alias o.="open ."
alias fd="o."
alias ll="ls -l"
alias ip='curl http://icanhazip.com'
alias server='open http://localhost:1337 && python -m SimpleHTTPServer 1337'

# Git
alias gti="git" # shame

# alias _glog="git log --pretty=format:'%C(yellow)%h%C(reset)%C(bold red)%d%C(reset) %s %C(green)(%cr) %C(cyan)<%an>%C(reset)' --abbrev-commit --branches --remotes --tags"
alias _glog="git log --pretty=format:'%C(yellow)%h%C(reset)%C(bold red)%d%C(reset) %s %C(green)(%cr) %C(cyan)<%an>%C(reset)' --abbrev-commit"
alias glog="_glog -n 30 | ruby -e 'puts STDIN.read.gsub(%(<#{%x(git config user.name).chomp}>), %())'"
alias gst="git status -sbu"
alias gdiff="git diff"
alias gadd="git add -p"
alias gadda="git add --all"
alias gci="git commit -v"
alias gcia="git commit -vau"
alias grebase="git rebase -i"
alias gpull="git pull --rebase origin"
alias gpullu="git pull --rebase upstream"
alias gpush="git push -u origin"
alias gstash="git stash -u"
alias gpop="git stash pop"
alias gsub="gsubi && gsubu"
alias gsuba="git submodule add"
alias gsubi="git submodule init"
alias gsubu="git submodule update"
alias gdesactive="mv .git .git-inactive"
alias gactive="mv .git-inactive .git"
alias gcount="git shortlog -sn"
alias grc="git rebase --continue"
alias grm="git rebase master"
alias gclone="git clone --recursive"
alias gstashci="git add --all && git commit -m '[STASH]'"
alias gpopci="git uncommit"
alias gmerge="git merge --no-ff"
alias gclean="git clean -fd"

# Bundle
alias be='bundle exec '

# Rails
alias dmr='be rake db:migrate:reset'
alias ds='be rake db:seed'
alias bootstrap='dmr && ds'

# Padrino
alias pad='padrino'

# DNS
alias flushdns='sudo dscacheutil -flushcache'

# HTTP
alias loghttp='tail -f /var/log/apache2/error_log'

# System
alias dock-no-delay='defaults write com.apple.Dock autohide-delay -float 0 && killall Dock'
alias dock-delay='defaults delete com.apple.Dock autohide-delay && killall Dock'
alias show-hidden-files='defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder'
alias hide-hidden-files='defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder'


# =========== #
#  Functions  #
# =========== #
ipfwd() { sudo ipfw add 100 fwd 127.0.0.1,$1 tcp from any to me $2 }
tabname() { printf "\e]1;$1\a" }

# ========== #
#   Prompt   #
# ========== #

# Colors
autoload -U colors
colors
setopt prompt_subst

# PROMPT
local percent="%(?,%{$fg[green]%}%#%{$reset_color%},%{$fg[red]%}%#%{$reset_color%})"

PROMPT='
%F{135}%~%{$reset_color%} $(git-prompt.rb)
${percent} %{$reset_color%}'

RPROMPT='%F{16}$(date)%{$reset_color%}'

# History (stolen from oh-my-zsh)
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Fuck yes, at last. This is what the default behavior of ⬆ and ⬇ should be.
# Seen at http://cims.nyu.edu/cgi-systems/info2html?(zsh)ZLE%2520Functions and http://dotfiles.org/~urukrama/.zshrc
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

# Set Apple Terminal.app resume directory
if [[ $TERM_PROGRAM == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]] {
  function chpwd {
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
  }

  chpwd
}

# Rdio completions
if which rdio &> /dev/null; then
  rdio_commands=(`~/Code/rdio-cli/bin/rdio commands`)
  compctl -k rdio_commands rdio
fi

# Completions for Ruby, Git, etc.
autoload compinit
compinit
