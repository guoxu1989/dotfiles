# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)


# Customize to your needs...
export EDITOR=/usr/bin/vim
source $HOME/.bash_aliases
if [ -f $HOME/.bash_aliases.local ]
then
    source $HOME/.bash_aliases.local
fi
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

source $HOME/.pathes

# Antigen: cd ~ && git clone https://github.com/zsh-users/antigen.git .antigen 
source "$HOME/.antigen/antigen.zsh"
antigen-bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle
antigen-apply
antigen-use oh-my-zsh
antigen-bundle git
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
source $ZSH/oh-my-zsh.sh
#PROMPT='%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[cyan]%}%m%{$fg_bold[green]%}:%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# Fix the slowness of zsh prompt, by removing the git status stuff that slows it down...
#https://gist.github.com/msabramo/2355834
function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

if [ -f ~/dotfiles/functions.sh ]; then
    . ~/dotfiles/functions.sh
fi


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
