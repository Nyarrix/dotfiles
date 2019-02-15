#!/bin/bash

function set_simlink {
	if [ -L $2 ]; then
		echo "simlink $2 already exists"
	else
		ln -s $1 $2
	fi
}

function copy_file {
	if [ -e $2 ]; then
		echo "file $2 already exists."
	else
		cp $1 $2
	fi
}

function create_directory {
	if [ -e $1 ]; then
		echo "directory $1 exists."
	else
		mkdir $1
	fi
}

# setup
create_directory ~/.config/

# shell
set_simlink ~/dotfiles/.bash_logout ~/.bash_logout
set_simlink ~/dotfiles/.bashrc ~/.bashrc
set_simlink ~/dotfiles/.bash_profile ~/.bash_profile
set_simlink ~/dotfiles/fish/ ~/.config/fish

# tmux
copy_file ~/dotfiles/.tmux.conf ~/.tmux.conf

# neovim
set_simlink ~/dotfiles/nvim/ ~/.config/nvim
