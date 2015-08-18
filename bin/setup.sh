#/bin/sh

set_vimrc()
{
	vimrc='~/.vimrc'
	if [ -e $vimrc -a ! -L $vimrc ]
	then
		echo 'mv vimrc'
		mv $vimrc ~/.vimrc_bu
	elif [ -L $vimrc ]
	then
		echo 'already symlink'
		return 0
	fi

	ln -s ./vim/vimrc $vimrc
}

set_bashrc()
{
	bashrc='~/.bashrc'
	if [ -e $bashrc -a ! -L $bashrc ]
	then
		echo 'mv bashrc'
		mv $bashrc ~/.bashrc_bu
	elif [ -L $bashrc ]
	then
		echo 'already symlink'
		return 0
	fi

	ln -s ./sh/bash/bashrc $bashrc
}

set_zshrc()
{
	zshrc='~/.zshrc'
	if [ -e $zshrc -a ! -L $zshrc ]
	then
		echo 'mv zshrc'
		mv $zshrc ~/.zshrc_bu
	elif [ -L $zshrc ]
	then
		echo 'already symlink'
		return 0
	fi

	ln -s ./sh/zsh/zshrc $zshrc
}
set_vimrc
set_bashrc
