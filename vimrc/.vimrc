se nocp

cal plug#begin()
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'jmcantrell/vim-virtualenv', {'for': ['python']}
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', {'for': ['markdown', 'text']}
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter' 
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'unblevable/quick-scope'
cal plug#end()

pa! matchit

if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

se enc=utf-8
se guifont=Anonymice\ Pro\ 20
colo industry
let mapleader="\<Space>"
se ul=1000
se ai
se si
se ar
se wrap
se bs=indent,eol,start
se ts=4
se sts=4
se sw=4
se et
se fdl=99
se fdm=indent
"se gfn=Fira\ Mono\ for\ Powerline:h12
se hid
se ic
se scs
se is
se ls=2
se synmaxcol=300
se ttyfast
se lazyredraw
noh
se nowrap
se nu
se rnu
se so=9
se shm+=I
se sc
se sm
se bk
se udf
se ut=750
se wmnu
se bri
se smc=200

if !isdirectory(expand("~/.vim/tmp")) | cal mkdir(expand("~/.vim/tmp"), "p") | en
se dir=~/.vim/tmp//,.
se bdir=~/.vim/tmp//,.
se udir=~/.vim/tmp//,.

se noeb vb t_vb=

se go-=m
se go-=T
se go-=r
se go-=L

syn enable

"if g:os =~ "Windows"
    "map <f12> :sil !start /min ctags -R --python-kinds=-i<cr>
"elseif g:os =~ "Linux"
    "map <f12> :sil! !ctags -R --python-kinds=-i<cr>
"endif

aug all
    au!
    au BufWritePost $MYVIMRC so $MYVIMRC

    if g:os =~ "win"
        au BufWritePost *.py sil !/min ctags -R --python-kinds=-i
    elseif g:os =~ "linux"
        "au BufWritePost *.py sil !ctags -R --python-kinds=-i
    endif

    au FileType html,css EmmetInstall
    au FileType nerdtree setl rnu
    au FileType python nn <buffer> <F5> :!start cmd /c python % & pause<cr>
    au FileType python nn <F6> :cal <SID>ToggleBreakpoint()<CR>
    au GuiEnter * sim ~x
    au QuickFixCmdPost * cw
aug END


no <Leader>a ggVG

sil! nm <F3> :NERDTreeFind<CR>
sil! nm <F4> :NERDTreeToggle<CR>
sil! nm <F8> :TagbarToggle<CR>

com! -nargs=* -complete=help H helpg <args>

ino <C-BS> <C-W>
cno <C-BS> <C-W>

xn < <gv
xn > >gv

nm <leader>1 <Plug>AirlineSelectTab1
nm <leader>2 <Plug>airlineSelectTab2
nm <leader>3 <Plug>AirlineSelectTab3
nm <leader>4 <Plug>AirlineSelectTab4
nm <leader>5 <Plug>AirlineSelectTab5
nm <leader>6 <Plug>AirlineSelectTab6
nm <leader>7 <Plug>AirlineSelectTab7
nm <leader>8 <Plug>AirlineSelectTab8
nm <leader>9 <Plug>AirlineSelectTab9
nm <leader>- <Plug>AirlineSelectPrevTab
nm <leader>+ <Plug>AirlineSelectNextTab
nm <silent> <Leader>e :e $MYVIMRC<CR>
nm <leader>w :w!<cr>
nm <leader>v :vs<CR><C-L><C-F>:se scb<CR><C-H>:se scb<CR>

nn <leader>cp :let @*='"' . expand("%:p") . '"'<CR>
nn <leader>cd :let @*='"' . expand("%:p:h") . '"'<CR>
nn <leader>oe :sil! !start <C-R>='"' . expand("%:p:h") . '"'<CR><CR>
nn <C-P> :FZF<CR>

nn <Leader>qo :cope<CR>
nn <Leader>qc :ccl<CR>
nn <Leader>lo :lop<CR>
nn <Leader>lc :lcl<CR>

nn <leader>ga :Git add %:p<CR><CR>
nn <leader>gs :Gstatus<CR>
nn <leader>gc :Gcommit -v -q<CR>
nn <leader>gt :Gcommit -v -q :%p<CR>
nn <leader>gd :Gdiff<CR>
nn <leader>ge :Gedit<CR>
nn <leader>gr :Gread<CR>
nn <leader>gw :Gwrite<CR><CR>
nn <leader>gl :sil! Glog<CR>:bot copen<CR>
nn <leader>gp :Ggrep<Space>
nn <leader>gm :Gmove<Space>
nn <leader>gb :Git branch<Space>
nn <leader>go :Git checkout<Space>
nn <leader>gps :Gpush<CR>
nn <leader>gpl :Gpull<CR>

nn <C-J> <C-W><C-J>
nn <C-K> <C-W><C-K>
nn <C-L> <C-W><C-L>
nn <C-H> <C-W><C-H>

nn <Left> <C-W><
nn <Right> <C-W>>
nn <Up> <C-W>+
nn <Down> <C-W>-

"No Ex mode ugh
nn Q <nop>

if !exists('g:airline_symbols') | let g:airline_symbols={} | en

let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=2
let g:airline#extensions#virtualenv#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline_detect_modified=1
let g:airline_powerline_fonts=1
let g:airline_mode_map={
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

let g:NERDTreeIgnore=['\.swp$', '\.un\~$', '\.pyc$', 'tags', '\.ropeproject[[dir]]', '__pycache__[[dir]]']

let g:virtualenv_auto_activate=1

let g:user_emmet_install_global=0
let g:user_emmet_leader_key="<C-M>"

let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_show_linenumbers=2
let g:tagbar_iconchars=['▶', '▼']
let g:tagbar_silent=1
let g:tagbar_sort=0
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:rainbow_active=1

let g:session_autoload='no'

func! s:SetBreakpoint()
    cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
endf

func! s:RemoveBreakpoint()
    exe 'sil! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
endf

func! s:ToggleBreakpoint()
    if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf

cmap w!! %!sudo tee > /dev/null %

let g:tex_flavor = 'latex'

function! Hardcopy()
  let colors_save = g:colors_name
  colorscheme default
  TOhtml
  execute 'colorscheme' colors_save
endfun
command! Hardcopy call Hardcopy()


"MOVE BY DISPLAY LINES INSTEAD OF WRAPPED LINES
noremap   <silent> k gk
noremap   <silent> j gj
noremap   <silent> 0 g0
noremap   <silent> ^ g^
noremap   <silent> $ g$
" noremap   <silent> <Home> g<Home>
" noremap   <silent> <End> g<End>
function! NoremapNormalCmd(key, preserve_omni, ...)
  let cmd = ''
  let icmd = ''
  for x in a:000
    let cmd .= x
    let icmd .= "<C-\\><C-O>" . x
  endfor
  execute ":nnoremap <silent> " . a:key . " " . cmd
  execute ":vnoremap <silent> " . a:key . " " . cmd
  if a:preserve_omni
    execute ":inoremap <silent> <expr> " . a:key . " pumvisible() ? \"" . a:key . "\" : \"" . icmd . "\""
  else
    execute ":inoremap <silent> " . a:key . " " . icmd
  endif
endfunction

" Cursor moves by screen lines
call NoremapNormalCmd("<Up>", 1, "gk")
call NoremapNormalCmd("<Down>", 1, "gj")
call NoremapNormalCmd("<Home>", 0, "g<Home>")
call NoremapNormalCmd("<End>", 0, "g<End>")

" PageUp/PageDown preserve relative cursor position
call NoremapNormalCmd("<PageUp>", 0, "<C-U>", "<C-U>")
call NoremapNormalCmd("<PageDown>", 0, "<C-D>", "<C-D>")
"END MOVE BY DISPLAY LINES INSTEAD OF WRAPPED LINES

