# Path to your oh-my-zsh installation.
export ZSH=/Users/jonathan/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git rails tmux bundler)

DISABLE_AUTO_TITLE=true

# User configuration
export GOPATH=$HOME/golang
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin"

export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# aliases
alias cwd='pwd | pbcopy'
alias gctags='ctags -R --exclude=.git --exclude=log . $(bundle list --paths)'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias logdev='tail -f log/development.log'

# Always work in a tmux session if tmux is installed
#if which tmux 2>&1 >/dev/null; then
#  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#    tmux attach -t hack || tmux new -s hack; exit
#  fi
#fi

PATH="/Users/jonathan/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/jonathan/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/jonathan/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/jonathan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jonathan/perl5"; export PERL_MM_OPT;

PATH="/opt/chefdk/bin${PATH+:}${PATH}"; export PATH;
