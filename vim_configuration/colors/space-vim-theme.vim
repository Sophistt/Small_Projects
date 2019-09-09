" Name:         Space-vim theme
" Description:  Light and dark theme inspired by spacemacs-theme
" Author:       Liu-Cheng Xu <xuliuchengxlc@gmail.com>
" Maintainer:   Liu-Cheng Xu <xuliuchengxlc@gmail.com>
" Website:      https://github.com/liuchengxu/space-vim-theme
" License:      Vim License (see `:help license`)
" Last Updated: Mon 25 Mar 2019 05:22:40 PM CST

if !(has('termguicolors') && &termguicolors) && !has('gui_running')
      \ && (!exists('&t_Co') || &t_Co < 256)
  echoerr '[Space-vim theme] There are not enough colors.'
  finish
endif

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'space_vim_theme'

" refer to http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
let s:color256 = {
      \ 0 : '#000000',  1 : '#800000',  2 : '#008000',  3 : '#808000',  4 : '#000080',  5 : '#800080',  6 : '#008080' , 7 : '#c0c0c0',
      \ 8 : '#808080',  9 : '#ff0000', 10 : '#00ff00', 11 : '#ffff00', 12 : '#0000ff', 13 : '#ff00ff', 14 : '#00ffff', 15 : '#ffffff',
      \ 16 : '#000000',  17 : '#00005f',  18 : '#000087',  19 : '#0000af',  20 : '#0000d7',  21 : '#0000ff',
      \ 22 : '#005f00',  23 : '#005f5f',  24 : '#005f87',  25 : '#005faf',  26 : '#005fd7',  27 : '#005fff',
      \ 28 : '#008700',  29 : '#00875f',  30 : '#008787',  31 : '#0087af',  32 : '#0087d7',  33 : '#0087ff',
      \ 34 : '#00af00',  35 : '#00af5f',  36 : '#00af87',  37 : '#00afaf',  38 : '#00afd7',  39 : '#00afff',
      \ 40 : '#00d700',  41 : '#00d75f',  42 : '#00d787',  43 : '#00d7af',  44 : '#00d7d7',  45 : '#00d7ff',
      \ 46 : '#00ff00',  47 : '#00ff5f',  48 : '#00ff87',  49 : '#00ffaf',  50 : '#00ffd7',  51 : '#00ffff',
      \ 52 : '#5f0000',  53 : '#5f005f',  54 : '#5f0087',  55 : '#5f00af',  56 : '#5f00d7',  57 : '#5f00ff',
      \ 58 : '#5f5f00',  59 : '#5f5f5f',  60 : '#5f5f87',  61 : '#5f5faf',  62 : '#5f5fd7',  63 : '#5f5fff',
      \ 64 : '#5f8700',  65 : '#5f875f',  66 : '#5f8787',  67 : '#5f87af',  68 : '#5f87d7',  69 : '#5f87ff',
      \ 70 : '#5faf00',  71 : '#5faf5f',  72 : '#5faf87',  73 : '#5fafaf',  74 : '#5fafd7',  75 : '#5fafff',
      \ 76 : '#5fd700',  77 : '#5fd75f',  78 : '#5fd787',  79 : '#5fd7af',  80 : '#5fd7d7',  81 : '#5fd7ff',
      \ 82 : '#5fff00',  83 : '#5fff5f',  84 : '#5fff87',  85 : '#5fffaf',  86 : '#5fffd7',  87 : '#5fffff',
      \ 88 : '#870000',  89 : '#87005f',  90 : '#870087',  91 : '#8700af',  92 : '#8700d7',  93 : '#8700ff',
      \ 94 : '#875f00',  95 : '#875f5f',  96 : '#875f87',  97 : '#875faf',  98 : '#875fd7',  99 : '#875fff',
      \ 100 : '#878700', 101 : '#87875f', 102 : '#878787', 103 : '#8787af', 104 : '#8787d7', 105 : '#8787ff',
      \ 106 : '#87af00', 107 : '#87af5f', 108 : '#87af87', 109 : '#87afaf', 110 : '#87afd7', 111 : '#87afff',
      \ 112 : '#87d700', 113 : '#87d75f', 114 : '#87d787', 115 : '#87d7af', 116 : '#87d7d7', 117 : '#87d7ff',
      \ 118 : '#87ff00', 119 : '#87ff5f', 120 : '#87ff87', 121 : '#87ffaf', 122 : '#87ffd7', 123 : '#87ffff',
      \ 124 : '#af0000', 125 : '#af005f', 126 : '#af0087', 127 : '#af00af', 128 : '#af00d7', 129 : '#af00ff',
      \ 130 : '#af5f00', 131 : '#af5f5f', 132 : '#af5f87', 133 : '#af5faf', 134 : '#af5fd7', 135 : '#af5fff',
      \ 136 : '#af8700', 137 : '#af875f', 138 : '#af8787', 139 : '#af87af', 140 : '#af87d7', 141 : '#af87ff',
      \ 142 : '#afaf00', 143 : '#afaf5f', 144 : '#afaf87', 145 : '#afafaf', 146 : '#afafd7', 147 : '#afafff',
      \ 148 : '#afd700', 149 : '#afd75f', 150 : '#afd787', 151 : '#afd7af', 152 : '#afd7d7', 153 : '#afd7ff',
      \ 154 : '#afff00', 155 : '#afff5f', 156 : '#afff87', 157 : '#afffaf', 158 : '#afffd7', 159 : '#afffff',
      \ 160 : '#d70000', 161 : '#d7005f', 162 : '#d70087', 163 : '#d700af', 164 : '#d700d7', 165 : '#d700ff',
      \ 166 : '#d75f00', 167 : '#d75f5f', 168 : '#d75f87', 169 : '#d75faf', 170 : '#d75fd7', 171 : '#d75fff',
      \ 172 : '#d78700', 173 : '#d7875f', 174 : '#d78787', 175 : '#d787af', 176 : '#d787d7', 177 : '#d787ff',
      \ 178 : '#d7af00', 179 : '#d7af5f', 180 : '#d7af87', 181 : '#d7afaf', 182 : '#d7afd7', 183 : '#d7afff',
      \ 184 : '#d7d700', 185 : '#d7d75f', 186 : '#d7d787', 187 : '#d7d7af', 188 : '#d7d7d7', 189 : '#d7d7ff',
      \ 190 : '#d7ff00', 191 : '#d7ff5f', 192 : '#d7ff87', 193 : '#d7ffaf', 194 : '#d7ffd7', 195 : '#d7ffff',
      \ 196 : '#ff0000', 197 : '#ff005f', 198 : '#ff0087', 199 : '#ff00af', 200 : '#ff00d7', 201 : '#ff00ff',
      \ 202 : '#ff5f00', 203 : '#ff5f5f', 204 : '#ff5f87', 205 : '#ff5faf', 206 : '#ff5fd7', 207 : '#ff5fff',
      \ 208 : '#ff8700', 209 : '#ff875f', 210 : '#ff8787', 211 : '#ff87af', 212 : '#ff87d7', 213 : '#ff87ff',
      \ 214 : '#ffaf00', 215 : '#ffaf5f', 216 : '#ffaf87', 217 : '#ffafaf', 218 : '#ffafd7', 219 : '#ffafff',
      \ 220 : '#ffd700', 221 : '#ffd75f', 222 : '#ffd787', 223 : '#ffd7af', 224 : '#ffd7d7', 225 : '#ffd7ff',
      \ 226 : '#ffff00', 227 : '#ffff5f', 228 : '#ffff87', 229 : '#ffffaf', 230 : '#ffffd7', 231 : '#ffffff',
      \
      \ 232 : '#080808', 233 : '#121212', 234 : '#1c1c1c', 235 : '#262626', 236 : '#303030', 237 : '#3a3a3a',
      \ 238 : '#444444', 239 : '#4e4e4e', 240 : '#585858', 241 : '#606060', 242 : '#666666', 243 : '#767676',
      \ 244 : '#808080', 245 : '#8a8a8a', 246 : '#949494', 247 : '#9e9e9e', 248 : '#a8a8a8', 249 : '#b2b2b2',
      \ 250 : '#bcbcbc', 251 : '#c6c6c6', 252 : '#d0d0d0', 253 : '#dadada', 254 : '#e4e4e4', 255 : '#eeeeee',
      \ }

" ========|===========
" Red     | 160 168
" Blue    | 67  68  111
" Yellow  | 114 179
" Orange  | 173 178
" Purple  | 140
" Magenta | 128
" ========|===========

let s:colors = {
      \ 16: '#292b2e', 24: '#3C8380', 28: '#c269fe', 30: '#2aa1ae', 36: '#20af81', 40: '#00ff00',
      \ 59: '#FF73B9', 68: '#4f97d7', 75: '#FF62B0', 76: '#86dc2f', 81: '#f9bb00', 88: '#330033',
      \ 104: '#df90ff', 114: '#67b11d', 128: '#e76a49', 135: '#B7B7FF', 136: '#dc752f', 139: '#d698fe',
      \ 140: '#b888e2', 141: '#9a9aba', 151: '#74BAAC', 160: '#e0211d', 161: '#E469FE', 167: '#ce537a',
      \ 168: '#ce537a', 169: '#bc6ec5', 170: '#bc6ec5', 171: '#6094DB', 173: '#e18254', 176: '#E697E6',
      \ 177: '#D881ED', 178: '#d1951d', 179: '#d4b261', 196: '#e0211d', 204: '#ce537a', 207: '#FF68DD',
      \ 214: '#FF4848', 218: '#d19a66', 225: '#FFC8C8', 229: '#fff06a', 233: '#303030', 234: '#212026',
      \ 235: '#292b2e', 236: '#34323e', 238: '#544a65', 239: '#44505c', 241: '#534b5d', 243: '#65737e',
      \ 244: '#b4d1b6',
      \ }

function! s:hi(item, fg, bg, cterm, gui)
  let l:fg = empty(a:fg) ? '' : printf('ctermfg=%d guifg=%s', a:fg, get(s:colors, a:fg, s:color256[a:fg]))
  let l:bg = empty(a:bg) ? '' : printf('ctermbg=%d guibg=%s', a:bg, get(s:colors, a:bg, s:color256[a:bg]))
  let l:style = printf('cterm=%s gui=%s', a:cterm, a:gui)
  execute 'hi '.a:item.' '.l:fg.' '.l:bg.' '.l:style
endfunction

let s:fg = 249
let s:bg = get(g:, 'space_vim_dark_background', 235)
let s:bg = max([s:bg, 233])

let s:bias = s:bg - 235
let s:bg0 = s:bg - 1
let s:bg1 = s:bg + 1
let s:bg2 = s:bg + 2
let s:bg3 = s:bg + 3
let s:bg4 = s:bg + 4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" python-mode
call s:hi('pythonLambdaExpr'      , 105 , '' , 'none' , 'none')
call s:hi('pythonClass'           , 207 , '' , 'bold' , 'bold')
call s:hi('pythonParameters'      , 147 , '' , 'none' , 'none')
call s:hi('pythonParam'           , 108 , '' , 'none' , 'none')
call s:hi('pythonBrackets'        , 183 , '' , 'none' , 'none')
call s:hi('pythonClassParameters' , 111 , '' , 'none' , 'none')
call s:hi('pythonBuiltinType'     , 68  , '' , 'none' , 'none')
call s:hi('pythonBuiltinObj'      , 71  , '' , 'bold' , 'bold')
call s:hi('pythonBuiltinFunc'     , 169 , '' , 'bold' , 'bold')
call s:hi('pythonOperator'        , 68  , '' , 'bold' , 'bold')
call s:hi('pythonInclude'         , 68  , '' , 'bold' , 'bold')
call s:hi('pythonSelf'            , 173 , '' , 'italic' , 'bold')
call s:hi('pythonStatement'       , 68  , '' , 'bold' , 'bold')
call s:hi('pythonDottedName'      , 169 , '' , 'bold' , 'bold')
call s:hi('pythonDecorator'       , 169 , '' , 'bold' , 'bold')
call s:hi('pythonException'       , 166 , '' , 'bold' , 'bold')
call s:hi('pythonError'           , 195 , '' , 'none' , 'none')
call s:hi('pythonIndentError'     , 196 , '' , 'none' , 'none')
call s:hi('pythonSpaceError'      , 196 , '' , 'none' , 'none')
call s:hi('pythonObject'          , 200 , '' , 'none' , 'none')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &background ==# 'dark'
  let g:terminal_ansi_colors = [
        \ '#292b2e', '#d26487', '#35a8a5', '#b89f33', '#6981c5', '#a15ea7', '#288668', '#727272',
        \ '#34323e', '#f2241f', '#67b11d', '#b1951d', '#4f97d7', '#bc6ec5', '#2d9574', '#b2b2b2']
  if !has('gui_running') && get(g:, 'space_vim_transp_bg', 0)
    hi Normal ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi CursorLineNr ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi FoldColumn ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi SignColumn ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi VertSplit ctermfg=234 ctermbg=NONE guifg=#212026 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  else
    hi Normal ctermfg=249 ctermbg=235 guifg=#b2b2b2 guibg=#292b2e guisp=NONE cterm=NONE gui=NONE
    hi CursorLineNr ctermfg=170 ctermbg=234 guifg=#bc6ec5 guibg=#212026 guisp=NONE cterm=NONE gui=NONE
    hi FoldColumn ctermfg=170 ctermbg=234 guifg=#bc6ec5 guibg=#212026 guisp=NONE cterm=NONE gui=NONE
    hi SignColumn ctermfg=249 ctermbg=235 guifg=#b2b2b2 guibg=#292b2e guisp=NONE cterm=NONE gui=NONE
    hi VertSplit ctermfg=234 ctermbg=235 guifg=#212026 guibg=#292b2e guisp=NONE cterm=NONE gui=NONE
  endif
  hi ColorColumn ctermfg=NONE ctermbg=234 guifg=NONE guibg=#212026 guisp=NONE cterm=NONE gui=NONE
  hi Conceal ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Cursor ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE,bold,reverse gui=NONE,bold,reverse
  hi! link CursorColumn CursorLine
  hi CursorLine ctermfg=NONE ctermbg=234 guifg=NONE guibg=#212026 guisp=NONE cterm=NONE gui=NONE
  hi DiffAdd ctermfg=70 ctermbg=235 guifg=#67b11d guibg=#292b2e guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi DiffChange ctermfg=173 ctermbg=235 guifg=#e18254 guibg=#292b2e guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi DiffDelete ctermfg=196 ctermbg=235 guifg=#f2241f guibg=#292b2e guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi DiffText ctermfg=136 ctermbg=235 guifg=#b1951d guibg=#292b2e guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi Directory ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi EndOfBuffer ctermfg=235 ctermbg=NONE guifg=#292b2e guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Error ctermfg=196 ctermbg=235 guifg=#f2241f guibg=#292b2e guisp=NONE cterm=NONE,bold,reverse gui=NONE,bold,reverse
  hi ErrorMsg ctermfg=235 ctermbg=196 guifg=#292b2e guibg=#f2241f guisp=NONE cterm=NONE gui=NONE
  hi Folded ctermfg=133 ctermbg=234 guifg=#a45bad guibg=#212026 guisp=NONE cterm=NONE gui=NONE,italic
  hi IncSearch ctermfg=173 ctermbg=235 guifg=#e18254 guibg=#292b2e guisp=NONE cterm=NONE,bold,reverse gui=NONE,bold,reverse
  hi LineNr ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi MatchParen ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE,bold,underline gui=NONE,bold,underline
  hi ModeMsg ctermfg=184 ctermbg=NONE guifg=#e5d11c guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi! link MoreMsg ModeMsg
  hi NonText ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Pmenu ctermfg=103 ctermbg=236 guifg=#9a9aba guibg=#34323e guisp=NONE cterm=NONE gui=NONE
  hi PmenuSbar ctermfg=NONE ctermbg=234 guifg=NONE guibg=#212026 guisp=NONE cterm=NONE gui=NONE
  hi PmenuSel ctermfg=NONE ctermbg=60 guifg=NONE guibg=#5e5079 guisp=NONE cterm=NONE gui=NONE
  hi PmenuThumb ctermfg=NONE ctermbg=60 guifg=NONE guibg=#5d4d7a guisp=NONE cterm=NONE gui=NONE
  hi Question ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi! link QuickFixLine Search
  hi! link qfLineNr Type
  hi Search ctermfg=70 ctermbg=235 guifg=#67b11d guibg=#292b2e guisp=NONE cterm=NONE,bold,reverse gui=NONE,bold,reverse
  hi SpecialKey ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi SpellBad ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=#f2241f cterm=NONE,underline gui=NONE,italic,undercurl
  hi SpellCap ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=#4f97d7 cterm=NONE,underline gui=NONE,italic,undercurl
  hi SpellLocal ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=#2d9574 cterm=NONE,underline gui=NONE,italic,undercurl
  hi SpellRare ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=#bc6ec5 cterm=NONE,underline gui=NONE,italic,undercurl
  hi StatusLine ctermfg=249 ctermbg=60 guifg=#b2b2b2 guibg=#5d4d7a guisp=NONE cterm=NONE gui=NONE
  hi StatusLineNC ctermfg=60 ctermbg=236 guifg=#5d4d7a guibg=#34323e guisp=NONE cterm=NONE gui=NONE
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi TabLineFill ctermfg=60 ctermbg=234 guifg=#544a65 guibg=#212026 guisp=NONE cterm=NONE gui=NONE
  hi TabLineSel ctermfg=70 ctermbg=234 guifg=#67b11d guibg=#212026 guisp=NONE cterm=NONE gui=NONE
  hi! link TabLine TabLineFill
  hi Title ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi Visual ctermfg=NONE ctermbg=60 guifg=NONE guibg=#544a65 guisp=NONE cterm=NONE gui=NONE
  hi! link VisualNOS Visual
  hi WarningMsg ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi WildMenu ctermfg=173 ctermbg=234 guifg=#e18254 guibg=#212026 guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi Boolean ctermfg=166 ctermbg=NONE guifg=#dc752f guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Character ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Comment ctermfg=37 ctermbg=NONE guifg=#2aa1ae guibg=NONE guisp=NONE cterm=NONE,none gui=NONE,italic,none
  hi Conditional ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi Constant ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Define ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Debug ctermfg=196 ctermbg=NONE guifg=#f54e3c guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Delimiter ctermfg=73 ctermbg=NONE guifg=#74baac guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Error ctermfg=196 ctermbg=235 guifg=#f2241f guibg=#292b2e guisp=NONE cterm=NONE,bold,reverse gui=NONE,bold,reverse
  hi Exception ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Float ctermfg=147 ctermbg=NONE guifg=#b7b7ff guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Function ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi Identifier ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Ignore ctermfg=fg ctermbg=NONE guifg=fg guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Include ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Keyword ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi Label ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Macro ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi Number ctermfg=176 ctermbg=NONE guifg=#e697e6 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Operator ctermfg=74 ctermbg=NONE guifg=#58b0d9 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi PreCondit ctermfg=133 ctermbg=NONE guifg=#a45bad guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi PreProc ctermfg=177 ctermbg=NONE guifg=#d698fe guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Repeat ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi SpecialChar ctermfg=80 ctermbg=NONE guifg=#28def0 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi SpecialComment ctermfg=67 ctermbg=NONE guifg=#768294 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Statement ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi StorageClass ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi Special ctermfg=172 ctermbg=NONE guifg=#d79650 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi String ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Structure ctermfg=31 ctermbg=NONE guifg=#4495b4 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
  hi Tag ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Todo ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold,italic
  hi Type ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Typedef ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
  hi Underlined ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
  hi! link lCursor Cursor
  hi CursorIM ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi ToolbarLine ctermfg=NONE ctermbg=232 guifg=NONE guibg=#0a0814 guisp=NONE cterm=NONE gui=NONE
  hi ToolbarButton ctermfg=252 ctermbg=232 guifg=#cdcdcd guibg=#0a0814 guisp=NONE cterm=NONE,bold gui=NONE,bold
  if get(g:, "space_vim_italic", 0)
    hi Comment    cterm=italic
    hi Folded     cterm=italic
    hi SpellBad   cterm=italic,underline
    hi SpellCap   cterm=italic,underline
    hi SpellLocal cterm=italic,underline
    hi SpellRare  cterm=italic,underline
    hi Todo       cterm=italic
  endif
  if get(g:, "space_vim_italicize_strings", 0)
    hi Special    cterm=italic gui=italic
    hi String     cterm=italic gui=italic
  endif
  hi! link iCursor Cursor
  hi! link vCursor Cursor
  hi NormalMode ctermfg=240 ctermbg=235 guifg=#5b5b5b guibg=#292b2e guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi InsertMode ctermfg=32 ctermbg=235 guifg=#4f97d7 guibg=#292b2e guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi ReplaceMode ctermfg=29 ctermbg=235 guifg=#2d9574 guibg=#292b2e guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi VisualMode ctermfg=173 ctermbg=235 guifg=#e18254 guibg=#292b2e guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi CommandMode ctermfg=170 ctermbg=235 guifg=#bc6ec5 guibg=#292b2e guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi Warnings ctermfg=173 ctermbg=235 guifg=#e18254 guibg=#292b2e guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  if has('nvim')
    let g:terminal_color_0  = '#292b2e'
    let g:terminal_color_8  = '#44505c'
    let g:terminal_color_1  = '#d26487'
    let g:terminal_color_9  = '#f2241f'
    let g:terminal_color_2  = '#35a8a5'
    let g:terminal_color_10 = '#67b11d'
    let g:terminal_color_3  = '#b89f33'
    let g:terminal_color_11 = '#b1951d'
    let g:terminal_color_4  = '#6981c5'
    let g:terminal_color_12 = '#4f97d7'
    let g:terminal_color_5  = '#a15ea7'
    let g:terminal_color_13 = '#bc6ec5'
    let g:terminal_color_6  = '#288668'
    let g:terminal_color_14 = '#2d9574'
    let g:terminal_color_7  = '#5b5b5b'
    let g:terminal_color_15 = '#b2b2b2'
    hi! link TermCursor Cursor
    hi TermCursorNC ctermfg=234 ctermbg=249 guifg=#212026 guibg=#b2b2b2 guisp=NONE cterm=NONE gui=NONE
  endif
  if !(get(g:, "space_vim_plugin_hi_groups", 1) || get(g:, "space_vim_filetype_hi_groups", 1))
    finish
  endif
  if get(g:, "space_vim_plugin_hi_groups", 1)
    hi ALEError ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#f2241f cterm=NONE,underline gui=NONE,undercurl
    hi ALEWarning ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#f2241f cterm=NONE,underline gui=NONE,undercurl
    hi ALEInfo ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#4f97d7 cterm=NONE,underline gui=NONE,undercurl
    hi ALEErrorSign ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi ALEWarningSign ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi ALEInfoSign ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi BufTabLineCurrent ctermfg=235 ctermbg=240 guifg=#292b2e guibg=#5b5b5b guisp=NONE cterm=NONE gui=NONE
    hi BufTabLineActive ctermfg=240 ctermbg=232 guifg=#5b5b5b guibg=#100a14 guisp=NONE cterm=NONE gui=NONE
    hi BufTabLineHidden ctermfg=236 ctermbg=234 guifg=#34323e guibg=#212026 guisp=NONE cterm=NONE gui=NONE
    hi BufTabLineFill ctermfg=235 ctermbg=235 guifg=#292b2e guibg=#292b2e guisp=NONE cterm=NONE gui=NONE
    hi CtrlPMatch ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi CtrlPNoEntries ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi CtrlPPrtBase ctermfg=232 ctermbg=NONE guifg=#100a14 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi CtrlPPrtCursor ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi CtrlPLinePre ctermfg=232 ctermbg=NONE guifg=#100a14 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi CtrlPMode1 ctermfg=32 ctermbg=232 guifg=#4f97d7 guibg=#100a14 guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi CtrlPMode2 ctermfg=235 ctermbg=32 guifg=#292b2e guibg=#4f97d7 guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi CtrlPStats ctermfg=240 ctermbg=232 guifg=#5b5b5b guibg=#100a14 guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi DirvishPathTail ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi DirvishArg ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link EasyMotionTarget Search
    hi! link EasyMotionShade Comment
    hi gitcommitSelectedFile ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi gitcommitDiscardedFile ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi GitGutterAdd ctermfg=70 ctermbg=235 guifg=#67b11d guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi GitGutterChange ctermfg=173 ctermbg=235 guifg=#e18254 guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi GitGutterDelete ctermfg=196 ctermbg=235 guifg=#f2241f guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi GitGutterChangeDelete ctermfg=168 ctermbg=235 guifg=#ce537a guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    if get(g:, "indent_guides_auto_colors", 0)
      if get(g: "space_vim_invert_indent_guides", 0)
        hi IndentGuidesOdd ctermfg=235 ctermbg=232 guifg=#292b2e guibg=#100a14 guisp=NONE cterm=NONE,reverse gui=NONE,reverse
        hi IndentGuidesEven ctermfg=235 ctermbg=234 guifg=#292b2e guibg=#212026 guisp=NONE cterm=NONE,reverse gui=NONE,reverse
      else
        hi IndentGuidesOdd ctermfg=235 ctermbg=232 guifg=#292b2e guibg=#100a14 guisp=NONE cterm=NONE gui=NONE
        hi IndentGuidesEven ctermfg=235 ctermbg=234 guifg=#292b2e guibg=#212026 guisp=NONE cterm=NONE gui=NONE
      endif
    endif
    " IndentLine
    if !exists('g:indentLine_color_term')
      let g:indentLine_color_term = 232
    endif
    if !exists('g:indentLine_color_gui')
      let g:indentLine_color_gui = '#100a14'
    endif
    hi NERDTreeDir ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi NERDTreeDirSlash ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi NERDTreeOpenable ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi NERDTreeClosable ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi NERDTreeFile ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi NERDTreeExecFile ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi NERDTreeUp ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi NERDTreeCWD ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi NERDTreeHelp ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi NERDTreeToggleOn ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi NERDTreeToggleOff ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi netrwDir ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi netrwClassify ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi netrwLink ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi netrwSymLink ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi netrwExe ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi netrwComment ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi netrwList ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi netrwHelpCmd ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi netrwCmdSep ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi netrwVersion ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    " Rainbow Parentheses
    if !exists('g:rbpt_colorpairs')
      let g:rbpt_colorpairs = [['blue', '#6981c5'], ['magenta', '#a15ea7'],
            \ ['red', '#d26487'], ['173', '#ca754b']]
    endif

    let g:rainbow_guifgs = [ '#ca754b', '#d26487', '#a15ea7', '#6981c5' ]
    let g:rainbow_ctermfgs = [ '173', 'red', 'magenta', 'blue' ]

    if !exists('g:rainbow_conf')
      let g:rainbow_conf = {}
    endif
    if !has_key(g:rainbow_conf, 'guifgs')
      let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
    endif
    if !has_key(g:rainbow_conf, 'ctermfgs')
      let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
    endif

    let g:niji_dark_colours = g:rbpt_colorpairs
    let g:niji_light_colours = g:rbpt_colorpairs
    hi ShowMarksHLl ctermfg=32 ctermbg=235 guifg=#4f97d7 guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi ShowMarksHLu ctermfg=32 ctermbg=235 guifg=#4f97d7 guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi ShowMarksHLo ctermfg=32 ctermbg=235 guifg=#4f97d7 guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi ShowMarksHLm ctermfg=32 ctermbg=235 guifg=#4f97d7 guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi SignifySignAdd ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi SignifySignChange ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi SignifySignDelete ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi SignatureMarkText ctermfg=32 ctermbg=235 guifg=#4f97d7 guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi SignatureMarkerText ctermfg=170 ctermbg=235 guifg=#bc6ec5 guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi StartifyBracket ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi StartifyFile ctermfg=249 ctermbg=235 guifg=#b2b2b2 guibg=#292b2e guisp=NONE cterm=NONE gui=NONE
    hi StartifyNumber ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi StartifyPath ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi StartifySlash ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi StartifySection ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi! link StartifySpecial Type
    hi StartifyHeader ctermfg=133 ctermbg=NONE guifg=#a45bad guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi StartifyFooter ctermfg=133 ctermbg=NONE guifg=#a45bad guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi SyntasticError ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#f2241f cterm=NONE,underline gui=NONE,undercurl
    hi SyntasticWarning ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#b1951d cterm=NONE,underline gui=NONE,undercurl
    hi SyntasticErrorSign ctermfg=196 ctermbg=235 guifg=#f2241f guibg=#292b2e guisp=NONE cterm=NONE gui=NONE
    hi SyntasticWarningSign ctermfg=136 ctermbg=235 guifg=#b1951d guibg=#292b2e guisp=NONE cterm=NONE gui=NONE
    hi multiple_cursors_cursor ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,reverse gui=NONE,reverse
    hi multiple_cursors_visual ctermfg=NONE ctermbg=232 guifg=NONE guibg=#100a14 guisp=NONE cterm=NONE gui=NONE
    hi CurrentWord ctermfg=NONE ctermbg=60 guifg=NONE guibg=#544a65 guisp=NONE cterm=NONE,underline gui=NONE,underline
    hi CurrentWordTwins ctermfg=NONE ctermbg=60 guifg=NONE guibg=#544a65 guisp=NONE cterm=NONE gui=NONE
    hi! link WhichKey Function
    hi WhichKeySeperator ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link WhichKeyGroup Keyword
    hi! link WhichKeyDesc Identifier
    let g:vimshell_escape_colors = [
          \ '#34323e', '#f2241f', '#67b11d', '#b1951d',
          \ '#4f97d7', '#bc6ec5', '#2d9574', '#5b5b5b',
          \ '#292b2e', '#f2241f', '#67b11d', '#e18254',
          \ '#4f97d7', '#bc6ec5', '#2d9574', '#cdcdcd'
          \ ]
  endif
  if get(g:, "space_vim_filetype_hi_groups", 1)
    hi diffAdded ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi diffRemoved ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi diffChanged ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi diffFile ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi diffNewFile ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi diffLine ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi htmlTag ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi htmlEndTag ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi htmlTagName ctermfg=133 ctermbg=NONE guifg=#a45bad guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi htmlArg ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi htmlScriptTag ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi htmlTagN ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi htmlSpecialTagName ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi htmlLink ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
    hi htmlSpecialChar ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi htmlBold ctermfg=fg ctermbg=235 guifg=fg guibg=#292b2e guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi htmlBoldUnderline ctermfg=fg ctermbg=235 guifg=fg guibg=#292b2e guisp=NONE cterm=NONE,bold,underline gui=NONE,bold,underline
    hi htmlBoldItalic ctermfg=fg ctermbg=235 guifg=fg guibg=#292b2e guisp=NONE cterm=NONE,bold,italic gui=NONE,bold,italic
    hi htmlBoldUnderlineItalic ctermfg=fg ctermbg=235 guifg=fg guibg=#292b2e guisp=NONE cterm=NONE,bold,italic,underline gui=NONE,bold,italic,underline
    hi htmlUnderline ctermfg=fg ctermbg=235 guifg=fg guibg=#292b2e guisp=NONE cterm=NONE,underline gui=NONE,underline
    hi htmlUnderlineItalic ctermfg=fg ctermbg=235 guifg=fg guibg=#292b2e guisp=NONE cterm=NONE,italic,underline gui=NONE,italic,underline
    hi htmlItalic ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE,italic gui=NONE,italic
    hi xmlTag ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlEndTag ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlTagName ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlEqual ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi docbkKeyword ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi xmlDocTypeDecl ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlDocTypeKeyword ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlCdataStart ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlCdataCdata ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi dtdFunction ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi dtdTagName ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlAttrib ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlProcessingDelim ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi dtdParamEntityPunct ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi dtdParamEntityDPunct ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlAttribPunct ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlEntity ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi xmlEntityPunct ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi vimCommentTitle ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi vimNotation ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi vimBracket ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi vimMapModKey ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi vimCommand ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi vimLet ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi vimNorm ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link vimFuncSID Function
    hi! link vimFunction Function
    hi vimGroup ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link vimHiGroup Type
    hi vimSetSep ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi vimSep ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi vimContinue ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureKeyword ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureCond ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureSpecial ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureDefine ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureFunc ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureRepeat ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureCharacter ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureStringEscape ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureException ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureRegexp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureRegexpEscape ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureRegexpCharClass ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi! link clojureRegexpMod clojureRegexpCharClass
    hi! link clojureRegexpQuantifier clojureRegexpCharClass
    hi clojureParen ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureAnonArg ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureVariable ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureMacro ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureMeta ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureDeref ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureQuote ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi clojureUnquote ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cOperator ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cStructure ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi rustSelf ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi rustPanic ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi rustAssert ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi! link pythonCoding Comment
    hi cssBraces ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssFunctionName ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssIdentifier ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssClassName ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssColor ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssSelectorOp ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssSelectorOp2 ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssImportant ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssVendor ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssTextProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssAnimationProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssUIProp ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssTransformProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssTransitionProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssPrintProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssPositioningProp ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssBoxProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssFontDescriptorProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssFlexibleBoxProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssBorderOutlineProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssBackgroundProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssMarginProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssListProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssTableProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssFontProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssPaddingProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssDimensionProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssRenderProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssColorProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi cssGeneratedContentProp ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaScriptBraces ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaScriptFunction ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaScriptIdentifier ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaScriptMember ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaScriptNumber ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaScriptNull ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaScriptParens ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptImport ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptExport ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptClassKeyword ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptClassExtends ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDefault ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptClassName ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptClassSuperName ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptGlobal ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptEndColons ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptFuncArg ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptGlobalMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptNodeGlobal ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptBOMWindowProp ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptArrayMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptArrayStaticMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptCacheMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDateMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptMathStaticMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptURLUtilsProp ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptBOMNavigatorProp ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDOMDocMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDOMDocProp ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptBOMLocationMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptBOMWindowMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptStringMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptVariable ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptIdentifier ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptClassSuper ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptFuncKeyword ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptAsyncFunc ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptClassStatic ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptOperator ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptForOperator ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptYield ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptExceptions ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptMessage ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptTemplateSB ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptTemplateSubstitution ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptLabel ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptObjectLabel ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptPropertyName ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptLogicSymbols ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptArrowFunc ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDocParamName ctermfg=240 ctermbg=NONE guifg=#5b5b5b guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDocTags ctermfg=240 ctermbg=NONE guifg=#5b5b5b guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDocNotation ctermfg=240 ctermbg=NONE guifg=#5b5b5b guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDocParamType ctermfg=240 ctermbg=NONE guifg=#5b5b5b guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDocNamedParamType ctermfg=240 ctermbg=NONE guifg=#5b5b5b guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptBrackets ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDOMElemAttrs ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDOMEventMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDOMNodeMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptDOMStorageMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptHeadersMethod ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javascriptAsyncFuncKeyword ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi javascriptAwaitFuncKeyword ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi! link jsClassKeyword Keyword
    hi! link jsExtendsKeyword Keyword
    hi jsExportDefault ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi jsTemplateBraces ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link jsGlobalNodeObjects Keyword
    hi! link jsGlobalObjects Keyword
    hi! link jsFunction Function
    hi jsFuncParens ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsParens ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsNull ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link jsUndefined ErrorMsg
    hi jsClassDefinition ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link jsObjectProp Identifier
    hi jsObjectKey ctermfg=74 ctermbg=NONE guifg=#58b0d9 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsFunctionKey ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsBracket ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsObjectColon ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsFuncArgs ctermfg=74 ctermbg=NONE guifg=#58b0d9 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsFuncBraces ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsVariableDef ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link jsObjectBraces Special
    hi jsObjectValue ctermfg=147 ctermbg=NONE guifg=#b7b7ff guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsClassBlock ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsFutureKeys ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi jsFuncArgs ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsStorageClass ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsxRegion ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi typeScriptReserved ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link typeScriptLabel Label
    hi! link typeScriptFuncKeyword Function
    hi! link typeScriptIdentifier Identifier
    hi typeScriptBraces ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi typeScriptEndColons ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi typeScriptDOMObjects ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link typeScriptAjaxMethods Function
    hi typeScriptLogicSymbols ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link typeScriptDocSeeTag Comment
    hi! link typeScriptDocParam Comment
    hi! link typeScriptDocTags vimCommentTitle
    hi! link typeScriptGlobalObjects Keyword
    hi typeScriptParens ctermfg=68 ctermbg=NONE guifg=#7590db guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link typeScriptOpSymbols Operator
    hi! link typeScriptHtmlElemProperties Special
    hi typeScriptNull ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi typeScriptInterpolationDelimiter ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi purescriptModuleKeyword ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi purescriptModuleName ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi purescriptWhere ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi purescriptDelimiter ctermfg=240 ctermbg=NONE guifg=#5b5b5b guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link purescriptType Type
    hi! link purescriptImportKeyword Keyword
    hi! link purescriptHidingKeyword Keyword
    hi! link purescriptAsKeyword Keyword
    hi! link purescriptStructure Structure
    hi! link purescriptOperator Operator
    hi! link purescriptTypeVar Type
    hi! link purescriptConstructor Function
    hi! link purescriptFunction Function
    hi! link purescriptConditional Conditional
    hi purescriptBacktick ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi coffeeExtendedOp ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi coffeeSpecialOp ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi coffeeCurly ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi coffeeParen ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi coffeeBracket ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi rubyStringDelimiter ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi rubyInterpolationDelimiter ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi objcTypeModifier ctermfg=196 ctermbg=NONE guifg=#f2241f guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi objcDirective ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi goDirective ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi goConstants ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link goDeclaration Keyword
    hi goDeclType ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi goBuiltins ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi luaIn ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi luaFunction ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi luaTable ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi moonSpecialOp ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi moonExtendedOp ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi moonFunction ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi moonObject ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaAnnotation ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaDocTags ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link javaCommentTitle vimCommentTitle
    hi javaParen ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaParen1 ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaParen2 ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaParen3 ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaParen4 ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaParen5 ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaOperator ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi javaVarArg ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link elixirDocString Comment
    hi elixirStringDelimiter ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi elixirInterpolationDelimiter ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi elixirModuleDeclaration ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaNameDefinition ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaCaseFollowing ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaCapitalWord ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaTypeExtension ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaKeyword ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi scalaKeywordModifier ctermfg=168 ctermbg=NONE guifg=#ce537a guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaSpecial ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaOperator ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaTypeDeclaration ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaTypeTypePostDeclaration ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaInstanceDeclaration ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi scalaInterpolation ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownItalic ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE,italic gui=NONE,italic
    hi markdownH1 ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi markdownH2 ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi markdownH3 ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi markdownH4 ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi markdownH5 ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownH6 ctermfg=136 ctermbg=NONE guifg=#b1951d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link htmlH1 markdownH1
    hi! link htmlH2 markdownH2
    hi! link htmlH3 markdownH3
    hi! link htmlH4 markdownH4
    hi! link htmlH5 markdownH5
    hi! link htmlH6 markdownH6
    hi markdownCode ctermfg=133 ctermbg=NONE guifg=#a45bad guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link mkdCode markdownCode
    hi markdownCodeBlock ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownCodeDelimiter ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link mkdCodeDelimiter markdownCodeDelimiter
    hi markdownBlockquote ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownListMarker ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownOrderedListMarker ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownRule ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownHeadingRule ctermfg=239 ctermbg=NONE guifg=#44505c guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownUrlDelimiter ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownLinkDelimiter ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownLinkTextDelimiter ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownHeadingDelimiter ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownUrl ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi markdownUrlTitleDelimiter ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi! link markdownLinkText htmlLink
    hi! link markdownIdDeclaration markdownLinkText
    hi haskellType ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellIdentifier ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellSeparator ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellDelimiter ctermfg=240 ctermbg=NONE guifg=#5b5b5b guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellOperators ctermfg=32 ctermbg=NONE guifg=#4f97d7 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellBacktick ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellStatement ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellConditional ctermfg=173 ctermbg=NONE guifg=#e18254 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellLet ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellDefault ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellWhere ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellBottom ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellBlockKeywords ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellImportKeywords ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellDeclKeyword ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellDeriving ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellAssocType ctermfg=29 ctermbg=NONE guifg=#2d9574 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellNumber ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellPragma ctermfg=170 ctermbg=NONE guifg=#bc6ec5 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellString ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi haskellChar ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsonKeyword ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsonQuote ctermfg=70 ctermbg=NONE guifg=#67b11d guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsonBraces ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
    hi jsonString ctermfg=249 ctermbg=NONE guifg=#b2b2b2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
  endif
  finish
endif

