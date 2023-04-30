inoremap df <Esc>
map <C-j> 6j
map <C-k> 6k
map <CR> O<Esc>
map ' dd
noremap m ZZ
noremap ZZ <Esc>
set expandtab                   
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
