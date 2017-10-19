" Vundle 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'TagList.vim'
Plugin 'cjj/cjj-statusline.git'
"Plugin 'file://D:/cjj/my-things/my-repository/vim/ny.git'
Plugin 'cjj/ny8.git'
Plugin 'cjj/ny5.git'
Plugin 'cjj/ny4.git'
Plugin 'cjj/vimqc7.git'
Plugin 'cjj/ny7.git'
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


" TagList 和 Ctags 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F8> :TlistToggle<CR>  " 设置 <F8> 为 Taglist 窗口的触发

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc -g % -o %:r.exe"
		exec "!%:r.exe"
	elseif &filetype == 'cpp'
		exec "!g++ -g % -o %:r.exe"
		exec "!%:r.exe"
	endif
endfunc



" ctags 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+='D:/cjj/software/ctags58'
"let Tlist_Ctags_Cmd='D:\cjj\software\ctags58\ctags.exe'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =30                    "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
let winManagerWindowLayout = 'FileExplorer|TagList'
let Tlist_Auto_Open = 1



" 其他设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set ignorecase
set scrolloff=3
set cmdheight=2
set number
set hlsearch
set cursorline
set laststatus=2
set showcmd
set ruler
set backspace=indent,eol,start
set history=500
set wildmenu
set fileencodings=utf-8,utf-16,cp936,ucs-bom
set fileencoding=utf-8

nnoremap <F11> "Ayy

" 类似 eclipse 的弹窗
inoremap <M-/> <c-r>=CjjPumvisible()<cr>

function! CjjPumvisible()
"    return pumvisible() ? "\<down>" : "\<C-n>\<C-p>\<down>"
    return "\<C-n>\<C-p>\<down>"
endfun

if has("syntax")
	syntax on
endif

if has('win32')
    au GUIEnter * simalt ~x
endif

colorscheme desert
set guifont=Consolas:h12:cANSI:qDRAFT

" 硕呈8MS计时转换函数
" 需将时间放在光标上
"function! Cjj_trsTimeTransform()
"	let aaa=expand("<cword>")/8
"	execute "normal A".printf("\/8=%d=%02xH", aaa, aaa)
"endfunction
"
"noremap <F2> :call Cjj_trsTimeTransform()<cr>

" 查看16进制文件
noremap <F6> :%!xxd -g 1<cr>
" 从16进制格式恢复到原文件
noremap <s-F6> :%!xxd -r<cr>
