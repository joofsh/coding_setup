call plug#begin(stdpath('data') . '/plugged')
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Remember to install nerd-patched font
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'numToStr/Comment.nvim'

Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'

Plug 'hashivim/vim-terraform'


Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" begin autocompletion support
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" end autocompletion support

" support quick-placing pry bindings
Plug 'BlakeWilliams/vim-pry'

" Prettier linter/fixer
" Plug 'dense-analysis/ale'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }


" markdown
Plug 'suan/vim-instant-markdown'

Plug 'mxw/vim-jsx'

" ruby & rails plugins
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

"colored CSV files
Plug 'mechatroner/rainbow_csv'

" React & typescript support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()


lua << END
-- I'm going to try to use lua for config as much as possible...

-- Old LSP with solargraph
-- require('lsp')  

-- require('autocompletion')

require('Comment').setup()
require('lualine').setup()

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--glob=!.git/",
      "-uu"
    },
    layout_config = {
      width = 0.75,
      preview_cutoff = 120,
      horizontal = {
        preview_width = function(_, cols, _)
          if cols < 120 then
            return math.floor(cols * 0.5)
          end
          return math.floor(cols * 0.6)
        end,
        mirror = false,
      },
      vertical = { mirror = false },
    },
    path_display = { shorten = 5 },
    file_ignore_patterns = {
      "node_modules",
      "vendor/*",
      "tmp/*",
      "^log/*",
      "data/backfill/*",
      "cover/*"
    }
  },
--  pickers = {
--    find_files = {
--      hidden=false
--    }
--  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = false, -- override generic sorter
      override_file_sorter = false,    -- override file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    }
  }

}

-- load fzf with telescope
require('telescope').load_extension('fzf')

vim.g.mapleader = ' '

vim.o.numberwidth = 5
vim.o.number = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.textwidth = 100
vim.o.colorcolumn = "+1"
vim.o.cursorline = false

vim.o.splitbelow = true -- open new vertical splits below the current
vim.o.splitright = true -- open new horizontal splits to the right of the current

END

" JSX files
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2

" configure vim search
set ignorecase
set smartcase

" Use spaces instead of tabs (tab key)
set expandtab
set shiftwidth=2
set softtabstop=2
 
colorscheme solarized
let g:solarized_termtrans = 1
set background=light

" save using tab
map <Leader><Tab> :w<return>

" debugger support
nmap <leader>d :call pry#insert()<cr>

" Telescope commands
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nmap <C-P> <cmd>Telescope find_files<cr>

"""" COC setup
let g:coc_global_extensions = ['coc-solargraph']

set nobackup
set nowritebackup
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

