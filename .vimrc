"   ___       __       ________      ________       ________       ___  ___      ________      _________
"  |\  \     |\  \    |\   __  \    |\   ___  \    |\   ____\     |\  \|\  \    |\   __  \    |\___   ___\
"  \ \  \    \ \  \   \ \  \|\  \   \ \  \\ \  \   \ \  \___|_    \ \  \\\  \   \ \  \|\  \   \|___ \  \_|
"   \ \  \  __\ \  \   \ \   __  \   \ \  \\ \  \   \ \_____  \    \ \   __  \   \ \  \\\  \       \ \  \
"    \ \  \|\__\_\  \   \ \  \ \  \   \ \  \\ \  \   \|____|\  \    \ \  \ \  \   \ \  \\\  \       \ \  \
"     \ \____________\   \ \__\ \__\   \ \__\\ \__\    ____\_\  \    \ \__\ \__\   \ \_______\       \ \__\
"      \|____________|    \|__|\|__|    \|__| \|__|   |\_________\    \|__|\|__|    \|_______|        \|__|
"                                                     \|_________|

set encoding=utf-8
scriptencoding utf-8
augroup MyAutoCmd
  autocmd!
augroup END


""""""""""""""""""""""""""""
"環境毎の分岐について
"if has("mac")
"" mac用の設定
"elseif has("unix")
"" unix固有の設定
"elseif has("win64")
"" 64bit_windows固有の設定
"elseif has("win32unix")
"" Cygwin固有の設定
"elseif has("win32")
"" 32bit_windows固有の設定
"endif
"""""""""""""""""""""""""""
let $PYTHON3_DLL = '/usr/local/Cellar/python3/3.5.0/Frameworks/Python.framework/Versions/3.5/lib/python3.5'


"個人情報
if filereadable(expand('~/.vimrc_secret'))
  source ~/.vimrc_secret
endif

set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  filetype plugin on
  filetype indent on
"   highlight rightMargin term=bold ctermfg=174 guifg=blue
"   autocmd MyAutoCmd ColorScheme * match rightMargin /""".*{-}"""/
"   autocmd MyAutoCmd hi def link rightMargin String
"   autocmd MyAutoCmd syntax match pyComment /\cp932\/ display
"   autocmd MyAutoCmd syntax match howmIgnore contained "\＊"
"   autocmd MyAutoCmd hi def link howmString String
"   autocmd MyAutoCmd hi def link howmIgnore Ignore
"   autocmd MyAutoCmd ColorScheme * highlight  pythonString ctermfg=196 cterm=italic
  autocmd MyAutoCmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType htmldjango setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType python     setlocal sw=4 sts=4 ts=4 et omnifunc=jedi#completions completeopt-=preview
  autocmd MyAutoCmd FileType haskell    setlocal sw=2 sts=2 ts=2 et omnifunc=necoghc#omnifunc
  autocmd MyAutoCmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType rst        setlocal sw=3 sts=3 ts=3 et
  autocmd MyAutoCmd FileType jade       setlocal sw=4 sts=4 ts=4 et
endif

" syntax match Number /-\sA$/
" syn match BS '\v(cp932)'
" hi def link BS StorageClass
" autocmd MyAutoCmd ColorScheme * highlight  pythonCommenc ctermfg=196 cterm=italic

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


let mapleader = "\<Space>"

" スペースwで上書き保存
nnoremap <Leader>w :w<CR>

" 端末vimの挿入モードで矢印キーを打つとA,B...と入力してしまう現象の対策
set <xUp>=^[OA
set <xDown>=^[OB
set <xRight>=^[OC
set <xLeft>=^[OD

set notimeout
set ttimeout
set timeoutlen=100

" 削除した内容をクリップボードに入れない
nnoremap x "_x
nnoremap dd "_dd
nnoremap ciw "_ciw
vnoremap x "_x
vnoremap dd "_dd
vnoremap ciw "_ciw

" Insertモードのときカーソルの形状を変更
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"0で改行
command! LineBreak call append(expand('.'), '')j
nnoremap 0 :LineBreak<CR>

"末尾スペース削除
function! DelleteSpace()
  let pos = getpos(".")
  exe ':%s/\s*$//'
  call setpos('.', pos)
endfunction
command! DeleteSpace :call DelleteSpace()
nnoremap 9 :DeleteSpace<CR>

" 記録モード使わない
map q <NUL>
set noundofile          " un~ファイル作らない
"set tabstop=4
set autoindent
"set expandtab
"set shiftwidth=4
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める
set number
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

set nowritebackup
set nobackup
set noswapfile
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set wildmenu            " 補完時の一覧表示機能有効
set wildignore=*.o,*.obj,*.bak,*.swp,*.d,*~  " ファイル名補完時に無視するファイルパターン
"120行目から灰色に
let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

set t_vb=
set novisualbell
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
"set cursorline " カーソルライン表示

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus,unnamed
else
    set clipboard& clipboard+=unnamed
endif

cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
inoremap jj <Esc>
vnoremap v $h
nmap <silent> <Esc><Esc> :nohlsearch<CR>

"カーソル単語を*で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

"画面操作
nnoremap ww :<C-u>vs<CR>
nnoremap wh :<C-u>sp<CR>
nnoremap tt :<C-u>tabnew<CR>

noremap <Leader>b   <C-b>
noremap <Leader>f   <C-f>
noremap <Leader>a   ^
noremap <Leader>l   $

cmap w!! w !sudo tee > /dev/null %

"先頭行にPythonの定型文追加
command! Header call append(0, "# -*- coding: utf-8 -*-")
nnoremap <Leader>h :Header<CR>

command! CallLogger call s:logger
nnoremap <Leader>h :Calllogger<CR>

" Python　logger
function! s:logger(level)
  call append(1, "import logging")
  call append(2, "logger = logging.getLogger('" . a:level . "')")
endfunction
command! -nargs=1 Log call s:logger(<f-args>)

filetype off

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle'))
call neobundle#load_cache()  " キャッシュの読込み

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'wanshot/vim-connect-slack'

NeoBundle 'tyru/caw.vim'
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)

NeoBundle 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
nmap ; <Plug>(easymotion-s2)
xmap ; <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'QAZWSXEDCFGYHNUJMIKOLP'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
nmap / <Plug>(easymotion-sn)
xmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'tools\\update-dll-mingw',
  \   'cygwin' : 'make -f make_cygwin.mak',
  \   'mac' : 'make',
  \   'linux' : 'make',
  \   'unix' : 'gmake',
  \    },
  \ }

NeoBundleLazy 'Shougo/neocomplete.vim', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : { 'insert' : 1,}
  \ }

let s:hooks = neobundle#get_hooks("neocomplete.vim")
function! s:hooks.on_source(bundle)
let g:acp_enableAtStartup = 0
" NeoCompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smart case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#auto_completion_start_length = 3
" neocompleteを自動的にロックするバッファ名のパターン
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" _(アンダーバー)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#min_syntax_length = 3
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplete#max_list = 20
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#use_vimproc = 1
let g:neocomplete#skip_auto_completion_time = '0.2'
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion = 1
endfunction
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" if '' !=# matchstr(expand('%:t'), '\v(test|TEST).*\.py$')
"   let s:dicts_dir = '/Users/wan/.vim/dicts'
"   if isdirectory(s:dicts_dir)
"     let g:neocomplete#sources#dictionary#dictionaries = {
"           \ 'python': s:dicts_dir . '/python.dict',
"           \ }
"   endif
" endif

NeoBundle "tpope/vim-surround"
nmap <Leader>" ysiw"
nmap <Leader>' ysiw'


NeoBundle 'vim-scripts/YankRing.vim'

NeoBundle 'Shougo/vimfiler'
"セーフモードを無効にした状態で起動する
" let g:vimfiler_safe_mode_by_default = 0
nnoremap <Leader>e :VimFilerExplorer<CR>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern='\(^\.\|\~$\|\.pyc$\|\.[oad]$\)'
"タブで開く
"let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

NeoBundleLazy "Shougo/unite.vim", {
   \ "autoload": {
   \   "commands": ["Unite", "UniteWithBufferDir"]
   \ }}

NeoBundle 'Shougo/neomru.vim'
"更新時間表示
"let g:neomru#time_format = '(%Y/%m/%d %H:%M:%S) '
"
NeoBundleLazy 'Shougo/unite-outline', {
  \ "autoload": {
  \   "unite_sources": ["outline"],
  \ }}

nnoremap [unite] <Nop>
nmap <Leader>u [unite]
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>

let s:hooks = neobundle#get_hooks("unite.vim")
function! s:hooks.on_source(bundle)
  " start unite in insert mode
  let g:unite_enable_start_insert = 1
  " use vimfiler to open directory
  call unite#custom_default_action("source/bookmark/directory", "vimfiler")
  call unite#custom_default_action("directory", "vimfiler")
  call unite#custom_default_action("directory_mru", "vimfiler")
  autocmd MyAutoCmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    imap <buffer> <Esc><Esc> <Plug>(unite_exit)
    imap <buffer> jj <Plug>(unite_insert_leave)
    nmap <buffer> <Esc> <Plug>(unite_exit)
    nmap <buffer> <C-n> <Plug>(unite_select_next_line)
    nmap <buffer> <C-p> <Plug>(unite_select_previous_line)
  endfunction
endfunction
" unite_grep設定 "
let g:unite_enable_smart_case = 1
let g:unite_enable_start_insert = 1
" grep検索
nnoremap <silent> ,s  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" ディレクトリを指定してgrep検索
nnoremap <silent> ,ds  :<C-u>Unite grep -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cs :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
let g:unite_source_grep_max_candidates = 200
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --vimgrep --hidden --ignore --nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

NeoBundle "thinca/vim-quickrun"
nmap <Leader>r <Plug>(quickrun)
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={ 'runner':'vimproc',
  \  "runner/vimproc/updatetime" : 10,
  \  "outputter/buffer/close_on_empty" : 1,
  \ }

NeoBundle "nathanaelkane/vim-indent-guides"
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent = 30
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

NeoBundleLazy "miyakogi/vim-virtualenv", {
  \ "autoload": {
  \   "filetypes": ["python", "python3", "djangohtml"]
  \ }}

NeoBundleLazy 'Shougo/vim-vcs', {
  \ 'depends' : 'thinca/vim-openbuf',
  \ 'autoload' : {'commands' : 'Vcs'},
  \   }

NeoBundleLazy "lambdalisue/vim-django-support", {
  \ "autoload": {
  \ "filetypes": ["python", "python3", "djangohtml"]
  \ }}

NeoBundleLazy "nakamuray/jedi-vim", {
  \ "autoload": {
  \   "filetypes": ["python", "python3", "djangohtml"],
  \ },
  \ "build": {
  \   "mac": "pip install jedi",
  \   "unix": "pip install jedi",
  \ }}

let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
  " quickrunと被るため大文字に変更
  let g:jedi#rename_command = '<Leader>R'
  let g:jedi#completions_enabled = 1
endfunction
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

NeoBundle 'scrooloose/syntastic'
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args="--max-line-length=120"

"インデント整形をPEP8準拠（syntastixではできないので）
NeoBundleLazy 'hynek/vim-python-pep8-indent', {
  \ "autoload": {"insert": 1, "filetypes": ["python", "python3", "djangohtml"]
  \ }}

NeoBundleLazy 'pangloss/vim-javascript', {
  \   'autoload': {'filetypes': ['javascript']}
  \ }

NeoBundleLazy 'ujihisa/neco-look', {
  \ 'autoload' : { 'insert' : 1,}
  \ }

if !exists('g:neocomplete#text_mode_filetypes')
    let g:neocomplete#text_mode_filetypes = {}
endif
let g:neocomplete#text_mode_filetypes = {
      \ 'rst': 1,
      \ 'markdown': 1,
      \ 'gitrebase': 1,
      \ 'gitcommit': 1,
      \ 'vcs-commit': 1,
      \ 'text': 1,
      \ 'help': 1,
      \ 'python': 1,
      \ }

NeoBundle 'wanshot/vim-mercenary'

NeoBundle 'Shougo/neosnippet.vim'
let g:neosnippet#snippets_directory='~/.vim/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
let g:neosnippet#disable_runtime_snippets = {
  \   '_' : 1,
  \ }

NeoBundleLazy 'digitaltoad/vim-jade', {
    \ 'autoload' : {
    \     'filetypes' : 'jade',
    \    },
    \ }

NeoBundleLazy 'thinca/vim-ref', {
    \ 'autoload' : {
    \     'filetypes' : 'haskell',
    \    },
    \ }

NeoBundleLazy 'itchyny/vim-haskell-indent', {
    \ 'autoload' : {
    \     'filetypes' : 'haskell',
    \    },
    \ }

NeoBundleLazy 'eagletmt/ghcmod-vim', {
    \ 'autoload' : {
    \     'filetypes' : 'haskell',
    \    },
    \ }

" if '' !=# matchstr(expand('%:t'), '\.*\.hs$')
"   augroup ghcmodcheck
"     autocmd!
"     autocmd MyAutoCmd BufWritePost <buffer> GhcModCheckAsync
"   augroup END
" endif


NeoBundleLazy 'eagletmt/neco-ghc', {
    \ 'autoload' : {
    \     'filetypes' : 'haskell',
    \    },
    \ }
let g:haskellmode_completion_ghc = 0
" 型情報を表示
let g:necoghc_enable_detailed_browse = 1

NeoBundleLazy 'ujihisa/ref-hoogle', {
    \ 'autoload' : {
    \     'filetypes' : 'haskell',
    \    },
    \ }
nnoremap <silent> [unite]h :<C-u>Unite haskellimport<CR>

NeoBundleLazy 'ujihisa/unite-haskellimport', {
    \ 'autoload' : {
    \     'filetypes' : 'haskell',
    \    },
    \ }

NeoBundleLazy 'Rip-Rip/clang_complete', {
    \ 'autoload' : {
    \     'filetypes' : ['c','cpp'],
    \    },
    \ }

NeoBundle 'sjl/splice.vim'
let g:splice_initial_mode = 'grid'
let g:splice_initial_layout_grid = 1
let g:splice_initial_diff_grid = 1
let g:splice_initial_scrollbind_grid = 0
let g:splice_wrap = 'nowrap'

colorschem molokai
" colorschem dracula
" colorscheme flatlandia

NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
  \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
  \ 'mode_map': {'c': 'NORMAL'},
  \ 'active': {
  \   'left': [ [ 'mode','paste' ], [ 'fugitive','filename','vcs', 'virtualenv', ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'LightLineModified',
  \   'readonly': 'LightLineReadonly',
  \   'fugitive': 'LightLineFugitive',
  \   'filename': 'LightLineFilename',
  \   'fileformat': 'LightLineFileformat',
  \   'filetype': 'LightLineFiletype',
  \   'fileencoding': 'LightLineFileencoding',
  \   'mode': 'LightLineMode',
  \   'vcs': 'LightLineVCS',
  \   'virtualenv': 'LightLineVirtualEnv',
  \ }
  \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \  &ft == 'vimshell' ? vimshell#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction


"Virtualenv表示
function! LightLineVirtualEnv()
   return virtualenv#statusline()
endfunction

"vcs branch表示
function! LightLineVCS()
    return vcs#info("(%s) ⭠ [ %b ]")
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


"NeoBundle 'vim-scripts/vim-quick-radon'
"NeoBundle 'vim-pyprofiler'
" NeoBundle 'wanshot/vim-bugspots'


" NeoBundleLazy 'wanshot/vim-table-builder', {
"   \ 'autoload': {
"   \   'commands': ['TableModeToggle'],
"   \ }}
" nmap <Leader>tb :TableModeToggle<CR>
" let g:table_mode_corner_corner="+"
" let g:table_mode_header_fillchar="="

" NeoBundle 'vim-slack-client'

" if has('persistent_undo')
"   set undodir=/Users/wan/.vim/undo_history
"   augroup vimrc-undofile
"     autocmd!
"     autocmd MyAutoCmd BufReadPre ~/* setlocal undofile
"   augroup END
" endif
" とりあえず今は必要なし
" NeoBundleLazy 'wanshot/gundo.vim', {
"   \ 'autoload': {
"   \   'commands': ['GundoToggle'],
"   \ }}
" " let g:gundo_auto_preview = 0
" " 遅いので差分をプレビューしない
" nnoremap <Leader>z :GundoToggle<CR>
"vimでag検索 Unite vimを使用する為廃止
"NeoBundle 'rking/ag.vim'
" NeoBundle 'vim-gundo-support'
" let g:UndoFolder="/Users/wan/tmp"

NeoBundleSaveCache  " キャッシュの書込み
call neobundle#end()


" rst csv-table convert
command! CSV call CsvTableDirective()
nnoremap csv :CSV<CR>

let s:option_parse = {
      \"h": "   :header: ",
      \"w": "   :widths: ",
      \"c": "   :class: ",
      \}


" function! CsvTableDirective() range
"   for num in range(a:firstline, a:lastline)
"     if "" !=# matchstr(getline(num), '\v^csvtable\s*.*')
"       let end = num + 1
"       while "" !=# getline(end)
"         let end += 1
"       endwhile
"       let csv_name = matchstr(getline(num), '\v^csvtable\s\zs.*')
"       if csv_name == ""
"         let csv_line = ".. csv-table::"
"       else
"         let csv_line = ".. csv-table:: " . csv_name
"       endif
"       let repl = substitute(getline(num), getline(num), csv_line, "g")
"       call setline(num, repl)
"       for n in range(num+1, end)
"         if "" !=# matchstr(getline(n), '\v^-\a\s+\.*(,|.)*')
"           let opt = matchstr(getline(n), '\v^-\zs\a\ze')
"           let args = matchstr(getline(n), '\v^-\a\s+\zs.*(,|.)*')
"           let convert_line = s:option_parse.table_option(opt, args)
"           call setline(n, convert_line)
"           let n += 1
"           if "" == matchstr(getline(n), '\v^-\a\s+\.*(,|.)*')
"             call append(n-1, "")
"           endif
"         endif
"         if "" !=# matchstr(getline(n+1), '\v^\S+(.|,)*.$')
"           let line = '   '
"           let column_list = split(getline(n+1), ",")
"           for column in column_list
"             let line = line . '"' . column . '"' . ', '
"           endfor
"           let content_line = line[:-3]
"           call setline(n+1, content_line)
"         endif
"       endfor
"     endif
"   endfor
" endfunction
"
" function! s:option_parse.table_option(opt, args) dict
"   let line = eval("self." . a:opt)
"   let column_list = split(a:args, ",")
"   for column in column_list
"     let line = line . column . ', '
"   endfor
"   return line[:-3]
" endfunction
"
"
" "get syntax info
" "http://cohama.hateblo.jp/entry/2013/08/11/020849
" function! s:get_syn_id(transparent)
"   let synid = synID(line("."), col("."), 1)
"   if a:transparent
"     return synIDtrans(synid)
"   else
"     return synid
"   endif
" endfunction
" function! s:get_syn_attr(synid)
"   let name = synIDattr(a:synid, "name")
"   let ctermfg = synIDattr(a:synid, "fg", "cterm")
"   let ctermbg = synIDattr(a:synid, "bg", "cterm")
"   let guifg = synIDattr(a:synid, "fg", "gui")
"   let guibg = synIDattr(a:synid, "bg", "gui")
"   return {
"         \ "name": name,
"         \ "ctermfg": ctermfg,
"         \ "ctermbg": ctermbg,
"         \ "guifg": guifg,
"         \ "guibg": guibg}
" endfunction
"
" function! s:get_syn_info()
"   let baseSyn = s:get_syn_attr(s:get_syn_id(0))
"   echo "name: " . baseSyn.name .
"         \ " ctermfg: " . baseSyn.ctermfg .
"         \ " ctermbg: " . baseSyn.ctermbg .
"         \ " guifg: " . baseSyn.guifg .
"         \ " guibg: " . baseSyn.guibg
"   let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
"   echo "link to"
"   echo "name: " . linkedSyn.name .
"         \ " ctermfg: " . linkedSyn.ctermfg .
"         \ " ctermbg: " . linkedSyn.ctermbg .
"         \ " guifg: " . linkedSyn.guifg .
"         \ " guibg: " . linkedSyn.guibg
" endfunction
" command! SyntaxInfo call s:get_syn_info()

"http://d.hatena.ne.jp/thinca/20090530/1243615055
"cursorlineを必要な時にだけ有効にする
augroup vimrc-auto-cursorline
  autocmd!
  autocmd MyAutoCmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd MyAutoCmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd MyAutoCmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd MyAutoCmd WinLeave * call s:auto_cursorline('WinLeave')

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END

NeoBundleCheck

filetype plugin indent on
if filereadable("/home/local/.vimrc")
    source /home/local/.vimrc
endif
