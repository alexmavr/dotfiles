ZSH=$HOME/.oh-my-zsh

ZSH_THEME='gentoo'
plugins=(git github)
source $ZSH/oh-my-zsh.sh

# vi mode
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^?' backward-delete-char

export KEYTIMEOUT=1

#=================== Enviromental Variables ==================#

export GOPATH=$HOME/gopath2/
export PATH=$PATH:$HOME/etcd-v2.0.0-linux-amd64:$GOPATH/src/github.com/GoogleCloudPlatform/kubernetes/cluster:$GOPATH/bin

export EDITOR='vim'
export TERM='xterm'

#==================== Functions =========================#

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
        *.pdf | *.ps)       zathura     "$1" &> /dev/null &   ;;
        *.odt | *.doc | *.docx)  libreoffice "$1" &> /dev/null &   ;;
        *.avi)              mplayer     "$1"    ;;
        *.wav)              mplayer     "$1"    ;;
        *.mp3)              mplayer     "$1"    ;;
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
export MARKPATH=$HOME/.marks

# Filesystem marks
function jump { 
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}

function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}

function unmark { 
    rm -i $MARKPATH/$1 
}

function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

function todec() {
    echo "$(( $1#$2 ))"
}

#==================== Custom aliases =========================#

# Shortened Aliases
alias v="vim"
alias s="source ~/.zshrc"
alias c="cd"
alias sv="sudo vim -u ${HOME}/.vimrc "
alias die="sudo shutdown -h now"
alias tm="tmux -2"

# Git Aliases
alias ga="git add"
alias gpl="git pull"
alias gps="git push"
alias gmt="git commit -m "
alias grst="git reset --hard HEAD"
alias gamt="git commit -am "
alias gf="git fetch --all"
alias gm="git merge"
