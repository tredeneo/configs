#!/bin/bash

sudo apt update
sudo apt upgrade -y

#repositorio vscode
#wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
#sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
#sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
#sudo apt install apt-transport-https
#sudo apt update

#dart
#sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
#sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
#sudo apt update 
#sudo apt install -y dart

sudo apt update
sudo apt install -y clang-format emacs git make kate calibre anki flatpak snapd

#desenvolvimento c/c++
sudo apt install -y clang clang-tidy clang-tools

#neovim e lsp
sudo apt install -y nodejs yarnpkg

#flutter linux desktop
sudo apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev libblkid-dev liblzma-dev



sudo flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#set -U fish_user_paths /snap/bin/ $fish_user_paths 
sudo apt install libsquashfuse0 squashfuse fuse
sudo chmod 755 /  #   ---liberar snap:w
sudo snap install nvim --classic
git clone https://github.com/tredeneo/configs.git -c ~/
mkdir -p ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom -y install
cp ~/configs/neo\ vim/~/.config/nvim/* ~/.config/nvim/
cp ~/configs/doom\ emacs/~/.doom.d/* ~/.doom.d/
cp ~/configs/compile_flags.txt ~/.config/
nvim --headless +PlugInstall +qa
rm -rf ~/configs/
sudo apt install -y fish
sudo chsh -s /usr/bin/fish $USER
curl -L https://get.oh-my.fish | fish

