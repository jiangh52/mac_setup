" Basic Setting
syntax on
colorscheme monokai

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set number

"Cursor movement control
nnoremap j gj
nnoremap k gk

""""""""""""""""""""""""""
" Nerdtree config
""""""""""""""""""""""""""
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"""""""""""""""""""""""""
" Encode related
"""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
