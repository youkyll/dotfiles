#/bin/bash

function set_vimrc()
{
	if [ -e ~/.vimrc ]
	then
		echo "mv vimrc"
		mv ~/.vimrc ~/.vimrc_bu
	fi

	ln -s ./vim/vimrc ~/.vimrc
}

function set_bashrc()
{
	if [ -e ~/.bashrc ]
	then
		echo "mv bashrc"
		mv ~/.bashrc ~/.bashrc_bu
	fi

	ln -s ./bash/bashrc ~/.bashrc
}

set_vimrc
set_bashrc
