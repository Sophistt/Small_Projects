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
set cursorcolumn    "Highlight current column"
set showcmd

" Set Syntax highlight
syntax on   "syntax highlight"
filetype plugin indent on
let python_highlight_all = 1
" Set Syntax colorscheme
set background=dark     
colorscheme space-vim-theme
hi Comment cterm=italic
"change comment color"
"highlight Comment ctermfg=green guifg=green

""""""""""""""""""""""""
"Hotkeys remapping"
""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""
"File setting"
""""""""""""""""""""""""

"Python setting
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=100 expandtab autoindent

"Java setting
au BufNewFile,BufRead *.java set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=100 expandtab

"C setting
au BufNewFile,BufRead *.cpp,*.c,*.h set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=100 expandtab

"Ros launch setting
au BufNewFile,BufRead *.launch set syntax=xml tabstop=4 softtabstop=4 shiftwidth=4 expandtab


""""""""""""""""""""""""
"Auto insert title"
""""""""""""""""""""""""
autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()" 

" Title function 
func SetTitle()
	call SetComment()
	if expand("%:e") == 'hpp' 
		call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H") 
		call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H") 
		call append(line(".")+12, "#ifdef __cplusplus") 
		call append(line(".")+13, "extern \"C\"") 
		call append(line(".")+14, "{") 
		call append(line(".")+15, "#endif") 
		call append(line(".")+16, "") 
		call append(line(".")+17, "#ifdef __cplusplus") 
		call append(line(".")+18, "}") 
		call append(line(".")+19, "#endif") 
		call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H") 
 
	elseif expand("%:e") == 'h' 
	  	call append(line(".")+10, "#pragma once") 
	elseif expand("%:e") == 'c' 
	  	call append(line(".")+10,"#include \"".expand("%:t:r").".h\"") 
	elseif expand("%:e") == 'cpp' 
	  	call append(line(".")+10, "#include \"".expand("%:t:r").".h\"") 
	endif
endfunc

" Comment function 
func SetComment()
	call setline(1,"/*================================================================") 
	call append(line("."),   "*   Copyright (C) ".strftime("%Y")." Sangfor Ltd. All rights reserved.")
	call append(line(".")+1, "*   ") 
	call append(line(".")+2, "*   @file:" .expand("%:t")) 
	call append(line(".")+3, "*   @author: Sophistt")
	call append(line(".")+4, "*   @date:" .strftime("%Y-%m-%d %H:%M")) 
	call append(line(".")+5, "*   @description: ") 
	call append(line(".")+6, "*")
	call append(line(".")+7, "================================================================*/") 
	call append(line(".")+8, "")
	call append(line(".")+9, "")
endfunc

" Insert title for *.sh file
autocmd BufNewFile *.sh call AddFileInformation_sh()
function AddFileInformation_sh()
      let infor = "#!/bin/bash\n"
      \."\n"
      \."# ***************************************************************************\n"
      \."# * @Copyright (c)  all right reserved \n"
      \."# * \n"
      \."# * @file:".expand("%")." \n"
      \."# * @author: Sophistt \n"
      \."# * @date:".strftime("%Y-%m-%d %H:%M")." \n"
      \."# * @description: Shell script \n"
      \."#* \n"
      \."#**************************************************************************/ \n"
      \."\n"
      \."\n"
      \."\n"
      \."\n"
      \."exit 0"
      silent  put! =infor
endfunction

" Insert title for *.py file
autocmd BufNewFile *.py call AddFileInformation_py()
function AddFileInformation_py()
      let infor = "#!/home/wcy/software/miniconda3/envs/py3.6/bin/python3\n"
      \."# -*- coding: utf-8 -*-\n"
      \."\n"
      \."\"\"\"\n"
      \."* @Copyright (c)  all right reserved\n"
      \."* \n"
      \."* @file:".expand("%")."\n"
      \."* @author: Sophistt\n"
      \."* @date:".strftime("%Y-%m-%d %H:%M")."\n"
      \."* @description: Python file\n"
      \."\"\"\"\n"
      \."\n"
      \."\n"
      silent  put! =infor
endfunction

" Insert title for post
autocmd BufNewFile *-*-*-*.md call AddFileInformation_md()
function AddFileInformation_md()
	let infor = "---\n"
	\."layout: post\n"
	\."title: \"\"\n"
	\."date: ".strftime("%Y-%m-%d")." \n"
	\."mathjax: true\n"
	\."catalog: true\n"
	\."categories: []\n"
	\."tags: []\n"
	\."icon: \n"
	\."---\n"
	\."\n"
	silent  put! =infor
endfunction


""""""""""""""""""""
"Vundle"
"""""""""""""""""""""
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
Plugin 'mileszs/ack.vim'
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

"YouCompleteMe Hotkeys remapping
nnoremap gl :YcmCompleter GoToDeclaration<CR>
nnoremap gk :YcmCompleter GoToDefinition<CR>


"""""""""""""""""""""
"Set keyboard shortcuts"
"""""""""""""""""""""
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>


"""""""""""""""""""""
"Ack.vim"
"""""""""""""""""""""
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

