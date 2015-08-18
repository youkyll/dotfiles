#!/bin/sh

if path=`which zsh`;then
	rs=`chsh -s $path 2>&1`
	
	if echo $rs|grep -q ypchsh;then
		ypchsh -s $path
	fi
	if $?;then
		echo 'change sh'
	fi
else
	echo 'zsh is not found'
fi
