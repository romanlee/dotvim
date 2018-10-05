" vim: set foldmethod=marker foldlevel=0 nomodeline:

" DEFAULTz {{{
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

let s:darwin = has('mac')
" }}}

" VIM-PLUG INSTALLATION {{{

" using nice plugin manager - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'xolox/vim-misc'
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'yuttie/comfortable-motion.vim'
if has('nvim')
    "Plug 'roxma/nvim-completion-manager'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" statusline/tabline plugins
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'

" tags
Plug 'ludovicchabant/vim-gutentags'      " much better than vim-easytags

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
" Plug 'rking/ag.vim'

call plug#end()

" }}}

" PLUGIN CONFIG {{{

" Airline ----------------------------------------------------------------------
" let g:airline#extensions#tabline#enabled = 1
"   " to boost performance:
" let g:airline#extensions#whitespace#enabled=0

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Deoplete ---------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" NERDTree ---------------------------------------------------------------------
let NERDTreeShowHidden=1

" gitgutter --------------------------------------------------------------------
set updatetime=100

" comfortable-motion -----------------------------------------------------------
let g:comfortable_motion_no_default_key_mappings = 1

" }}}

" BASIC CONFIG {{{

filetype on
filetype plugin on

syntax on
color dracula

set number
set hidden
set history=100
set backspace=indent,eol,start
set colorcolumn=80
set mouse=a
set clipboard=unnamed
set cursorline
set guicursor+=a:blinkon1
" set lazyredraw                    " improves performance when scrolling (?)

" Searching
set hlsearch        " highlight found words in search
set ignorecase      " case of normal letter is ignored
set smartcase       " ignore case when lowercase letters only
set incsearch       " search as characters are entered

" some color shit
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

" using system clipboard on mac
set clipboard+=unnamedplus

" Python Language Settings -----------------------------------------------------
au BufRead,BufNewFile *.py
      \ set tabstop=4       " number of visual spaces per TAB
      \ set softtabstop=4   " number of spaces in tab when editing
      \ set shiftwidth=4    " number of spaces to use for indent

" Fortran Language Settings ----------------------------------------------------
autocmd FileType *.f03
      \ let fortran_free_source=1 |   " force free source
      \ let fortran_dialect = "f08"   " use modern fortran for Fortran 03 files

" }}}

" KEYMAPS {{{

let mapleader=','

" copying/pasting
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" moving around in text
nnoremap <C-h> <Home>
nnoremap <C-l> <End>
inoremap <C-h> <Home>
inoremap <C-l> <End>
vnoremap <C-h> <Home>
vnoremap <C-l> <End>

" windows and buffers and stuff
nnoremap <leader>q  :bp\|bd # <cr>
nnoremap <leader>w  :w<cr>
nnoremap <leader>W  :wa<cr>
nnoremap <leader>wq :wq<cr>
" move between tabs
nnoremap <S-Tab>    :bp<cr>
nnoremap <Tab>      :bn<cr>
" move between split panes
nnoremap <S-h>      <C-W>h
nnoremap <S-l>      <C-W>l

" FZF
nnoremap <leader>t :Tags<cr>
nnoremap <leader>f :Files<cr>
nnoremap ;         :Buffer<cr>
nnoremap <leader>a :Ag<cr>

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<cr>

" Searching
nnoremap <space>         /
nnoremap <leader><space> :nohlsearch<CR>

" Folding
nnoremap <CR> za

" scrolling through the popup menu with Alt-j/k
inoremap <expr> <Tab>     pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab>   pumvisible() ? "\<C-p>" : "\<S-Tab>"

" sourcing vimrc
map <leader>s :source ~/.vimrc<CR>

" tab section of code
" xnoremap <Tab> >
" xnoremap <S-Tab> <
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" vim-commentary
"function! UnmapCommentary()
"  unmap gc
"  nunmap gcc
"  nunmap cgc
"  nunmap gcu
"endfunction
" function UnmapCommentary()
"   unmap gc
"   nunmap gcc
" "  nunmap cgc
" "  nunmap gcu
" endfunction

"autocmd VimEnter * call UnmapCommentary()

" xmap <leader>c  <Plug>Commentary
" nmap <leader>c  <Plug>Commentary
" omap <leader>c  <Plug>Commentary
" nmap <leader>cc <Plug>CommentaryLine
" nmap l<leader>c <Plug>ChangeCommentary
" nmap <leader>cu <Plug>Commentary<Plug>Commentary

" augroup bepo_clash
"   autocmd!
"   autocmd VimEnter * call UnmapCommentary()
" augroup END

nmap <leader>c <Plug>Commentary
xmap <leader>c <Plug>Commentary
omap <leader>c <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine

" }}}
