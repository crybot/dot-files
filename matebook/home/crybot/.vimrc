call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'jumski/vim-colors-solarized' "altercation column sign fix
Plug 'itchyny/vim-haskell-indent'
" Plug 'dag/vim2hs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'bitc/vim-hdevtools'
Plug 'alx741/vim-hindent'
" Plug 'gilligan/vim-textobj-haskell'
" Plug 'iamcco/markdown-preview.vim'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'zchee/deoplete-jedi'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'

call plug#end()

au BufRead,BufNewFile *.tex setlocal textwidth=79

let g:deoplete#enable_at_startup = 1

" Neomake asynchronous linting
" Trigger neomake whenever text is changed in normal mode, leaving insert
" mode or not pressing any key for 'updatetime' ms while in insert mode
autocmd TextChanged,InsertLeave,CursorHoldI *.java,*.hs,*.c,*.tex update | Neomake
set updatetime=1500 "wait 1.5 second of inactivity before checking for errors

" REMAPPINGS
nnoremap <C-l> gt 
nnoremap <C-h> gT 
nnoremap <C-p> :nohlsearch <Cr>
tnoremap <Esc> <C-\><C-n> 
tmap <C-l> <Esc>gt
tmap <C-h> <Esc>gT

colorscheme solarized
filetype plugin on
filetype indent on
syntax on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set nofixendofline " disable automatic newline at end of file
set t_Co=16
set number
set omnifunc=syntaxcomplete#Complete
set cursorline
set colorcolumn=80
