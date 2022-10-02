#!/bin/bash

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

# Update any existing homebrew recipes
brew update

# Install my brew packages
brew install mas

#brew install mackup
brew install wget
brew install git
brew install ffmpeg
brew install fish
brew install starship
brew install tmux
brew install n
brew install exa
brew install ripgrep
brew install helix

#install oh my zsh
#sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install nodejs package manager n into $HOME/.n
#curl -L https://git.io/n-install | N_PREFIX=~/.n bash -s -- -y


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

# Install  ifolor Designer 
mas install 446366603
# Install Timeline Time Tracking
mas install 589698946
# Install WireGuard
mas install 1451685025
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

# Install cask packages
# brew install --cask 1password
brew install --cask iterm2
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
brew install --cask fork
# brew install --cask sublime-text
# brew install --cask sketch
brew install --cask vlc
# brew install --cask textmate
brew install --cask adobe-creative-cloud
brew install --cask appcleaner
brew install --cask drawio
# brew install --cask google-backup-and-sync
# brew install --cask unity
# brew install --cask unity-hub
# brew install --cask handbrake
brew install --cask syntax-highlight
brew install --cask figma
brew install --cask visual-studio-code
brew install --cask miro
brew install --cask camo-studio
brew install --cask linear-linear
brew install --cask macvim
brew install --cask microsoft-teams
brew install --cask zoom
brew install --cask element
brew install --cask betterzip
brew install --cask mouse-fix
brew install --cask monitorcontrol
brew install --cask --no-quarantine middleclick


# installing fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font

fish
# Setup and configure fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jethrokuan/z

fish_add_path /Users/dreieinsvier/.n/bin
fish_add_path /opt/homebrew/bin/
fish_add_path /usr/local/bin/
echo "starship init fish | source" >> $HOME/.config/fish/config.fish
echo "alias lll='exa --all --icons -l'" >> $HOME/.config/fish/config.fish

# Remove brew cruft
brew cleanup


'''
echo "Configure Mackup"
# Set cloud storage to iCloud

FILE=~/Library/Mobile\ Documents/com~apple~CloudDocs/Mackup/.mackup.cfg 
if test -f "$FILE"; then
	cp ~/Library/Mobile\ Documents/com~apple~CloudDocs/Mackup/.mackup.cfg ~/
else
	touch ~/.mackup.cfg
	echo "[storage]\nengine = icloud" >> ~/.mackup.cfg
fi

echo "Restore Configs"
Restore Settings
mackup restore
'''

echo "add this to the terminal to run fish on start: /opt/homebrew/bin/fish"

read -p "Setting up Computer done, press any key to finish" -n1 -s
echo '\n'
