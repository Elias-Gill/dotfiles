#!/bin/sh
echo "COMENZANDO DE 0..."
cd ~

# programas escenciales
sudo pacman -Syu --noconfirm firefox neovim yay yadm git tlp zathura libreoffice \
alacritty zsh tmux go python python-pip python-pynvim zoxide bat lynx nodejs tree-sitter zathura-pdf-mupdf \
ripgrep fd tealdeer trash-cli peco swaybg sway swayidle swayimg waybar ranger chafa git-delta grim slurp npm \
kanshi wl-clipboard dmenu fzf noto-fonts-emoji ttf-firacode-nerd ttf-cascadia-code-nerd

# config files
yadm clone https://github.com/elias-gill/dotfiles
yadm checkout /home/elias
git clone https://github.com/elias-gill/nvim ~/.config/nvim

# tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# shell
sudo chsh $(whoami) -s /usr/bin/zsh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
mv .zplug $HOME/.local/share/zplug
zplug install

# i3blocks
git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure
make
pkexec make install
cd ~

# comandos
chmod +x ~/.local/bin/*

echo INSTALACION FINALIZADA
