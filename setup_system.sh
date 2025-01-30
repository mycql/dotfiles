# Install Homewbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Set homewbrew in shell
echo >>$HOME/.zprofile
echo 'eval "$(/usr/local/bin/brew shellenv)"' >>$HOME/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

# Install StarShip
curl -sS https://starship.rs/install.sh | sh
# Setup StarShip
echo >>~/.zshrc
echo eval "$(starship init zsh)" >>~/.zshrc
eval "$(starship init zsh)"
mkdir .config
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# Further shell customizations
brew install zsh-autosuggestions
echo >>~/.zshrc
echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >>~/.zshrc
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
brew install --cask font-jetbrains-mono
mkdir -p ~/.config/ghostty
echo 'font-family = "JetBrains Mono"' >>~/.config/ghostty/config

# Custom scripts
mkdir scripts
# Intstall z directory jumper
curl https://raw.githubusercontent.com/rupa/z/refs/heads/master/z.sh -o ~/scripts/z.sh
chmod +x ~/scripts/z.sh
echo 'source ~/scripts/z.sh' >>~/.zshrc
source ~/scripts/z.sh

# Install Lazyvim
brew install neovim
brew install jesseduffield/lazygit/lazygit
brew install fzf
touch ~/.zaliases
echo 'vim=nvim' >>~/.zaliases
echo 'lg=lazygit' >>~/.zaliases
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
echo 'source <(fzf --zsh)' >>~/.zshrc
brew install ripgrep
brew install fd

# Back up files for nvim
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
