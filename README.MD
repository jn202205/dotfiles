### Install xcode command line tools
```
xcode-select install
```

### Install homebrew
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install zsh and oh-my-zsh
```
brew install zsh
```
1. `brew install zsh`
2. make sure `/usr/local/bin/zsh` is in /etc/shells
3. `chsh -s /usr/local/bin/zsh` 
4. `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

### Install brew packages and symlink dotfiles
```
git clone https://github.com/jn202205/dotfiles.git ~/dotfiles
./brew.sh
./setup.sh
```
