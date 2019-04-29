call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'jumski/vim-colors-solarized' "altercation column sign fix
" Plug 'itchyny/vim-haskell-indent'
" Plug 'dag/vim2hs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim'
" Plug 'bitc/vim-hdevtools'
" Plug 'alx741/vim-hindent'
" Plug 'gilligan/vim-textobj-haskell'
" Plug 'iamcco/markdown-preview.vim'
call plug#end()

colorscheme solarized
filetype plugin on
filetype indent on
syntax on
