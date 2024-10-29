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
brew install fish
brew install mas
brew install mackup
brew install wget
brew install git
brew install ffmpeg
brew install starship
brew install tmux
brew install nvim
brew install rustup
brew install eza
brew install ripgrep
brew install lazygit
brew install python
brew install thefuck
brew install asdf
brew install bottom
brew install gnupg
brew install fzf
brew install zoxide
brew install gnu-sed
brew install colima docker
brew install git-delta

# needed for image nvim plugin
brew install imagemagick
brew install luarocks
#luarocks --local --lua-version=5.1 install magick

# installing cargo and rust
rustup-init


echo "Installing Apps"

# Install App Store packages

# Install Keynote
mas install 409183694
# Install Numbers
mas install 409203825
# Install Pages
mas install 409201541
# Install Cyberduck
mas install 409222199
# Install Pixelmator Pro
mas install 1289583905
# Install Screens 4
mas install 1224268771
# Install Mind Node 6
# mas install 1289197285
# Install Mindly
# mas install 1023136295
# Install  Amphetamine
mas install 937984704
# Install  Lime Chat
# mas install 414030210
# Install  WhatsApp Desktop
mas install 1147396723
# Install  Telegram
mas install 747648890
# Install  XCode
mas install 497799835
sudo xcodebuild -license accept
sudo xcode-select --switch /Applications/Xcode.app

# Install  ifolor Designer 
mas install 446366603
# Install Timeline Time Tracking
mas install 589698946
# Install WireGuard
# mas install 1451685025
# Install DaVinci Resolve
# mas install 571213070
# Install Final Cut Pro
mas install 424389933
# install Compressor
mas install 424390742
# install Affinity Designer
mas install 824171161
# install Affiniy Publisher
mas install 881418622
# install Bitwarden
mas install 1352778147
# install Blackmagic Speed Test
mas install 425264550

# Safari Extensions
# install Vimari
mas install 1480933944
#install Vinegar Tube Cleaner
mas install 1591303229

# Install cask packages
# brew install --cask 1password
# brew install --cask iterm2
brew install --cask processing
brew install --cask signal
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
brew install --cask vlc
# brew install --cask adobe-creative-cloud
brew install --cask appcleaner
brew install --cask drawio
# brew install --cask google-backup-and-sync
brew install --cask syntax-highlight
brew install --cask qlmarkdown
# brew install --cask figma
brew install --cask visual-studio-code
brew install --cask miro
# brew install --cask macvim
# brew install --cask microsoft-teams
# brew install --cask zoom
brew install --cask element
brew install --cask betterzip
brew install --cask mouse-fix
brew install --cask monitorcontrol
brew install --cask kap
brew install --cask kitty
brew install --cask obsidian
brew install --cask neovide
brew install --cask rio
brew install --cask --no-quarantine middleclick
# add middle click to login items
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/MiddleClick.app", hidden:true}'

# installing fonts
brew tap homebrew/cask-fonts
# brew install --cask font-fira-code-nerd-eont
brew install --cask font-jetbrains-mono-nerd-font 

# Setup Icons
read -p "Setting up Icons... " -n1 -s
echo '\n'

# Remove brew cruft
brew cleanup

# defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.config/iterm2"
# defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

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
