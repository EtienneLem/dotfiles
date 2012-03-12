# Totally ripped off @rafbm's dotfiles... teehee


# =============== #
#   Environment   #
# =============== #

export EDITOR="mate -w"

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Custom
export PATH="$HOME/bin:$PATH"

# ruby
ruby_r18="/usr/local/ruby/1.8.7-p357/bin"
ruby_r19="/usr/local/ruby/1.9.2-p290/bin"
export PATH="$ruby_r19:$PATH"
export RUBYOPT="rubygems"

# Node
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"


# =========== #
#   Aliases   #
# =========== #

alias reload="source ~/.zshrc"
alias m.="mate ."
alias tm="mate ."
alias o.="open ."
alias fd="open ."
alias showhidden="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"
alias ll="ls -l"

# Git
alias gti="git" # shame

alias glog="git log --oneline --decorate"
alias gst="git status -sbu"
alias gdiff="git diff"
alias gadd="git add -p"
alias gadda="git add --all"
alias gci="git commit -v"
alias gcia="git commit -va"
alias grebase="git rebase -i"
alias gpull="git pull --rebase origin"
alias gpush="git push origin"
alias gstash="git stash save"
alias gpop="git stash pop"
alias gsub="gsubi && gsubu"
alias gsuba="git submodule add"
alias gsubi="git submodule init"
alias gsubu="git submodule update"
alias gdesactive="mv .git .git-inactive"
alias gactive="mv .git-inactive .git"

# Padrino
alias pad='bundle exec padrino'

# DNS
alias flushdns='sudo dscacheutil -flushcache'

# HTTP
alias loghttp='tail -f /var/log/apache2/error_log'


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

setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space

setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Completions for Ruby, Git, etc.
autoload compinit
compinit
