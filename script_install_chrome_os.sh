#!/bin/bash
sudo apt update
sudo apt install -y clang-format git kate flatpak snapd

#desenvolvimento c/c++
sudo apt install -y clang clang-tidy clang-tools make

# set -U fish_user_paths /snap/bin/ $fish_user_paths 
sudo apt install libsquashfuse0 squashfuse fuse
sudo chmod 755 /  #   ---liberar snap:w
git clone https://github.com/savq/paq-nvim.git \
        $HOME/.local/share/nvim/site/pack/paqs/opt/paq-nvim
rm -rf ~/configs/
sudo apt install -y fish
curl -L https://get.oh-my.fish | fish
