
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/afein/.zshrc'

# Autocompletion
autoload -Uz compinit
compinit

# Prompt Initialization
autoload -U promptinit
promptinit

# Prompt Selection
prompt walters

# shell history
HISTFILE=~/.histfile
HISTSIZE=1500
SAVEHIST=1500

# vi mode
bindkey -v 

# skype uses another user
alias skype='xhost +local: && sudo -u skype /usr/bin/skype'

# neverwinter nights 2
alias nwn2='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Atari/Neverwinter\ Nights\ 2/NWN2Launcher.exe'

# ssh tunnel
alias sshtunnel="ssh -ND 4711 -v afein@afein.dyndns.org"

function secure_chromium {
    port=4711
    chromium --proxy-server="socks://localhost:$port" &
    exit
}
