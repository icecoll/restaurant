set nocompatible 
filetype off    


syntax on
"common conf {{
set ai
set bs=2
set showmatch
set laststatus=2
set expandtab
set shiftwidth=4
set tabstop=4
set cursorline
set number
set autoread
set ignorecase
set fileencodings=uft-8,gbk "使用 utf-8 或 gbk 打开文件
set hls "检索时高亮显示匹配项
set helplang=cn
set foldmethod=syntax
"}}

 "NERDTree配置{{{
map <n-t-t> :NERDTreeToggle<CR>
map <C-F1> :NERDTreeFind<CR>
let NERDTreeChDirMode=2
"选中root即设置为当前目录
let NERDTreeQuitOnOpen=1
"打开文件时关闭树
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1
"不显示帮助面板
let NERDTreeDirArrows=1
"目录箭头
"}}}

"configuration for ctags{{{
let Tlist_Use_Right_Window = 1 "让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close = 1 "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_Show_One_File = 1 "只显示一个文件中的tag，默认为显示多个
let Tlist_Sort_Type ='name' "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 1 "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 32 "设置窗体宽度为32，可以根据自己喜好设置
let Tlist_Ctags_Cmd ='/usr/bin/ctags' "这里比较重要了，设置ctags的位置
map t :TlistToggle "热键设置，我设置成Leader+t来呼出和关闭Taglist
"}}}
let mapleader = ','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>
"conf for plugins {{ 插件相关的配置
"状态栏的配置
"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'

Plugin  'The-NERD-tree'
 
Bundle 'taglist.vim' 

"
" 其他插件
"

call vundle#end() "
filetype plugin indent on "

