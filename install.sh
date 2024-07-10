#!/bin/bash

echo 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
echo 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k'
echo 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
echo 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'


DOT_DIR="$HOME/dotfiles"
if if [ ! -d ${DOT_DIR} ]; then
    for f in *
    do
        [[ "$f" == ".git" ]] && continue
        [[ "$f" == ".gitignore" ]] && continue
        [[ "$f" == ".DS_Store" ]] && continue
        [[ "$f" == "README.md" ]] && continue
        [[ "$f" == "install.sh" ]] && continue

        ln -snf $DOT_DIR/"$f" $HOME/".$f"
        echo "Installed .$f"
    done
else
    echo "dotfiles already exists"
    exit 1
fi
