execute pathogen#infect()
syntax on
filetype plugin indent on

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
#https://vim.fandom.com/wiki/Toggle_auto-indenting_for_code_paste
#paste
