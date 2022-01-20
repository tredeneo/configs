#!/bin/bash
sudo apt update
sudo apt install -y git flatpak 

#desenvolvimento c/c++
#sudo apt install -y clang clang-tidy clang-tools make clang-format
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install libsquashfuse0 squashfuse fuse snapd
sudo chmod 755 /  #   ---liberar snap:w
mkdir -p ~/.local/share/fonts
curl "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf?raw=true" -o "Noto Mono Nerd Font Complete Mono.ttf"
curl "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete.ttf?raw=true" -o Noto Mono Nerd Font Complete.ttf
rm -rf ~/configs/
sudo apt install -y fish
# set -U fish_user_paths /snap/bin/ $fish_user_paths 
curl -L https://get.oh-my.fish | fish
