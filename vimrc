" vim: set foldmethod=marker foldlevel=0 nomodeline:

" DEFAULTz {{{
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

let s:darwin = has('mac')
" }}}

" VIM-PLUG INSTALLATION {{{

" Using nice plugin manager - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdcommenter'
" Plug 'yuttie/comfortable-motion.vim'
if has('nvim')
    "Plug 'roxma/nvim-completion-manager'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'vim-airline/vim-airline'
Plug 'roxma/nvim-completion-manager'
Plug 'ludovicchabant/vim-gutentags'      " much better than vim-easytags

call plug#end()

" }}}

" PLUGIN CONFIG {{{

" NERDCommenter-----------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Airline
" --------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1

"nvim-completion-manager--------------------------------------------------------
" let g:cm_auto_popup = 1

"Deoplete-----------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

"NERDTree-----------------------------------------------------------------------
let NERDTreeShowHidden=1

" }}}

" BASIC CONFIG {{{

filetype on
filetype plugin on

syntax on
color dracula

set number
set hidden
set history=100
set hlsearch                   " highlight found words in search
set backspace=indent,eol,start
set colorcolumn=80
set mouse=a
set clipboard=unnamed
set cursorline
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

hi Pmenu    guifg=#f8f8f2 guibg=#646e96
hi PmenuSel guifg=#282a36 guibg=#50fa7b

" Spaces and Tabs
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for indent
set expandtab       " tabs are spaces
set autoindent      " automatically ident

" Reomve white space upon save
autocmd BufWritePre * :%s/\s\+$//e


" }}}

" KEYMAPS {{{

let mapleader=','

" copying/pasting
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
" moving around
nnoremap <C-h> <Home>
nnoremap <C-l> <End>
inoremap <C-h> <Home>
inoremap <C-l> <End>
" windows and buffers and stuff
nnoremap <leader>q  :quit<cr>
nnoremap <leader>w  :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <S-Tab>    :bp<cr>
nnoremap <Tab>      :bn<cr>
nnoremap <Esc>      <Nop>

" FZF
nnoremap <leader>t :Tags<cr>
nnoremap <leader>f :Files<cr>
nnoremap ;         :Buffer<cr>

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<cr>

" Searching
nnoremap <space>          /
nnoremap <leader><space> :nohlsearch<CR>

" Folding
nnoremap <F9> za

" scrolling through the popup menu with Alt-j/k
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" }}}
