call plug#begin(stdpath('data') . '/plugged')
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

" Remember to install nerd-patched font
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'numToStr/Comment.nvim'

Plug 'altercation/vim-colors-solarized'


Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" begin autocompletion support
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" end autocompletion support

" support quick-placing pry bindings
Plug 'BlakeWilliams/vim-pry'

" Prettier linter/fixer
Plug 'dense-analysis/ale'

" markdown
Plug 'suan/vim-instant-markdown'

Plug 'mxw/vim-jsx'
call plug#end()


lua << END
-- I'm going to try to use lua for config as much as possible...

-- this doesn't work atm
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
      "--hidden",
      "--glob=!.git/",
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
      "log/*",
      "sorbet/*",
    }
  },

  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override generic sorter
      override_file_sorter = true,    -- override file sorter
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

" configure vim search
set ignorecase
set smartcase


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
