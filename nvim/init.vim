"dein Scripts-----------------------------
if &compatible
	set nocompatible
endif

"# dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')

"# dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	"# dein.toml, dein_layz.tomlファイルのディレクトリをセット
	let s:toml_dir = expand('~/dotfiles/nvim')

	"# 起動時に読み込むプラグイン群
	call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

	"# 遅延読み込みしたいプラグイン群
	call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif
"End dein Scripts-------------------------

" mouse
set mouse=a

" colorscheme
colorscheme monokai

" Space Wide
setlocal expandtab
set ts=2 sw=2 sts=2 tw=0

" Display tab, white space, etc.
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" Displaying Line Number
" set number
set relativenumber

" syntax highlight
syntax on

" Encoding & ff
set encoding=utf-8
set ff=unix
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

" statusline
set laststatus=2

" Not yunk on pasting with visual mode
vnoremap p "_dP

" enable clipboard on windows WSL
if system('uname -a | grep Microsoft') != ""
	let g:clipboard = {
				\   'name': 'myClipboard',
				\   'copy': {
				\      '+': 'win32yank.exe -i',
				\      '*': 'win32yank.exe -i',
				\    },
				\   'paste': {
				\      '+': 'win32yank.exe -o',
				\      '*': 'win32yank.exe -o',
				\   },
				\   'cache_enabled': 1,
				\ }
endif

