set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set encoding=utf-8

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" remember to install camlp4 to get ocaml syntax checking working
let g:syntastic_ocaml_use_ocamlbuild = 1
let g:airline_powerline_fonts = 1
let g:solarized_bold=1
let g:vim_arduino_map_keys = 1

set laststatus=2
set shiftwidth=2
set softtabstop=2
filetype indent on
set smartindent
set t_Co=16
syntax on
set number
set background=dark " dark | light "
colorscheme solarized
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set cursorline
set colorcolumn=80
"set rtp+=/home/crybot/.vim/bundle/ocp-indent-vim
set rtp^=/home/crybot/.opam/4.02.3/share/ocp-indent/vim
