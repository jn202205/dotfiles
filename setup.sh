#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/Documents/programming/dotfiles                    # dotfiles directory
olddir=~/Documents/programming/dotfiles_old             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="ssh gemrc git_template gitconfig gitignore_global ideavimrc railsrc rspec tmux.conf pryrc vimrc vimrc.bundles vim zshrc"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"
echo "copying bin/battery to ~"

# symlink does work for battery script
mkdir ~/bin
cp bin/battery ~/bin/battery

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -sf $dir/$file ~/.$file
done
