#/bin/sh

set_rc()
{
	if [ $# -ne 2 ]
	then
	  echo "error: Needs two arguments" 1>&2
	  return 1
	fi


	rc="$HOME/$1"
	if [ -e $rc -a ! -L $rc ]
	then
		echo "mv orig $1" 
		mv $rc ${rc}_bu
	elif [ -L $rc ]
	then
		echo "already $1 symlink"
		return 0
	fi

	ln -s $HOME/dotfiles/$2 $rc
	return 0
}

set_rc .zshrc sh/zsh/zshrc
set_rc .bashrc sh/bash/bashrc
set_rc .vimrc vim/vimrc
