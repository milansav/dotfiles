syntax on

""""""""""""""""""""""
" Installing plugins "
""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimsence/vimsence'
Plug 'jbgutierrez/vim-better-comments'
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte'
Plug 'morhetz/gruvbox'
Plug 'alvan/vim-closetag'
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" github.com/rstacruz/vim-coc-settings
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'codechips/coc-svelte', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

""""""""""""""""""""""
" Theming            "
""""""""""""""""""""""

color gruvbox
set background=dark

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'term'

""""""""""""""""""""""
" RPC                "
""""""""""""""""""""""

""let g:vimsence_client_id = '870579067307560980'
""let g:vimsence_small_text = 'Chad Vim'
let g:vimsence_editing_details = 'Writing spaghetti in: {}'
""let g:vimsence_small_image = 'chadvim'


"""""""""""""""""""""
" Misc              "
"""""""""""""""""""""

set nu
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set nocompatible
set backspace=indent,eol,start
set relativenumber
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=UTF-8
set clipboard=unnamedplus
set nohlsearch
set incsearch
set shell=/usr/bin/fish

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

""""""""""""""""""""
" Bracket pairs    "
""""""""""""""""""""

let g:closetag_filenames = '*.html'
let g:closetag_shortcut = '>'

""""""""""""""""""""
" Keybinds         "
""""""""""""""""""""

nnoremap <Tab> :bn<CR>

inoremap <C-V> <C-O>"+p
nnoremap <C-V> "+p
vnoremap <C-C> "+y

inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

inoremap <BS> X

nnoremap <C-X> :q!<CR>

:inoremap ii <Esc>

" Ranger
nnoremap <C-N> :RangerWorkingDirectory<CR>

" nnoremap <C-G> :Goyo<CR>:Limelight<CR>

""""""""""""""""""""
" COC              "
""""""""""""""""""""
nmap <space>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocActionAsync('format')
