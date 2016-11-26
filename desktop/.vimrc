set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'jumski/vim-colors-solarized' "altercation column sign fix
Plugin 'jplaut/vim-arduino-ino'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
Plugin 'itchyny/vim-haskell-indent'
Plugin 'dag/vim2hs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'neomake/neomake'
Plugin 'Shougo/deoplete.nvim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
Plugin 'bitc/vim-hdevtools'
"Plugin 'flazz/vim-colorschemes'

call vundle#end()            " required
filetype plugin indent on    " required

"GLOBAL REMAPPING
"Syntastic remapping
nnoremap <C-p> :nohlsearch <Cr>
nnoremap <F6> :SyntasticToggleMode <bar> w <Cr>
nnoremap <C-l> gt 
nnoremap <C-h> gT 
autocmd FileType haskell nmap <C-c><C-f> :GhciFile<Cr> 
autocmd FileType java setlocal omnifunc=javacomplete#Complete


let g:neomake_error_sign = {'text': '✖', 'texthl': 'FoldColumn'}
let g:neomake_warning_sign = {'text': '➤', 'texthl': 'FoldColumn'}
let g:neomake_message_sign = {'text': 'M', 'texthl': 'FoldColumn'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'FoldColumn'}
let g:deoplete#enable_at_startup = 1

" Neomake asynchronous linting
" Trigger neomake whenever text is changed in normal mode, leaving insert
" mode or not pressing any key for 'updatetime' ms while in insert mode
autocmd TextChanged,InsertLeave,CursorHoldI *.java,*.hs,*.c update | Neomake

set updatetime=1500 "wait 1.5 second of inactivity before checking for errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set encoding=utf-8
set nofoldenable "Disable folding altogether

"decrease time-out
set ttimeout
set ttimeoutlen=30
"decrease drawing time
set ttyfast
set lazyredraw

let g:haskell_conceal_enumerations = 0 "Disable enumeration folding in haskell's plugin vim2hs
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] } "Disable syntastic by default
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

"Haskell
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround
"Haskell

"vim-airline always visible
set laststatus=2
"set shiftwidth=2
"set softtabstop=2

colorscheme solarized
syntax on
filetype plugin on
filetype indent on
set incsearch " show search matches as you type
set smartindent
set t_Co=16
set number
set background=dark 
set omnifunc=syntaxcomplete#Complete
set cursorline
set colorcolumn=80
