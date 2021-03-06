"dein
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
 
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
 
" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
 
    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
 
    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
 
    " 設定終了
    call dein#end()
    call dein#save_state()
endif
 
" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif

set nowrap
set noswapfile
set ruler
set cmdheight=2
set wildmenu
set smartcase
set list
set tabstop=4
set autoindent
set expandtab
set listchars=eol:<
set shiftwidth=4
set number
set showmatch
set smarttab
set hlsearch
set backspace=indent,eol,start
set nobackup
autocmd FileType text setlocal textwidth=0
filetype plugin on
syntax on
call dein#source('molokai')
colorscheme molokai

set clipboard=unnamed,autoselect
