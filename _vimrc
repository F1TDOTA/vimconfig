source $VIMRUNTIME/vimrc_example.vim

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
 

"===========================
" 基本设置
"===========================
"该选项使用于缓冲的文本(你正在编辑的文件)，寄存器，Vim 脚本文件等等。你可以把 'encoding' 选项当作是对 Vim 内部运行机制的设定。
set encoding=utf-8

"该选项代表输出到客户终端（Term）采用的编码类型。
set termencoding=utf-8

"vim写入文件时采用的编码类型
set fileencoding=utf-8

"gvim打开支持编码的文件
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1

"设置字体为Monaco，大小10
set guifont=Monaco:h10

"防止特殊符号无法正常显示
set ambiwidth=double

"模仿windows快捷键 Ctrl+A全选、Ctrl+C复制、Ctrl+V粘贴
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin 

"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim提示信息乱码的解决
language messages zh_CN.utf-8

"打开文件类型检测
filetype plugin indent on

"配色方案
colorscheme desert

"WIN启动最大化
autocmd GUIEnter * simalt ~x

"设置中文帮助文档（需要下载中文帮助文档）
set helplang=cn

"根据文件中其他地方的缩进空格个数来确定一个tab是多少个空格
set smarttab

"表示一个tab显示出来4个空格
set tabstop=4

"编辑时将所有tab替换为空格
set expandtab

"在编辑的时候（比如按退格或 tab 键）一个 tab 是多少个空格
set softtabstop=4

"每一级缩进是多少个空格
set shiftwidth=4

"设置显示行号
set nu!

"设置自动换行/不自动换行
set wrap
"set nowrap

"整词换行，与自动换行搭配使用
set linebreak

"隐藏菜单栏和工具栏
"Toggle Menu and Toolbar

"显示制表符
"set list

"隐藏工具栏
set guioptions-=T

"隐藏菜单栏
"set guioptions-=m

"在光标接近底端或顶端时，自动下滚或上滚
set scrolloff=5

"不生成备份文件
set nobackup

"设置当文件在外部被修改，自动更新该文件
set autoread

"设置tab的顶部标签栏，0为隐藏，1为新建显示，2为始终显示
set showtabline=2

"设置在任何模式下鼠标都可用
set mouse=a

"保留历史记录
set history=500

"设置退格键可用
set backspace=2

"自动设置当前目录为正在编辑的目录
set autochdir

"自动隐藏没有保存的缓冲区，切换buffer时不给出保存当前buffer的提示
set hidden

"突出显示当前行
set cursorline


"===========================
" 查找/替换相关的设置
"===========================
"高亮显示查找结果
set hlsearch
"增量查找
set incsearch



"===========================
" 状态栏的设置
"===========================
"显示文件名：总行数，总的字符数
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

"在编辑过程中，在右下角显示光标位置的状态行
set ruler


"===========================
" 代码设置
"===========================
syntax enable					"打开语法高亮
syntax on						"打开语法高亮
set showmatch					"设置匹配模式，相当于括号匹配
set smartindent					"智能对齐
"set shiftwidth=4				"换行时，交错使用4个空格
set autoindent					"设置自动对齐
set ai!							"设置自动缩进
"set cursorcolumn				"启用光标列
"set cursorline					"设置高亮当前行(这里我注释了)
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set guicursor+=a:blinkon0		"设置光标不闪烁
set fdm=indent					"

"设置为自动关闭折叠 
"set foldclose=all 
 

inoremap { {}<ESC>i 
hi MatchParen ctermbg=DarkRed guibg=lightblue  
set clipboard=unnamed

"set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan " 禁止在搜索到文件两端时重新搜索
"set incsearch " 输入搜索内容时就显示搜索结果
"set hlsearch " 搜索时高亮显示被找到的文本
"set noerrorbells " 关闭错误信息响铃
"set novisualbell " 关闭使用可视响铃代替呼叫
"set t_vb= " 置空错误铃声的终端代码
" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2 " 短暂跳转到匹配括号的时间
"set magic " 设置魔术
"set backspace=indent,eol,start " 不设定在插入状态无法用退格键和Delete 键删除回车符
"set cmdheight=1 " 设定命令行的行数为 1
"set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\%c:%l/%L%)\ 
" 设置在状态行显示的信息

"set nofoldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为
"set foldclose=all " 设置为自动关闭折叠 
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 用空格键来开关折叠


