# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

# Customize to your needs...
NODE_PATH="/usr/local/lib/node"

export RUBYOPT="rubygems"

# homebrew
export PATH="/usr/local/bin:$PATH"

# ruby
export PATH="/usr/local/ruby/1.9.2-p290/bin:$PATH"

# node
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

#export GEM_HOME="/usr/local/ruby/1.9.2-p290"
#export GEM_PATH="/usr/local/ruby/1.9.2-p290"

# custom
#export PATH="$HOME/bin:$PATH"


# Aliases
# =======

# Padrino
# -------
alias pad='padrino'

# Utils
# ----
alias tm='mate .'
alias fd='open .'
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'
alias lla='ls -lA'

# DNS Utils
# ---------
alias flushdns='sudo dscacheutil -flushcache'

# MySQL
# -----
alias importdb='mysql --default-character-set=utf8 -u root -p'

# HTTP Utils
# ----------
alias loghttp='tail -f /var/log/apache2/error_log'