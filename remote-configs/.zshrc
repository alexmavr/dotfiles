# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gentoo"
plugins=(git django vi-mode python pip github)
source $ZSH/oh-my-zsh.sh

#=================== Enviromental Variables ==================#

export PATH="$PATH" export LD_LIBRARY_PATH="$PATH"
export TERM="rxvt"

#==================== Awesome Functions =========================#

# Pretty-print the hostname
function hello() {
    echo -en '\e[0;35m' # Orange-like
	figlet $(hostname) 
    echo -en '\e[0m' 
}

# Extract archives
function extract () {
if [[ -f "$1" ]]; then
    case "$1" in
        *.tbz2 | *.tar.bz2) tar -xvjf  "$1"     ;;
        *.txz | *.tar.xz)   tar -xvJf  "$1"     ;;
        *.tgz | *.tar.gz)   tar -xvzf  "$1"     ;;
        *.tar | *.cbt)      tar -xvf   "$1"     ;;
        *.zip | *.cbz)      unzip      "$1"     ;;
        *.rar | *.cbr)      unrar x    "$1"     ;;
        *.arj)              unarj x    "$1"     ;;
        *.ace)              unace x    "$1"     ;;
        *.bz2)              bunzip2    "$1"     ;;
        *.xz)               unxz       "$1"     ;;
        *.gz)               gunzip     "$1"     ;;
        *.7z)               7z x       "$1"     ;;
        *.Z)                uncompress "$1"     ;;
        *.gpg)       gpg2 -d "$1" | tar -xvzf - ;;
        *) echo "Error: failed to extract $1" ;;
    esac
else
  echo "Error: $1 is not a valid file for extraction"
fi
} 

# Virtualenv management at ~/Envs (same as workon)
function venv () {
    if [[ "x$1" == "x" ]]; then
        echo "Usage: venv <virtualenv folder>"
    else
        if [[ -f  "${HOME}/Envs/$1/bin/activate" ]]; then
            source "${HOME}/Envs/$1/bin/activate"
        else
            virtualenv "${HOME}/Envs/$1"
            source "${HOME}/Envs/$1/bin/activate"
        fi
    fi
}
#==================== Init Actions ===========================#

hello

#==================== Custom aliases =========================#

# Shortened Aliases
alias v="vim"
alias s="source ~/.zshrc"
alias c="cd"
alias sv="sudo vim -u ${HOME}/.vimrc "
alias mix="alsamixer"

#   Git Aliases
alias ga="git add"
alias gpl="git pull"
alias gps="git push"
alias gmt="git commit -m "
alias grst="git reset --hard HEAD"
alias gamt="git commit -am "
alias gf="git fetch --all"
alias gm="git merge"
