
" load settings
set runtimepath+=~/dotfiles/vim/
runtime! conf.d/*.vim

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
set expandtab
set softtabstop=4

" buffer
set hidden


" ----------------------------
" Mapping
" ----------------------------
" syntasticチェックをおこなう

nnoremap <Space>c :<C-u>SyntasticCheck<Enter>

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





"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
