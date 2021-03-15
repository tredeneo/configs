#!/bin/bash

sudo apt update
sudo apt upgrade -y


sudo apt update
sudo apt install -y clang-format git  kate calibre anki flatpak snapd

#desenvolvimento c/c++
sudo apt install -y clang clang-tidy clang-tools make

sudo flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#set -U fish_user_paths /snap/bin/ $fish_user_paths 
sudo apt install libsquashfuse0 squashfuse fuse
sudo chmod 755 /  #   ---liberar snap:w
sudo snap install nvim --classic
git clone https://github.com/savq/paq-nvim.git \
        $HOME/.local/share/nvim/site/pack/paqs/opt/paq-nvim
git clone https://github.com/tredeneo/configs.git -c ~/
mkdir -p ~/.config/nvim
cp ~/configs/neo\ vim/~/.config/nvim/* ~/.config/nvim/
cp ~/configs/compile_flags.txt ~/.config/
rm -rf ~/configs/
sudo apt install -y fish
sudo chsh -s /usr/bin/fish $USER
curl -L https://get.oh-my.fish | fish
