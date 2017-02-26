"  _      ______ _____  _____/ /_  ____  / /_
" | | /| / / __ `/ __ \/ ___/ __ \/ __ \/ __/
" | |/ |/ / /_/ / / / (__  ) / / / /_/ / /_
" |__/|__/\__,_/_/ /_/____/_/ /_/\____/\__/

set encoding=utf-8
scriptencoding utf-8
augroup MyAutoCmd
  autocmd!
augroup END

let $PYTHON3_DLL = '/usr/local/Cellar/python3/3.5.0/Frameworks/Python.framework/Versions/3.5/lib/python3.5'

"個人情報
if filereadable(expand('~/.vimrc_secret'))
  source ~/.vimrc_secret
endif

set tabstop=2 shiftwidth=2 softtabstop=0


if has("autocmd")
  filetype plugin on
  filetype indent on
  autocmd MyAutoCmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType go         setlocal sw=4 sts=4 ts=4 noexpandtab
  autocmd MyAutoCmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType htmldjango setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType python     setlocal sw=4 sts=4 ts=4 et omnifunc=jedi#completions completeopt-=preview
  autocmd MyAutoCmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd MyAutoCmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd MyAutoCmd FileType rst        setlocal sw=3 sts=3 ts=3 et
  autocmd MyAutoCmd FileType pug        setlocal sw=4 sts=4 ts=4 et
endif

" Golang Setting
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1

" 方向キーの無効化
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" リーダーキーをスペースに
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

" 削除した内容をクリップボードに入れない(YankRing以外)
nnoremap x "_x
nnoremap dd "_dd
nnoremap ciw "_ciw
vnoremap x "_x
vnoremap dd "_dd
vnoremap ciw "_ciw

" Insertモードのときカーソルの形状を変更
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 0で改行
command! LineBreak call append(expand('.'), '')j
nnoremap 0 :LineBreak<CR>

" 9で末尾スペース削除
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
set autoindent          " 自動でインデントを行う
set smartindent         " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent             " Cプログラムファイルの自動インデントを始める
set number              " 行番号表示
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト
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
autocmd FileType python :let &colorcolumn=join(range(121,255),",")
autocmd FileType python :highlight ColorColumn ctermbg=235 guibg=#2c2d27

set t_vb=
set novisualbell
set list
set listchars=tab:\ \ ,trail:-,extends:»,precedes:«,nbsp:%
" set cursorline " カーソルライン表示

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus,unnamed
else
    set clipboard& clipboard+=unnamed
endif

cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
inoremap <silent>jj <Esc>
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

command! JsonFormat :execute '%!python -m json.tool'
 \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
 \ | :set ft=javascript
 \ | :1


filetype off

call plug#begin('~/.vim/plugged')
Plug 'tyru/caw.vim'
Plug 'Shougo/neocomplete.vim' | Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'LeafCage/yankround.vim'
Plug 'Shougo/vimfiler'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'thinca/vim-quickrun'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'miyakogi/vim-virtualenv', { 'for': ['python', 'python3', 'djangohtml'] }
Plug 'Shougo/vim-vcs', { 'on' : 'Vcs'} | Plug 'thinca/vim-openbuf'
Plug 'lambdalisue/vim-django-support', { 'for': ['python', 'python3', 'djangohtml'] }
Plug 'davidhalter/jedi-vim', { 'for': ['python', 'python3'], 'do': 'pip install jedi' } | Plug 'nakamuray/jedi-rpc.vim' , { 'for': ['python', 'python3'] }
"インデント整形をPEP8準拠（syntastixではできないので）
Plug 'hynek/vim-python-pep8-indent', { 'for': ['ython', 'python3', 'djangohtml'] }
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ujihisa/neco-look'
Plug 'wanshot/vim-mercenary'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'sjl/splice.vim'
Plug 'itchyny/vim-parenmatch'
Plug 'itchyny/lightline.vim'
call plug#end()

"---------- tyru/caw.vim ----------"
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)

"---------- Shougo/neocomplete.vim ----------"
autocmd! User neocomplete.vim call s:neocomplete_hook()
function! s:neocomplete_hook()
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
      \ 'go': 1,
      \ 'c': 1,
      \ }

"---------- Shougo/vimfiler ----------"
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

"---------- Shougo/unite.vim ----------"
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
nnoremap <silent> [unite]y :<C-u>Unite yankround<CR>

" start unite in insert mode
let g:unite_enable_start_insert = 1
autocmd! User unite.vim call s:unite_hook()
function! s:unite_hook()
  " use vimfiler to open directory
  call unite#filters#matcher_default#use("matcher_regexp")
  call unite#custom_default_action("source/bookmark/directory", "vimfiler")
  call unite#custom_default_action("directory", "vimfiler")
  call unite#custom_default_action("directory_mru", "vimfiler")
endfunction

autocmd MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <Esc><Esc> <Plug>(unite_exit)
  imap <buffer> jj <Plug>(unite_insert_leave)
  nmap <buffer> <Esc> <Plug>(unite_exit)
  nmap <buffer> <C-n> <Plug>(unite_select_next_line)
  nmap <buffer> <C-p> <Plug>(unite_select_previous_line)
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

"---------- thinca/vim-quickrun ----------"
nmap <Leader>r <Plug>(quickrun)
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={ 'runner':'vimproc',
  \  "runner/vimproc/updatetime" : 10,
  \  "outputter/buffer/close_on_empty" : 1,
  \ }

"---------- nathanaelkane/vim-indent-guides ----------"
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent = 30
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

let g:indent_guides_exclude_filetypes = [
 \ 'help',
 \ 'unite',
 \ 'vimfiler',
 \ 'go',
 \ ]

"---------- davidhalter/jedi-vim ----------"
autocmd! User jedi-vim call s:jedivim_hook()
function! s:jedivim_hook()
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
let g:neocomplete#force_omni_input_patterns.go = '\h\w\.\w*'

"----------  nakamuray/jedi-rpc.vim ----------"
let g:jedi_rpc#python = 'python'

"---------- scrooloose/syntastic ----------"
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_python_flake8_args="--max-line-length=120"
let g:syntastic_python_flake8_args='--ignore=E501'

"---------- sjl/splice.vim ----------"
let g:splice_initial_mode = 'grid'
let g:splice_initial_layout_grid = 1
let g:splice_initial_diff_grid = 1
let g:splice_initial_scrollbind_grid = 0
let g:splice_wrap = 'nowrap'

"---------- itchyny/vim-parenmatch ----------"
" 標準のmatchparenを使うのをやめる
let g:loaded_matchparen = 1

"---------- itchyny/lightline.vim ----------"
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
  \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
  \ 'mode_map': {'c': 'NORMAL'},
  \ 'active': {
  \   'left': [ [ 'mode','paste' ], [ 'filename','vcs', 'virtualenv', ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'LightLineModified',
  \   'readonly': 'LightLineReadonly',
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
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

"Virtualenv表示
function! LightLineVirtualEnv()
  try
    if exists('*virtualenv#statusline')
      return virtualenv#statusline()
    endif
  endtry
  return ''
endfunction

"vcs branch表示
function! LightLineVCS()
  try
    if  exists('*vcs#info')
      return vcs#info("(%s) ⭠ [ %b ]")
    endif
  endtry
  return ''
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

colorschem molokai
" colorschem dracula
"colorscheme flatlandia

filetype plugin indent on
if filereadable("/home/local/.vimrc")
    source /home/local/.vimrc
endif
