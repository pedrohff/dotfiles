:set number
:set relativenumber

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'psliwka/vim-smoothie'
Plug 'sainnhe/everforest'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do':'CocInstall coc-go'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" NERDTree
" ---------------------------------------------------------------------
map <C-z> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeGitStatusWithFlags = 1

"Everforest theme
" ---------------------------------------------------------------------
if has('termguicolors')
	set termguicolors
endif
set background=dark
let g:everforest_background = 'medium'
let g:everforest_better_performance = 1
colorscheme everforest


set clipboard=unnamedplus

" Source VIMRC
" ---------------------------------------------------------------------
nnoremap <C-s><C-v> :source $MYVIMRC<CR>

" FZF
" ---------------------------------------------------------------------
nnoremap <C-f> :FZF<CR>
nnoremap <C-f><C-f> :Ag<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
let g:fzf_history_dir = '~/.config/nvim/fzf-history'


" Use ctrl-[hjkl] to select the active split!
" ---------------------------------------------------------------------
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Remove Go's "go to definition" mapping
let g:go_def_mapping_enabled = 0

source ~/.config/nvim/coc.vim
