#!/bin/bash

echo "--Starting personalize"
echo "--Installing cargo"
if [ -d ~/.cargo ]; then
        echo "  rust already installed"
else
        curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

echo "--Installing fzf"
if [ -d ~/.fzf ]; then
    echo "  fzf already installed"
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

echo "--Installing nvm"
if [ -d ~/.nvm ]; then
    echo "  nvm already installed"
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
fi

echo "--Installing pyenv"


if [ -d ~/.pyenv ]; then
    echo "  pyenv already installed"
else
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi


echo "--Installing ohmyzsh"
sudo apt install zsh -y 
if [ -d ~/.oh-my-zsh ]; then
    echo "  ohmyzsh already installed"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "--Configuring rc files"

rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

rm ~/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
