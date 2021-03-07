#/bin/sh
# Set up file

DOTPATH=~/dotfiles
GITHUB_URL=https://github.com/youkyll/dotfiles.git

is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

has() {
    is_exists "$@"
}

die() {
  echo "$1"
  exit "${2:-1}"
}


# exec

# install
if has "git"; then
  git clone --recursive "$GITHUB_URL" "$DOTPATH"
else
  die 'Required git'
fi


# symlink
cd $DOTPATH/dots
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi


for f in .??*
do
  ln -snfv "$DOTPATH/dots/$f" "$HOME/$f"
done

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# re login
exec $SHELL -l
