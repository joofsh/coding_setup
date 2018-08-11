filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hdima/python-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'suan/vim-instant-markdown'
Plugin 'andymass/vim-matchup'
Plugin 'groenewege/vim-less'
Plugin 'sjl/gundo.vim'
Plugin 'nvie/vim-flake8'

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
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

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


" move where backup files get saved to avoid conflicts
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

" cntrl P settings
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 10000
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" nerd commenter
let g:NERDSpaceDelims = 1
map <Space> <Leader>

" vim jsx
let g:jsx_ext_required = 0

" Support python 4 spaces
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" Matchit
let g:matchup_matchparen_enabled = 0


" pry support
" imap bpry<Tab> require'pry';binding.pry<ESC>
