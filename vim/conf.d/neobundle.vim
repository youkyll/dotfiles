if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/dotfiles/vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/vim/bundle/'))

if neobundle#load_cache()
  NeoBundleFetch 'Shougo/neobundle.vim'

  call neobundle#load_toml('~/dotfiles/vim/neobundle.toml')
  NeoBundleSaveCache
endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
