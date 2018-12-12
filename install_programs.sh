echo "Installing xcode-stuff"
xcode-select --install

if test ! $(which brew); then
echo "Installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
echo "Homebrew already installed"
fi

echo "Updating homebrew..."
brew update

echo "Git config"
git config --global user.name "James Paolantonio"
# git config --global user.email ""

echo "Install Oh My Zsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp zsh/zshrc ~/.zshrc

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

echo "TODO Install pure"

# Install apps to /Applications
# Default is: /Users/$user/Applications
apps=(
    licecap
    spectacle
    spotify
    trailer
    visual-studio-code
)
echo "Installing apps with Brew Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

apps=(
    node
)
echo "Installing apps with Brew..."
brew install ${apps[@]}

brew cleanup

echo "Installing apps with NPM..."
npm install --global pure-prompt

echo "Done!"
