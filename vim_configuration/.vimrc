""""""""""""""""""""""""
"Personal configuration"
""""""""""""""""""""""""
"Remove consistency of vi"
set nocompatible
set number "Display row number"
"Hide rolling"    
set guioptions-=r 
set guioptions-=L
set guioptions-=b
set showtabline=0 "Hide top bar"
set guifont=Monaco:h13  "Set font"  
syntax on   "syntax highlight"
set background=dark     "ÉèÖÃ±³¾°É«"
colorscheme space-vim-dark
"change comment color"
"highlight Comment ctermfg=green guifg=green
set nowrap  "Don't hide lines automatically
set fileformat=unix "Save file in unix format
set cindent     "ÉèÖÃCÑùÊ½µÄËõ½ø¸ñÊ½"
set autoindent
set showmatch   "Show the matching pairs
set scrolloff=5     "
set laststatus=2    "Set commad line as two lines"
set fenc=utf-8      "Unicode"
set backspace=2
set mouse=a     "Use mouse
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
"set ignorecase      "ignore Caps lock"""
set incsearch
set hlsearch        "Highlight the searching item"
set noexpandtab     "Prohibit extend table"
set whichwrap+=<,>,h,l
set autoread
set cursorline      "Highlight current row"
"set cursorcolumn        "Highlight current column""


""""""""""""""""""""""""
"Python setting"
""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""
"Python setting"
""""""""""""""""""""""""
au BufNewFile,BufRead *.py
\set tabstop=4
\set softtabstop=4
\set shiftwidth=4
\set textwidth=100
\set expandtab


"""""""""""""""""""""
"Vundle"
"""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'tell-k/vim-autopep8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'Raimondi/delimitMate'
call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""
"NERDTree"
""""""""""""""""""""""""""
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
map <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""
"YouCompleteMe Setting"
""""""""""""""""""""""""""
"Set ycm_extra_conf path"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"Do not ask whether loading ycm_extra_conf automatically again"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"Set python interpreter"
let g:ycm_path_to_python_interpreter='/usr/bin/python'
"Set open auto-completer"
let g:ycm_seed_identifiers_with_syntax=1
"Set open auto-completer in comments"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"Set the number of characters for situation beginning auto-complete"
let g:ycm_min_num_of_chars_for_completion=2
"Set closing window automatically after auto-complete"
let g:ycm_autoclose_preview_window_after_completion=1
"Forbid cache"
let g:ycm_cache_omnifunc=0
"Set open auto-complete in strings"
let g:ycm_complete_in_strings = 1
"Set closing window automatically after leaving insert mode"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif



""""""""""""""""""""""""""
"Set keyboard shortcuts"
"""""""""""""""""""""
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>


