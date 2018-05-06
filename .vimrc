set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"下面这个插件装不了
"plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'Valloric/YouCompleteMe'

"安装deus主题
Plugin 'ajmwagar/vim-deus'
"Plugin 'Lokaltog/vim-powerline' "status 美化 
"安装语法检查
Plugin 'scrooloose/syntastic'
" 折叠代码
Plugin 'tmhedberg/SimpylFold'
"安装flake8
Plugin 'nvie/vim-flake8'

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/indentpython.vim'

" 安装Onedark主题
Plugin 'joshdick/onedark.vim'

" lightline
Plugin 'itchyny/lightline.vim'

"多行编辑
Plugin 'terryma/vim-multiple-cursors'

"补全括号
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
" PEP8风格缩进
au BufNewFile,BufRead *.py
\ set tabstop=4|
\ set softtabstop=4|
\ set shiftwidth=4|
"\ set textwidth=79|
\ set expandtab|
\ set autoindent|
\ set fileformat=unix|

au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2|
\ set softtabstop=2|
\ set shiftwidth=2|

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Error /\s\+$/
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF



let python_highlight_all=1
syntax on


let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


set nu

set clipboard=unnamed

set shortmess=atI "关闭乌干达提示
set t_Co=256
"""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""VIM THEME"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""
"设置deus主题
"set termguicolors
"
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"
"set background=dark " Setting dark mode
"
"colorscheme deus
"
"let g:deus_termcolors=256
""""""""""""""""""""""""""
" lightline settings

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
set noshowmode
set laststatus=2
"设置OneDark
syntax on
let g:onedark_termcolors=256
colorscheme onedark

"""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""END"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""

"退格键修复
set backspace=indent,eol,start
"自动添加py文件注释
function HeaderPython()
    call setline(1, "#!/usr/bin/env python3.6")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, "# everglow @ " . strftime('%Y-%m-%d %T', localtime()))
    normal G
    normal o
    normal o
endf

autocmd bufnewfile *.py call HeaderPython()

"YouCompleteMe设置
let g:ycm_server_python_interpreter='/usr/bin/python3.6'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"关闭ycmpreview
"set completeopt-=preview
"补全后关闭preview
let g:ycm_autoclose_preview_window_after_completion = 1
"ycm:回车选中当前项
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |

"设置匹配模式
set showmatch
"vim系统粘贴
set clipboard+=unnamed
