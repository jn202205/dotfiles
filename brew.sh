cd ~

echo "  > Updating homebrew..."
brew update

echo "  > Installing packages with homebrew.."

brew install macvim --override-system-vim
brew install reattach-to-user-namespace tmux cmake ctags node the_silver_searcher brew-cask rbenv ruby-build rbenv-gemset
brew tap caskroom/versions
brew tap caskroom/cask
brew cask install java7

echo "***** DONE *****"
