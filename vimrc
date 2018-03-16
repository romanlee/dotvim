" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

" Using nice plugin manager - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'kien/ctrlp.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'scrooloose/nerdcommenter'
" Plug 'valloric/youcompleteme'
" Plug 'yuttie/comfortable-motion.vim'
" if has('nvim')
"  Plug 'shougo/deoplete.nvim', { 'do': ':updateremoteplugins' }
" else
"  Plug 'shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
Plug 'vim-airline/vim-airline'
Plug 'roxma/nvim-completion-manager'

call plug#end()

"----------REMAPPINGS----------"
let mapleader=','
" fzf remappings
nnoremap <leader>t :Tags<cr>
nnoremap <leader>f :Files<cr>
nnoremap ;         :Buffer<cr>
" other 
" map <C-c> "+y<CR>
nnoremap <leader>q :quit<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>noh :noh<cr>
nnoremap <leader>bd :bd<cr>

"----------NERD COMMENTER----------"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

"----------EASYTAGS----------" 
" let g:easytags_file = '~/.vimtags'
set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_async = 1

"----------AIRLINE----------"
let g:airline#extensions#tabline#enabled = 1

"----------VIM----------"
filetype on
filetype plugin on
syntax on
colorscheme dracula
set background=dark
set number
set hidden
set history=100
set hlsearch
set backspace=indent,eol,start
" match ErrorMsg '\%>80v.\+'
set colorcolumn=80
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif
set mouse=a
