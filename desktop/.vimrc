set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'

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
let g:airline_powerline_fonts = 1
let g:solarized_bold=1
let g:vim_arduino_map_keys = 1

"Octave syntax 
augroup filetypedetect 
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END

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
