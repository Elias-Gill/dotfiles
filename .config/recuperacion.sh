echo COMENZANDO DE 0...
echo 
# programas escenciales
sudo pacman -Syu --no-confirm firefox neovim yay yadm git tlp zathura libreoffice \
alacritty zsh tmux go python pip python-pynvim zoxide bat lynx nodejs tree-sitter zathura-pdf-mupdf \
ripgrep fd tealdeer trash maim

# shell
sudo chsh /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# i3blocks
git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure
make
make install

# config files
yadm clone github.com/elias-gill/dotfiles
git clone github.com/elias-gill/nvim ~/.config/nvim
git clone github.com/elias-gill/fondos ~/Imágenes/fondos

# comandos
chmod +x ~/.local/bin/*

# aplicaciones de yay
yay -S urlview

echo INSTALACION FINALIZADA
