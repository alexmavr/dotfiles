ZSH=$HOME/.oh-my-zsh

ZSH_THEME='gentoo'
plugins=(git django vi-mode python pip archlinux github)
source $ZSH/oh-my-zsh.sh

#=================== Enviromental Variables ==================#

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

export BROWSER='spacefm'
export EDITOR='vim'
export TERM='rxvt'

#==================== Functions =========================#

# Pretty-print the hostname
function hello() {
    echo -en '\e[0;35m' # Orange-like
	figlet $(hostname) 
    echo -en '\e[0m' 
}

# Set initial window transparency 
function init_window() {
    transset-df 0.9 --id $(xdotool getwindowfocus)
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
  echo 'Error: $1 is not a valid file for extraction'
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
        *.odt | *.doc | *.docx)  libreoffice "$1" &> /dev/null &   ;;
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
        *.mp3 | *.ogg)      mplayer "$1"   ;;
        *.avi | *.mp4 | *.mkv)      mplayer "$1"   ;;
        *.pls | *.m3u)      mplayer -playlist "$1"   ;;
        *) echo "Error: failed to open $1" ;;
    esac
else
  echo "Error: $1 could not play file"
fi
}

# Google something
function google {
    q=""
    i=0
    for var in "$@"
    do
        if [ "$i" -eq "0" ]; then
            q+=$var
        else
            q+="+"$var
        fi
        i+=1
    done
    chromium "http://www.google.com/search?q=$q"
}

# Search for something on twitter (returns prettified json)
function twitter {
   num=5 
   if [ $2 ]; then
       num=$2
   fi 
   curl "http://search.twitter.com/search.json?q=$1&rpp=$num&include_entities=true" | jq "[.results[] | {from_user_name, text}]"
}

# Run skype as a restricted user
function doskype() {
    xhost +local: && sudo -u skype /usr/bin/skype
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

init_window > /dev/null 2>&1
eval $(keychain -q --eval --agents ssh -Q ~/.ssh/id_rsa)

# Show hostname if not in scratchpad
if [[ -z $SCRATCH ]]; then
    hello
fi

#==================== Custom aliases =========================#

# Shortened Aliases
alias v="vim"
alias s="source ~/.zshrc"
alias c="cd"
alias sv="sudo vim -u /home/afein/.vimrc "
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

# Ease-of-use Aliases
alias letsmine="cgminer --url http://btcguild.com:8332/ --user nalfemp_1 --pass a"
alias testcam="guvcview"
