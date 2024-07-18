#!/bin/bash

# zshのインストール
if ! command -v zsh &> /dev/null
then
    echo "zsh could not be found, installing zsh..."
    if [ "$(uname)" == "Darwin" ]; then
        brew install zsh
    elif [ -f /etc/debian_version ]; then
        sudo apt-get install zsh -y
    elif [ -f /etc/redhat-release ]; then
        sudo yum install zsh -y
    fi
fi

# oh-my-zshのインストール
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# powerlevel10kのインストール
echo "Installing Powerlevel10k..."
if [! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# リポジトリから設定をクローン
if [ ! -d "$HOME/.zsh-minimum" ]; then
    git clone https://github.com/gae-22/zsh-minimum.git $HOME/.zsh-minimum
fi

# シンボリックリンクを作成
ln -sf $HOME/.zsh-minimum/zshrc.zsh $HOME/.zshrc
ln -sf $HOME/.zsh-minimum/vimrc.vim $HOME/.vimrc

echo "Installation complete. Please restart your terminal."