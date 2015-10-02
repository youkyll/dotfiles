" ----------------------------
" Basic
" ----------------------------

filetype plugin indent on
" 見やすくシンタックス
syntax enable

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
nnoremap <silent> <Space>f :<C-u>VimFilerCurrentDir -no-focus -split -simple -winwidth=25 -toggle -no-quit<CR>

" ----------------------------
" Plugin Mapping
" ----------------------------
"" Vim 起動時 vim-indent-guides を自動起動
"let g:indent_guides_enable_on_vim_startup=1
"" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=2
"" 自動カラー無効
"let g:indent_guides_auto_colors=0
"" 奇数番目のインデントの色
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#444433 ctermbg=black
"" 偶数番目のインデントの色
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
" ガイドの幅
"let g:indent_guides_guide_size = 1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


" ----------------------------
" Plugin NeoBundle
" ----------------------------

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/dotfiles/vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/dotfiles/vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ----------------------------
" NeoBundle Package
" ----------------------------
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'itchyny/lightline.vim'
" File編集履歴管理
NeoBundle 'Shougo/neomru.vim'
" Fileのツリー表示
NeoBundle 'Shougo/vimfiler'
" ag検索
NeoBundle 'rking/ag.vim'

NeoBundle 'kana/vim-submode'

"" Custom bundles

"" Javascript Bundle
NeoBundle "scrooloose/syntastic"


"" HTML Bundle
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'tpope/vim-haml'
NeoBundle 'mattn/emmet-vim'


NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'carlosgaldino/elixir-snippets'


"" Go Lang Bundle
NeoBundle "majutsushi/tagbar"
NeoBundle "fatih/vim-go"


"" PHP Bundle
NeoBundle 'arnaud-lb/vim-php-namespace'


"" Ruby Bundle
NeoBundle "tpope/vim-rails"
NeoBundle "tpope/vim-rake"
NeoBundle "tpope/vim-projectionist"
NeoBundle "thoughtbot/vim-rspec"
NeoBundle "ecomba/vim-ruby-refactoring"



"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
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
