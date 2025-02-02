" ============================================
" Vim master dotfile
" 
" ============================================
" Vumdle setting ---
" --------------------------------------------
filetype off
set runtimepath+=~/dotfiles/vim/vundle.git/

if has('win32') || has('win64') 
  let $BASEPATH = expand('$VIMRUNTIME')
elseif has('win32unix')
  let $BASEPATH = expand('$VIMRUNTIME')
  "let $BASEPATH = expand('~/.vim')
else
  let $BASEPATH = expand('~/.vim')
endif

call vundle#rc('$BASEPATH/bundle')

Bundle 'itchyny/lightline.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet' 
Bundle 'Shougo/neosnippet-snippets'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'h1mesuke/vim-alignta'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'osyo-manga/vim-anzu'
Bundle 'tyru/restart.vim'
Bundle 'rgarver/Kwbd.vim'
"Bundle 'thinca/vim-quickrun'
"Bundle 'tyru/open-browser.vim'
"Bundle 'mattn/mkdpreview-vim'
"Bundle 'mattn/webapi-vim'
"Bundle 'basyura/jslint.vim'
"Bundle 'yuratomo/w3m.vim'
"Bundle 'vim-scripts/taglist.vim'
"Bundle 'koron/codic-vim'
"Bundle 'rhysd/clever-f.vim' 
Bundle 'tpope/vim-commentary'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'leafgarland/typescript-vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'ruby.vim'
Bundle 'savevers.vim'
Bundle 'surround.vim'
Bundle 'bufferlist.vim'
Bundle 'Markdown'
Bundle 'smartchr'
Bundle 'yanktmp.vim'
Bundle 'mrkn256.vim'
if has('win32') || has('win64') || has('win32unix')
else
    "Bundle 'mattn/googlesuggest-complete-vim'
    "Bundle 'sousu/neco-look'
    "Bundle 'sousu/neco-googlesuggest'
endif
"Bundle 'sousu/previm'
"Bundle 'sousu/VimRepress'
Bundle 'sousu/myvim'

" --- ---
filetype plugin indent on "required!

" ============================================
" 基本方針 --- 
" --------------------------------------------
" コマンドマップのLeader
" - Vim操作/環境に関するもの [,]
" - コマンド実行に関するもの [.]
"
" ============================================
" General setting --- 
" --------------------------------------------
"互換モードOFF
set nocompatible
"バックアップを取る
set backup
set backupdir=$BASEPATH/vimtmp 
set undodir=$BASEPATH/vimtmp
"swapfileの作成位置を固定する
set directory=$BASEPATH/vimtmp
"起動時前回編集点にカーソルを動かす
set viewdir=$BASEPATH/vimtmp
set viewoptions-=options
autocmd BufWritePost *.* mkview
autocmd BufReadPost *.* loadview
"autocmd BufReadPost quickfix  setlocal modifiable
"Backspace setting
set backspace=indent,eol,start
"多くの情報記憶,マーク履歴,コマンドライン履歴,検索履歴
set viminfo='10000,:10000,/10000
"履歴数
set history=10000
"コマンドラインの行数
set cmdheight=1
"コマンドラインでの補完候補表示
set wildmenu
"set wildmode=longest:full
"編集無しでも強制移動
set hidden
"htmlツールバー オフ
let g:no_html_toolbar = 'yes'
"xhtml用に(小文字)
let g:do_xhtml_mappings = 'yes'
"折り返しなし
set nowrap
"256色
set t_Co=256

" ============================================
" Editer setting ---
" --------------------------------------------
"オートインデントする
set autoindent	
"改行後にBSを押すと上の行末に移動する
"set backspace=1 
"改行後にBSを押すと上の行末の1文字を消去する
"set backspace=2
"検索時に最後まで行ったら最初に戻る
set wrapscan
"シンタックスハイライトを有効にする
syntax on
"行番号を表示する
set number
"移動幅（オートインデント等の挿入する見た目の文字数）
set shiftwidth=2
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
set matchtime=1
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"タブをスペースに置き換える
set expandtab
"入力中のコマンドをステータスに表示する
set showcmd
"ステータスラインを常に表示
set laststatus=2 
set ruler
"文字コード
" - encoding 
"    vim内部で使用される文字コード，表示に使うコードもこれ
" - fileencoding 
"    バッファローカルに設定される文字コード，encodingと一致していない場合は読み書きにおいて変換
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
" - 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
"改行コードの自動認識
set fileformats=unix,dos,mac
"特殊な記号などの文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
"filetypeの検出
filetype plugin on
"インクリメンタルサーチ
set incsearch
"検索時に大文字小文字を無視,混入する時のみ判別
set ignorecase 
set smartcase
"検索結果ハイライト
set hlsearch
"OSのクリップボードを使う
"set clipboard& clipboard+=unnamed
"Terminalにおける遅延関係
set lazyredraw
set ttyfast
" buffer移動時cdをcurrentに
autocmd BufEnter * execute ":lcd " . substitute(expand("%:p:h")," ","\\\\ ","g")
"モードライン有効化
set modelines=1
"行幅
set textwidth=0
"ビープ音を消す
set visualbell t_vb=

" ============================================
" View ---
" --------------------------------------------
" カラー設定
colorscheme my_desert
" スクロール時余白を確保
set scrolloff=9
" ポップアップメニューのカラー
highlight Pmenu ctermbg=darkblue ctermfg=black
highlight PmenuSel ctermbg=darkgreen ctermfg=black
highlight PmenuSbar ctermbg=darkgray 

" ============================================
" Key bind & map ---
" --------------------------------------------
nmap J <C-d>
nmap K <C-u>
" バッファ操作
nmap gr <ESC><C-w><C-w>
nmap gt :bn<CR>
nmap gf :bp<CR>
"nmap L :call BufferList()<CR>
nmap L :Unite buffer<CR>
nmap X :BufOnly<CR>
nmap <space><space> :e #<CR>
" 分割を維持したまま現在バッファを消す
nmap ,q <ESC>:Kwbd<CR><ESC>:call BufferList()<CR>
" バッファ分割
nmap ,L <ESC>:spl<CR>
nmap ,l <ESC>:vspl<CR>
nmap +  <C-W>1>
nmap -  <C-W>1<
nmap W  <C-W>1+
" 前回位置を記憶の上マークへの移動
nmap <space> `
nmap ,m <ESC>:marks<CR>
" Escの2回押しでハイライト消去
"nmap <ESC><ESC> :nohlsearch<CR><ESC>
" 括弧挿入
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>
"inoremap || ||<LEFT>

" Increase/Decrease
nnoremap + <C-a>
nnoremap - <C-x>

nmap <C-i> ^
nmap <C-a> $

" 設定再読み込み
nmap ,v :source ~/.vimrc<CR>
" 引数を与えて実行" 
nmap .e <esc>:wall<CR>:!% <CR>
nmap .E <esc>:wall<CR>:!% 
" カーソル上のワードで置換
nmap ,s :%s/<C-R><C-W>//gc<Left><Left><Left>
" vimgrep操作 キー上の単語でvimgrep
nmap ,g :vimgrep /<C-R><C-W>/ **/*
" vimgrep実行時自動でQuickfixを開く
autocmd QuickfixCmdPost vimgrep copen
" QuickfixやPreview全般を消す
nmap ,r :ccl<CR>:pc<CR>
" ctags読込+リスト表示
nmap ,t <ESC>:Tlist<CR>
" q誤爆防止
nnoremap q <Nop>
nnoremap qq q
" バックアップフォルダ読出
nmap ,b :e $BASEPATH/vimtmp<CR>

" ============================================
" For plugin --- 
" --------------------------------------------
" --- jslint ---
"autocmd FileType javascript call s:javascript_filetype_settings()
"function! s:javascript_filetype_settings()
"  "ifenautocmd BufLeave     <buffer> call jslint#clear()
"  "ifenautocmd BufWritePost <buffer> call jslint#check()
"  "ifenautocmd CursorMoved  <buffer> call jslint#message()
"endfunction

" --- yanktmp ---
let g:yanktmp_file = $BASEPATH . '/vimtmp/.__yanktmp__'
map <silent> sy <ESC>:call YanktmpYank()<CR> 
map <silent> sp <ESC>:call YanktmpPaste_p()<CR> 
map <silent> sP <ESC>:call YanktmpPaste_P()<CR> 

" --- Vimpress.vim ---
"function! Vimpress_new()
"    :BlogNew
"endfunction
"function! Vimpress_list()
"    :BlogList
"endfunction
"nmap ,l <ESC>:BlogList<CR>
"nmap ,w <ESC>:BlogSave 

" --- quickrun.vim --- 
"let g:quickrun_config = {
"\   '*': {
"\      'hook/shebang/enable': 0,
"\      'outputter/error/error'   : 'quickfix',
"\      'outputter/buffer/close_on_empty' : 1,
"\   },
"\}
"set splitbelow

" --- savevers.vim --- 
set patchmode=.back
let savevers_types = "*"
let savevers_dirs = &backupdir
let savevers_max = 90

"" --- neocomplcache ---
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_auto_completion_start_length = 3
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 0
" Use underbar completion. _ による曖昧検索
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\   'default' : '',
\   'markdown' : $BASEPATH.'/dict/markdown'
\}
let g:neocomplcache_snippets_dir = $BASEPATH.'/snippets'
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" 補完コードソート順
if !exists('g:neocomplcache_plugin_rank')
  let g:neocomplcache_plugin_rank = {}
endif
let g:neocomplcache_plugin_rank.buffer_complete = 90
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif

" SuperTab like snippets behavior. <CR>: close popup and save indent.
let g:neocomplcache_enable_auto_select = 0  "最初の候補を選択
inoremap <expr><CR> neocomplcache#smart_close_popup() . (&indentexpr != '' ? "\<C-f>\<CR>X\<BS>":"\<CR>")
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

" --- snippets ---
" snippetsディレクトリは直接リポジトリのファイルを指定
if !exists("g:neosnippet#snippets_directory")
    let g:neosnippet#snippets_directory=""
endif
let g:neosnippet#snippets_directory='~/dotfiles/vim/snippets'
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" --- unite.vim ---
" startup定義
let g:unite_source_alias_aliases = {
\   "startup_file_mru" : { "source" : "file_mru" },
\   "startup_directory_mru" : { "source" : "directory_mru" },
\   "memos" : { "source" : "file_rec/async" },
\}
call unite#custom_max_candidates("startup_file_mru", 100)
call unite#custom_max_candidates("startup_directory_mru", 30)
"call unite#custom#source('memos','ignore_pattern','\(msg\|pdf\|doc\|docx\|xls\|xlsx\|ppt\|pptx\)$')
"call unite#custom#source('memos','matchers','*.msg')

if !exists("g:unite_source_menu_menus")
    let g:unite_source_menu_menus = {}
endif
"let g:unite_source_menu_menus.startup = {
"\   "description" : "startup menu",
"\   "command_candidates" : [
"\       [ "vimrc",  "edit " . $MYVIMRC ],
"\       [ "gvimrc", "edit " . $MYGVIMRC ],
"\       [ "unite-file_mru", "Unite file_mru" ],
"\       [ "unite-directory_mru", "Unite directory_mru" ],
"\   ]
"\}
command! UniteStartup
\   Unite
\   output:echo:"===:file:mru:===":! startup_file_mru
\   output:echo:":":!
\   output:echo:"===:note:===":! file:~/Dropbox/tools/blog/_posts
\   output:echo:":":!
\   -hide-source-names
\   -no-split
"\   -quick-match
"\   output:echo:"===:directory:mru:===":! startup_directory_mru
"\   output:echo:":":!
nmap U <esc>:UniteStartup<cr>
"augroup startup
"    autocmd!
"    autocmd VimEnter * :UniteStartup
"augroup END
" 入力モードで開始する
let g:unite_enable_start_insert=1
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " ESCキー押すと終了
  imap <silent><buffer> <ESC> <C-u><C-h>
endfunction

" --- yankring ---
let g:yankring_history_dir=$BASEPATH . '/vimtmp'

" --- vim-anzu ---
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
nmap <Esc><Esc> :nohlsearch<cr><Plug>(anzu-clear-search-status)

" --- bufferlist ---
let g:BufferListWidth = 40
let g:BufferListMaxWidth = 60

" --- minibufexpl ---
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBuffs = 1

" --- bufftabs ---
let g:buftabs_only_basename=1 "ファイル名だけ表示
"let g:buftabs_in_statusline=0 
let g:buftabs_active_highlight_group="Visual"

" --- codic-vim ---
"nmap .c :Codic 

" --- googlesuggest --- 
"let g:googlesuggest_language = 'en'

" --- go-lang ---
if !exists('g:neocomplete#omni_patterns')
    let g:neocomplete#omni_patterns = {}
endif
let g:neocomplete#omni_patterns.go = '\h\w*\.\?'

let g:go_bin_path = expand("~/bin/go/bin")
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
let g:go_fmt_command = "gofmt"
let g:go_disable_autoinstall = 1


