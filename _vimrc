set shellslash " Windows でもパスの区切り文字を / にする

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

"---- deinの場所
let s:dein_dir = expand('~/.cache/dein')
"---- dein自体の自動インストール
let s:dein_repo_dir = s:dein_dir.'/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim' . shellescape(s:dein_repo_dir))
endif

"---- dein.vimのクローン先を指定
set runtimepath+=D:/Git-Projects/.cache/dein/repos/github.com/Shougo/dein.vim

"---- 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:dein_dir.'/plugins.toml',      {'lazy':0})
  call dein#load_toml(s:dein_dir.'/plugins_lazy.toml', {'lazy':1})
  call dein#end()
  call dein#save_state()
endif
"---- 未インストールのものがあったらインストール
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------


" ================基本設定================

set helplang=ja,en " Vimヘルプを日本語化

set ambiwidth=double " □や○文字が崩れる問題を解決

"--------------------------------------
" 文字コード
"--------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis
set fileformats=dos

"--------------------------------------
" フォント
"--------------------------------------
"set guifont=Ricty_Diminished_Discord:h13

"--------------------------------------
" 見た目系
"--------------------------------------
"syntax enable
set t_Co=256 " ターミナルを256色に対応
"set background=light
"colorscheme solarized
"let g:solarized_termcolors=256

"--------------------------------------
" ファイル編集
"--------------------------------------
set autoread " 編集中のファイルが変更されたら自動で読み直す
set hidden   " バッファが編集中でもその他のファイルを開けるように
" 編集中にファイルタイプが変更されたとき、適したプラグインとインデントに変更する
filetype plugin indent on

"--------------------------------------
" ファイルの自動生成
"--------------------------------------
set nobackup   " バックアップファイルを作らない
set noswapfile " スワップファイルを作らない
set noundofile " アンドゥファイルを作らない

"--------------------------------------
" 行
"--------------------------------------
set ruler      " 現在のカーソル位置(行、桁)を Vim ウィンドウの右下に常に表示
set number     " 行番号を表示
"set list       " 不可視文字を表示する
"set cursorline " カーソルラインをハイライト
set nowrap     " 画面の端で文字列を折り返し
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動
set scrolloff=5 " スクロールするとき、下が見える

"--------------------------------------
" 括弧・タグジャンプ
"--------------------------------------
set matchpairs& matchpairs+=<:> " 対応括弧に<と>のペアを追加
set noshowmatch " 対応する括弧を強調表示
"set matchtime=1 " 閉じ括弧を入力したときに、開き括弧に飛ぶ時間 0.x秒
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
let loaded_matchparen = 1

"--------------------------------------
" インデント
"--------------------------------------
set autoindent  " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set tabstop=2     " ファイル内の<TAB>が対応する空白の数
set noexpandtab    " ソフトタブを無効にする
"set softtabstop=2 " <TAB>を押した際に挿入される空白の数
set shiftwidth=2  " (自動)インデントの各段階に使われる空白の数

"--------------------------------------
" コマンド補完
"--------------------------------------
set wildmenu     " コマンドモードの補完
set history=2000 " コマンド履歴の数
set showcmd      " 入力中のコマンドをステータスに表示する

"--------------------------------------
" 検索
"--------------------------------------
set incsearch  " /を打った後の文字を検索
set hlsearch   " 検索結果をハイライト
set ignorecase " 大文字小文字を区別しないで検索
set smartcase  " set ignorecaseと組み合わせて使うと小文字で検索したとき区別しない
set wrapscan   " 最後まで検索すると折り返して検索
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"--------------------------------------
" マウスを有効化
"--------------------------------------
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"--------------------------------------
" ペースト設定
"--------------------------------------
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

set paste " コピーペーストするときのインデントを調整
