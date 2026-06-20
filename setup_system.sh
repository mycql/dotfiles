#install zsh
sudo apt install zsh
chsh -s zsh
zsh

# Install StarShip
curl -sS https://starship.rs/install.sh | sh
# Setup StarShip
echo >>~/.zshrc
echo eval "$(starship init zsh)" >>~/.zshrc
eval "$(starship init zsh)"
mkdir .config
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# Further shell customizations
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo >>~/.zshrc
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >>~/.zshrc
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Custom scripts
mkdir scripts
# Intstall z directory jumper
curl https://raw.githubusercontent.com/rupa/z/refs/heads/master/z.sh -o ~/scripts/z.sh
chmod +x ~/scripts/z.sh
echo 'source ~/scripts/z.sh' >>~/.zshrc
source ~/scripts/z.sh
# micromamba
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
micromamba create -n dev
micromamba activate dev
echo 'micromamba activate dev' >> ~/.zshrc
micromamba install python uv nvim lazygit fzf ripgrep fd wget rust rust-analyzer
sudo apt install ocl-icd-opencl-dev
sudo apt install python3-pyaudio
sudo apt-get install libasound-dev
sudo apt install libpulse0
sudo apt install pulseaudio pulseaudio-utils

touch ~/.zaliases
echo 'vim=nvim' >>~/.zaliases
echo 'lg=lazygit' >>~/.zaliases
echo >>~/.zshrc
echo 'source ~/.zaliases' >>~/.zshrc
# Back up files for nvim
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

mkdir -p ~/projects
DOTFILES_DIR=~/projects/dotfiles
git clone https://github.com/mycql/dotfiles.git $DOTFILES_DIR
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/.config ~/.config
ln -sf $DOTFILES_DIR/.zshenv ~/.zshenv
ln -sf $DOTFILES_DIR/.zaliases ~/.zaliases

