# Totally ripped off @rafbm's dotfiles... teehee


# =============== #
#   Environment   #
# =============== #

export EDITOR="mate -w"

# Homebrew
export PATH="/usr/local/bin:$PATH"

# ruby
ruby_r18="/usr/local/ruby/1.8.7-p357/bin"
ruby_r19="/usr/local/ruby/1.9.2-p290/bin"
export PATH="$ruby_r19:$PATH"
export RUBYOPT="rubygems"

# Python
export PATH="/usr/local/share/python:$PATH"

# Custom
export PATH="$HOME/bin:$PATH"

# Node
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"


# =========== #
#   Aliases   #
# =========== #

alias hosts="mate /etc/hosts"
alias config="mate ~/.zshrc"
alias reload="source ~/.zshrc"
alias back='cd $OLDPWD'
alias m.="mate ."
alias tm="mate ."
alias o.="open ."
alias fd="open ."
alias ll="ls -l"
alias ip='echo -n `ifconfig | grep -Po "(?<=inet )\d*\.\d*\.\d*\.\d*(?=.*broadcast)"` | pbcopy'

# Git
alias gti="git" # shame

alias glog="git log --oneline --decorate"
alias gst="git status -sbu"
alias gdiff="git diff"
alias gadd="git add -p"
alias gadda="git add --all"
alias gci="git commit -v"
alias gcia="git commit -vau"
alias grebase="git rebase -i"
alias gpull="git pull --rebase origin"
alias gpullu="git pull --rebase upstream"
alias gpush="git push origin"
alias gstash="git stash save"
alias gpop="git stash pop"
alias gsub="gsubi && gsubu"
alias gsuba="git submodule add"
alias gsubi="git submodule init"
alias gsubu="git submodule update"
alias gdesactive="mv .git .git-inactive"
alias gactive="mv .git-inactive .git"

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
%F{135}%~%{$reset_color%}  $(git-prompt.rb)
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

# Completions for Ruby, Git, etc.
autoload compinit
compinit
