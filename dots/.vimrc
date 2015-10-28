" ----------------------------
" Basic
" ----------------------------

filetype plugin indent on
" 見やすくシンタックス
syntax enable

let mapleader = "\<Space>"

" ----------------------------
" Rule
" ----------------------------

noremap ; :
noremap ; :

set backspace=eol,indent,start

" 色
if !has('gui_running')
  set t_Co=256
endif

" 行番号をつける :set nonuでなしに
set number
" スワップファイルを出力しない
set noswapfile
set nobackup

set showcmd
set shell=/bin/sh

"ビープ音などを無効
set visualbell t_vb=

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set showcmd

" 検索関連
set incsearch
set hlsearch
" 大小文字を区別しない
set ignorecase
set smartcase

" 不可視文字表示設定
set list
set listchars=tab:^\ ,trail:~

" string
set guifont=meiryo:h16:cSHIFTJIS
set encoding=utf-8
"set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set fenc=utf-8
set fileformats=unix,dos,mac

if has('win32')
  set termencoding=cp932
endif


" indent
set autoindent
set smartindent

" tab
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=0

" buffer
set hidden


" ----------------------------
" Mapping
" ----------------------------

" vimrcを編集しやすくするバインド
nnoremap <Space>.  :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

" ヘルプを呼びやすくするバインド
nnoremap <Space>h     :<C-u>help<Space>
nnoremap <Space>H :<C-u>help<Space><C-r><C-w><Enter>

" 移動
nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj
nnoremap gk  k
nnoremap gj  j
vnoremap gk  k
vnoremap gj  j

" ;と:を入れ替え
nnoremap ;  :
nnoremap :  ;
vnoremap ;  :
vnoremap :  ;

" 日付入力を簡単に
inoremap <expr> ,df strftime('%Y-%m-%dT%H:%%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')


" ノーマルモードで空行を入れる
nnoremap <NL>  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Enter>  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

" tab
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" ----------------------------
" Command
" ----------------------------

command! Utf8 edit ++enc=utf-8
command! Sjis edit ++enc=Sjis

" ----------------------------
" Environment
" ----------------------------

"クリップボード使用
set clipboard=unnamed,unnamedplus
" OSのクリップボードを使用する
set clipboard=unnamed
" 挿入モードでCtrl+vを押すとクリップボードの内容を貼り付け
imap <C-v> <ESC>"*pa

" ----------------------------
" netrw.vim
" ----------------------------

" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1


" ----------------------------
" vimfiler
" ----------------------------

let g:vimfiler_as_default_explorer = 1
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
" space fでvimfilerをトグル
nnoremap <silent> <Space>f :<C-u>VimFilerCurrentDir -no-focus -split -simple -winwidth=25 -toggle -no-quit<CR>

" ----------------------------
" Plugin Mapping
" ----------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

"ag search binding
" --- type ° to search the word in all files in the current dir
nnoremap <space>A :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>a :Ag! 

" ----------------------------
" Plugin NeoBundle
" ----------------------------

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/dotfiles/vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/vim/bundle/'))

if neobundle#load_cache()
  NeoBundleFetch 'Shougo/neobundle.vim'

  call neobundle#load_toml('~/dotfiles/vim/neobundle.toml', {'lazy': 1})
  NeoBundleSaveCache
endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck


"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif



" window
call submode#enter_with('bufmove', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
