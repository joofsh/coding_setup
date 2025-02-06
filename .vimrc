filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hdima/python-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'suan/vim-instant-markdown'
Plugin 'andymass/vim-matchup'
Plugin 'groenewege/vim-less'
Plugin 'sjl/gundo.vim'
Plugin 'nvie/vim-flake8'
Plugin 'w0rp/ale'
Plugin 'janko-m/vim-test'
Plugin 'chrisbra/Colorizer'
Plugin 'mechatroner/rainbow_csv'
Plugin 'BlakeWilliams/vim-pry'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-telescope/telescope-fzf-native.nvim'

" ruby & rails plugins
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'

"Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
filetype plugin on

" solarized 
syntax on
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

nnoremap <F1> :w<CR>
inoremap <F1> <esc>:w<CR>
vmap <F1> :w<CR>

" Saving with F1
nnoremap <F1> :w<CR>
inoremap <F1> <esc>:w<CR>
vmap <F1> :w<CR>

" easier up and down screening
nnoremap <c-k> <c-u>
nnoremap <c-j> <c-d>


" highlight search results
set hlsearch


" reduce escape slowness
set timeoutlen=1000 ttimeoutlen=0

" remap leader to spacebar
":map <,> <leader>
"
" ctrlp options

" show file name in status line
set laststatus=2
set statusline=%f         " file name
set statusline+=%=       " Switch to the right side
set statusline+=%c,
set statusline+=%2l        " Current line
set statusline+=/%L        " Current line

" Use spaces instead of tabs (tab key)
set expandtab
set shiftwidth=2
set softtabstop=2

" configure vim search
set ignorecase
set smartcase

" Add support for backspace key
set backspace=indent,eol,start

" move where backup files get saved to avoid conflicts
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

" telescope settings
nmap <C-P> <cmd>Telescope find_files<cr>


" cntrl P settings
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/public/*,*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*

let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 10000
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" nerd commenter
let g:NERDSpaceDelims = 1
map <Space> <Leader>

" vim jsx
let g:jsx_ext_required = 0

" Support python 4 spaces
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" Matchit
let g:matchup_matchparen_enabled = 0

" line numbers
set number

" debugger support
nmap <leader>d :call pry#insert()<cr>

" React support
imap dbg<Tab> debugger //eslint-disable-line<ESC>


" save using tab
map <Leader><Tab> :w<return>


"reset vim to just the root directory (if too many tabs open)
" can run it by typing `tc`
nnoremap tc :tabedit .<return>:tabo<return>

set mouse=nicr
