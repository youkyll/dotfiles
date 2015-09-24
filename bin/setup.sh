#/bin/sh
DOTPATH=~/dotfiles
GITHUB_URL=https://github.com/youkyll/dotfiles.git

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

is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

has() {
    is_exists "$@"
}


# exec

if has "git"; then
  git clone --recursive "$GITHUB_URL" "$DOTPATH"
fi

