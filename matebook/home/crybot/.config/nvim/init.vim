lua vim.loader.enable()

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex'
Plug 'maxmx03/solarized.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'DanilaMihailov/beacon.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'goolord/alpha-nvim'

" Autocompletion plugins
Plug 'hrsh7th/nvim-cmp'             " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp'         " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'           " Buffer completions
Plug 'hrsh7th/cmp-path'             " Path completions
Plug 'hrsh7th/cmp-cmdline'          " Command line completions
Plug 'saadparwaiz1/cmp_luasnip'     " Snippet completions
Plug 'L3MON4D3/LuaSnip'             " Snippet engine
Plug 'neovim/nvim-lspconfig'        " LSP configurations

" Plug 'neomake/neomake'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" au BufRead,BufNewFile *.tex setlocal textwidth=79

" let g:airline_theme = 'catppuccin'
" let g:airline_powerline_fonts = 1
" let g:airline_extensions = []
" let g:airline_highlighting_cache = 1

let g:deoplete#enable_at_startup = 1

" Neomake
" let g:neomake_error_sign = {'text': '✖', 'texthl': 'FoldColumn'}
" let g:neomake_warning_sign = {'text': '➤', 'texthl': 'FoldColumn'}
" let g:neomake_message_sign = {'text': 'M', 'texthl': 'FoldColumn'}
" let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'FoldColumn'}
" 
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_jsx_enabled_makers = ['eslint']


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
    -- disabled_filetypes = { 'NvimTree' }
  },
  sections = {
    lualine_a = {
      function() return '' end, 'mode'
    },
    lualine_b = {'branch'},
    lualine_c = {
      {'filename', path = 1}, -- Shows file and folder
    },
    lualine_x = {'diagnostics', 'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  }
}
EOF

lua require('beacon').setup()

set mousemoveevent
set termguicolors
lua << EOF
require("bufferline").setup{
        options = {
            mode = "tabs",
            themable = true,
            separator_style = "slant",
            indicator = {
                icon = 'O', -- this should be omitted if indicator style is not 'icon'
                style = 'icon'
            },
        }
    }
EOF


lua << EOF
  local startify = require('alpha.themes.startify')
  startify.file_icons.provider = "devicons"
  require('alpha').setup(startify.config)
EOF


" Setup nvim-cmp
"
lua << EOF
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Expand snippets
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
 mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },   -- LSP source
    { name = 'luasnip' },    -- Snippet source
  }, {
    { name = 'buffer' },     -- Buffer source
  })
})
EOF

" LSP Configuration
"
lua << EOF
local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.pyright.setup {
  capabilities = capabilities,
}
EOF
