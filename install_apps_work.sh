:#!/bin/bash
# if quarantined -> xattr -d com.apple.quarantine <file>

echo "Setting up Computer"

read -p "Press any key to continue… " -n1 -s
echo '\n'

echo "check if homebrew is already installed"

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  touch ~/.zshrc
  echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zshrc
  eval $(/opt/homebrew/bin/brew shellenv)
fi

echo "Installig Brew Packages"

# install xcode cmd 
xcode-select --install

# Update any existing homebrew recipes
brew update

# Install my brew packages
brew install mas
brew install mackup
brew install wget
brew install git
brew install ffmpeg
brew install fish
brew install starship
brew install tmux
brew install nvim
brew install rustup
brew install exa
brew install ripgrep
brew install lazygit
brew install python
brew install thefuck
brew install asdf
brew install bottom

# installing cargo and rust
rustup-init

# Install cask packages
# brew install --cask 1password
brew install --cask homebrew/cask-versions/iterm2-beta
brew install --cask processing
brew install --cask signal
# brew install --cask cakebrew
# brew install --cask coconutbattery
# brew install --cask dropbox
# brew install --cask dozer

# brew install --cask qlimagesize
# brew install --cask qlmarkdown
# brew install --cask qlstephen
# brew install --cask qlcolorcode
brew install --cask quicklook-json
brew install --cask blender
brew install --cask spotify
brew install --cask touchdesigner
brew install --cask google-chrome
brew install --cask firefox
# brew install --cask fork
# brew install --cask sublime-text
# brew install --cask sketch
brew install --cask vlc
# brew install --cask textmate
# brew install --cask adobe-creative-cloud
brew install --cask appcleaner
brew install --cask drawio
# brew install --cask google-backup-and-sync
# brew install --cask unity
# brew install --cask unity-hub
# brew install --cask handbrake
brew install --cask syntax-highlight
# brew install --cask figma
brew install --cask visual-studio-code
brew install --cask miro
brew install --cask macvim
# brew install --cask microsoft-teams
# brew install --cask zoom
brew install --cask element
brew install --cask betterzip
brew install --cask mouse-fix
brew install --cask monitorcontrol
brew install --cask kap
brew install --cask kitty
brew install --cask --no-quarantine middleclick
# add middle click to login items
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/MiddleClick.app", hidden:true}'

# installing fonts
brew tap homebrew/cask-fonts
# brew install --cask font-fira-code-nerd-font
brew install --cask font-jetbrains-mono


# Setup Icons
read -p "Setting up Icons... " -n1 -s
echo '\n'

# Spotify
#cd "/Users/dreieinsvier/Library/Mobile Documents/com~apple~CloudDocs/System/icons/"
#cp "Spotify.icns /Applications/Spotify.app/Contents/Resources/"
#cd /Applications/Spotify.app/Contents/Resources/
#mv Spotify.icns Icon.icns
#
## Kitty
#cd "/Users/dreieinsvier/Library/Mobile Documents/com~apple~CloudDocs/System/icons/"
#cp "Terminal.icns /Applications/kitty.app/Contents/Resources/"
#cd /Applications/kitty.app/Contents/Resources/
#mv Terminal.icns kitty.icns

# Remove brew cruft
brew cleanup


echo "Configure Mackup"

FILE="$HOME/Library/Mobile Documents/com~apple~CloudDocs/System/mackup/.mackup.cfg"
if test -f "$FILE"; then
	cp "$HOME/Library/Mobile Documents/com~apple~CloudDocs/System/mackup/.mackup.cfg" "$HOME/"
fi

echo "Restore Configs"
mackup -f restore

echo "add this to the terminal to run fish on start: /opt/homebrew/bin/fish"

read -p "Setting up Computer done, press any key to finish" -n1 -s
echo '\n'

