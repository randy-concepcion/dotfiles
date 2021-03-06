# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="/home/randy/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel9k Settings
POWERLEVEL9K_CONTEXT_TEMPLATE="%n [at] `hostname`"
POWERLEVEL9K_MODE="nerdfont-complete"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(history dir status)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=$'%F{024}'$'\u256D'$'\uE0B2'$'%F{reset_color}'
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=$'%F{024}'$'\u2570'$'\u2192 '$'%F{reset_color}'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=15
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
# enable the vcs segment in general
POWERLEVEL9K_SHOW_CHANGESET=true
# just show the 6 first characters of changeset
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_HISTORY_BACKGROUND="244"
#POWERLEVEL9K_IGNORE_TERM_COLORS=true
POWERLEVEL9K_TIME_FORMAT="%D{%I:%M:%S %p}"
POWERLEVEL9K_DIR_BACKGROUND="cyan"
POWERLEVEL9K_ALTDIR_FOREGROUND="black"
POWERLEVEL9_ALTDIR_BACKGROUND="cyan"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Git
export GIT_EDITOR=vim

# npm global folder
export PATH=~/.npm-global/bin:$PATH

# Aliases
## Terminal
alias profile_refresh="source ~/.zshrc && echo \"~/.zshrc profile refreshed\""
alias ls='ls --color=auto'
alias cdrandy='cd ~/repo/randy'
alias cdpg='cd ~/repo/work/policygenius'
alias rename_branch='/usr/local/bin/rename_branch'

# Use Environment variables
source ~/.env

# pyenv (pyenv init should be placed near end of file)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# pyenv-virtualenvwrapper
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
