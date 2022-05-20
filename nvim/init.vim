:set number
:set relativenumber

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'haystackandroid/shoji'

call plug#end()

map <C-z> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
colorscheme shoji_shiro

set clipboard=unnamedplus
