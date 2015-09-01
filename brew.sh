cd ~

echo "  > Updating homebrew..."
brew update

echo "  > Installing packages with homebrew.."

brew install macvim --override-system-vim
brew install reattach-to-user-namespace tmux cmake ctags node tig heroku the_silver_searcher postgresql brew-cask rbenv ruby-build
brew tap caskroom/versions
brew tap caskroom/cask
brew cask install java7

echo "***** DONE *****"
