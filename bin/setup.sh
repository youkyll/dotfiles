#/bin/sh

set_vimrc()
{
	vimrc="$HOME/.vimrc"
	if [ -e $vimrc -a ! -L $vimrc ]
	then
		echo 'mv vimrc'
		mv ${vimrc} ~/.vimrc_bu
	elif [ -L $vimrc ]
	then
		echo 'already symlink'
		return 0
	fi

	ln -s $HOME/dotfiles/vim/vimrc $vimrc
}

set_bashrc()
{
	bashrc="$HOME/.bashrc"
	if [ -e $bashrc -a ! -L $bashrc ]
	then
		echo 'mv bashrc'
		mv $bashrc ~/.bashrc_bu
	elif [ -L $bashrc ]
	then
		echo 'already symlink'
		return 0
	fi

	ln -s $HOME/dotfiles/sh/bash/bashrc $bashrc
}

set_zshrc()
{
	zshrc="$HOME/.zshrc"
	if [ -e $zshrc -a ! -L $zshrc ]
	then
		echo 'mv zshrc'
		mv $zshrc ~/.zshrc_bu
	elif [ -L $zshrc ]
	then
		echo 'already symlink'
		return 0
	fi

	ln -s $HOME/dotfiles/sh/zsh/zshrc $zshrc
}

set_vimrc
set_bashrc
set_zshrc
