call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jumski/vim-colors-solarized' "altercation column sign fix
Plug 'itchyny/vim-haskell-indent'
" Plug 'dag/vim2hs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'bitc/vim-hdevtools'
" Plug 'alx741/vim-hindent'
" Plug 'gilligan/vim-textobj-haskell'
" Plug 'iamcco/markdown-preview.vim'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'zchee/deoplete-jedi'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'dart-lang/dart-vim-plugin'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

call plug#end()

au BufRead,BufNewFile *.tex setlocal textwidth=79

let g:deoplete#enable_at_startup = 1

" Neomake
let g:neomake_error_sign = {'text': '✖', 'texthl': 'FoldColumn'}
let g:neomake_warning_sign = {'text': '➤', 'texthl': 'FoldColumn'}
let g:neomake_message_sign = {'text': 'M', 'texthl': 'FoldColumn'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'FoldColumn'}

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']


" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml*.jsx,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" Neomake asynchronous linting
" Trigger neomake whenever text is changed in normal mode, leaving insert
" mode or not pressing any key for 'updatetime' ms while in insert mode
autocmd TextChanged,InsertLeave,CursorHoldI *.js,*.css,*.java,*.hs,*.c,*.tex update | Neomake
" set updatetime=1500 "wait 1.5 second of inactivity before checking for errors

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
