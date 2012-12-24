#/bin/bash
# Set up oh-my-zsh (requires git)
cp ~/.zshrc ~/.zshrc-b4script
cp .zshrc ~/.zshrc
cd ~
git clone git://github.com/robbyrussell/oh-my-zsh.git
./oh-my-zsh/tools/install.sh
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
