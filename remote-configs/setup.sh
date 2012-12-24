#/bin/bash
# Set up oh-my-zsh (requires git)
cp ~/.zshrc ~/.zshrc-b4script
cp .zshrc ~/.zshrc
cd ~
git clone git://github.com/robbyrussell/oh-my-zsh.git

mv ~/oh-my-zsh ~/.oh-my-zsh

chsh -s /usr/bin/zsh
sleep 5
source ~/.zshrc
