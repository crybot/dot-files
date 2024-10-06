call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex'
Plug 'maxmx03/solarized.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'DanilaMihailov/beacon.nvim'
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'bitc/vim-hdevtools'
" Plug 'alx741/vim-hindent'
" Plug 'gilligan/vim-textobj-haskell'
" Plug 'iamcco/markdown-preview.vim'
" Plug 'jumski/vim-colors-solarized' "altercation column sign fix
" Plug 'itchyny/vim-haskell-indent'
" Plug 'dag/vim2hs'
" Plug 'posva/vim-vue'
" Plug 'leafgarland/typescript-vim'
" Plug 'vhda/verilog_systemverilog.vim'
" Plug 'LaTeX-Box-Team/LaTeX-Box'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'MaxMEllon/vim-jsx-pretty'

"
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" au BufRead,BufNewFile *.tex setlocal textwidth=79

" let g:airline_theme = 'catppuccin'
" let g:airline_powerline_fonts = 1
" let g:airline_extensions = []
" let g:airline_highlighting_cache = 1

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

" VIMTEX SETTINGS

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'


" Neomake asynchronous linting
" Trigger neomake whenever text is changed in normal mode, leaving insert
" mode or not pressing any key for 'updatetime' ms while in insert mode
" autocmd TextChanged,InsertLeave,CursorHoldI *.js,*.css,*.java,*.hs,*.c,*.tex update | Neomake
" set updatetime=1500 "wait 1.5 second of inactivity before checking for errors

" REMAPPINGS
nnoremap <C-l> gt 
nnoremap <C-h> gT 
nnoremap <C-p> :nohlsearch <Cr>
tnoremap <Esc> <C-\><C-n> 
tmap <C-l> <Esc>gt
tmap <C-h> <Esc>gT
nnoremap <C-n> :NvimTreeToggle<CR>

" xnoremap i$ :<C-u> normal! T$vt$<CR>
" onoremap i$ :normal vi$<CR>
" xnoremap a$ :<C-u> normal!F$vf$<CR>
" onoremap a$ :normal va$<CR>


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
set clipboard=unnamedplus
set encoding=UTF-8
colorscheme catppuccin


lua require('nvim-web-devicons').setup { default = true }

lua << END
    -- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
END

lua << EOF
require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = { right = '', left = '' },
    -- component_separators = { right = '', left = '' },
    component_separators = { right = '', left = '' },
    icons_enabled = true,
  },
  sections = {
    lualine_a = {
      function() return '' end, 'mode'
    },
    lualine_b = {'branch'},
    lualine_c = {
      {'filename', path = 1}, -- Shows file and folder
    },
    lualine_x = {'diagnostics', 'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  }
}
EOF

lua require('beacon').setup()
