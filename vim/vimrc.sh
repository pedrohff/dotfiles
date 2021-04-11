execute pathogen#infect()
syntax on
filetype plugin indent on

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd Filetype sh setlocal tabstop=4
set tabstop=4
set shiftwidth=4

