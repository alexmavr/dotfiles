# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="gentoo"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git django vi-mode python pip archlinux github)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

#==================== Awesome Functions =========================#

# Pretty-print the hostname
function hello() {
    echo -en '\e[0;35m' # Purple
	figlet $(hostname) 
    echo -en '\e[0m' 
}

# Set initial window transparency 
function init_window() {
    transset-df 0.9 --id $(xdotool getwindowfocus) > /dev/null
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

# Open images or documents
function open () {
if [[ -f "$1" ]]; then
    case "$1" in
        *.png)              feh     "$1" &   ;;
        *.jpeg)             feh     "$1" &   ;;
        *.JPG)              feh     "$1" &   ;;
        *.jpg)              feh     "$1" &   ;;
        *.pdf)              zathura     "$1" &> /dev/null &   ;;
        *.odt | *.doc)      libreoffice "$1" &> /dev/null &   ;;
        *.avi)              mplayer     "$1"    ;;
        *)                  vim "$1"            ;;
    esac
else
  echo "Error: $1 is not a valid file to open"
fi
}

# Play media files 
function play () {
if [[ -f "$1" ]]; then
    case "$1" in
        *.mp3 | *.ogg)          mplayer "$1"   ;;
        *.pls | *.m3u)          mplayer -playlist "$1"   ;;
        *) echo "Error: failed to open $1" ;;
    esac
else
  echo "Error: $1 could not play file"
fi
}

#==================== Init Actions =========================#

init_window
eval $(keychain -q --eval --agents ssh -Q ~/.ssh/id_rsa)
hello

#==================== Custom aliases =========================#

alias ls='ls --color=auto'
alias doskype='xhost +local: && sudo -u skype /usr/bin/skype'
alias letsmine='cgminer --url http://btcguild.com:8332/ --user nalfemp_1 --pass a'
alias svim="sudo vim -u /home/afein/.vimrc "
alias gmt="git commit -am "


