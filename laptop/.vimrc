set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'scrooloose/syntastic'
"Plugin 'jplaut/vim-arduino-ino'
"Plugin 'tpope/vim-rails'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'JamshedVesuna/vim-markdown-preview'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
Plugin 'scrooloose/nerdtree'
Plugin 'kana/vim-textobj-user'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jumski/vim-colors-solarized' "altercation column sign fix
Plugin 'itchyny/vim-haskell-indent'
Plugin 'dag/vim2hs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'neomake/neomake'
Plugin 'Shougo/deoplete.nvim'
Plugin 'bitc/vim-hdevtools'
Plugin 'alx741/vim-hindent'
Plugin 'gilligan/vim-textobj-haskell'
Plugin 'iamcco/markdown-preview.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"GLOBAL REMAPPINGS
"Syntastic remapping
nnoremap <C-p> :nohlsearch <Cr>
nnoremap <F6> :SyntasticToggleMode <bar> w <Cr>
nnoremap <C-l> gt 
nnoremap <C-h> gT 
tmap <C-l> <Esc>gt 
tmap <C-h> <Esc>gT 
tnoremap <Esc> <C-\><C-n> 


"Filetype detectio
augroup filetypedetect 
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
  au! BufRead,BufNewFile *.hs set filetype=haskell
augroup END

"format haskell files using hindent
"TODO: move this mapping to filetype specific subdirectory
"I chose to visually select the range of the code to format in order to show 
"how the textobject for haskell works (it gives a nice visual clue)
autocmd FileType haskell map == vih:call hindent#Hindent()<CR>
autocmd FileType haskell map =G :call hindent#Hindent()<CR>
"autocmd FileType haskell nmap <C-c><C-f> :GhciFile<Cr> 
"autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Neomake asynchronous linting
" Trigger neomake whenever text is changed in normal mode, leaving insert
" mode or not pressing any key for 'updatetime' ms while in insert mode
"autocmd TextChanged,InsertLeave,CursorHoldI *.java,*.hs,*.h,*.hpp,*.c,*.cpp,*.py update | Neomake
autocmd TextChanged,InsertLeave,CursorHoldI *.hs,*.h,*.hpp,*.c,*.cpp,*.py update | Neomake

let g:neomake_error_sign = {'text': '✖', 'texthl': 'FoldColumn'}
let g:neomake_warning_sign = {'text': '➤', 'texthl': 'FoldColumn'}
let g:neomake_message_sign = {'text': 'M', 'texthl': 'FoldColumn'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'FoldColumn'}
let g:neomake_python_enabled_makers = ['pylint']
let g:deoplete#enable_at_startup = 1
let g:haskell_conceal_enumerations = 0 "Disable enumeration folding in haskell's plugin vim2hs
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] } "Disable syntastic by default
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:airline_powerline_fonts = 1
let g:solarized_bold=1
let g:vim_arduino_map_keys = 1
let g:hindent_on_save = 0
let g:hindent_indent_size = 2


set updatetime=1500 "wait 1.5 second of inactivity before checking for errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set encoding=utf-8
set nofoldenable "Disable folding altogether
set ttimeout
set ttimeoutlen=30
set ttyfast
"set lazyredraw
"Haskell
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround
"Haskell
set laststatus=2
set incsearch " show search matches as you type
set smartindent
set t_Co=16
set number
set background=dark 
set omnifunc=syntaxcomplete#Complete
set cursorline
set colorcolumn=80

colorscheme solarized
filetype plugin on
filetype indent on
syntax on

