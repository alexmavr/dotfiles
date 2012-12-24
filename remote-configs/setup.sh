#/bin/bash
# Set up oh-my-zsh (requires git)
cp .zshrc ~/.zshrc
cp ~/.zshrc ~/.zshrc-b4script
cd ~
git clone git://github.com/robbyrussell/oh-my-zsh.git
./oh-my-zsh/tools/install.sh
cp ~/.zshrc-old ~/.zshrc
