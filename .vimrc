set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'morhetz/gruvbox'
Plugin 'junegunn/vim-easy-align'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'tikhomirov/vim-glsl'
Plugin 'dense-analysis/ale'
Plugin 'tc50cal/vim-terminal'
Plugin 'sophacles/vim-bundle-mako'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
syntax enable

set et
set tabstop=4
set sw=4
set smarttab
set paste
set backspace=indent,eol,start
set noswapfile
set nowrap
set hlsearch

set termguicolors
set background=dark
colorscheme gruvbox

" hide the scratch preview
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

map <leader>r <esc>:w\|!python3 %<cr>
map <leader>sv :source ~/.vimrc<cr>
map <leader>ev :e ~/.vimrc<cr>
map <bs> <c-^>

nmap <silent> <c-Up> :wincmd k<CR>
nmap <silent> <c-Down> :wincmd j<CR>
nmap <silent> <c-Left> :wincmd h<CR>
nmap <silent> <c-Right> :wincmd l<CR>

nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

" see syntax matching for color scheme tweaking
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" hlsl syntax highlighting
autocmd! BufNewFile,BufRead *.hlsl set ft=glsl

" hack city
autocmd! BufNewFile,BufRead :source ~/.vimrc



highlight ExtraWhitespace ctermbg=red guibg=red
" The following alternative may be less obtrusive.
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Try the following if your GUI uses a dark background.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Show tabs that are not at the start of a line:
match ExtraWhitespace /[^\t]\zs\t\+/

" trailing whitespace at end of line
match ExtraWhitespace /\s\+$/

" Show spaces used for indenting (so you use only tabs for indenting).
"match ExtraWhitespace /^\t*\zs \+/

" show tabs as >>>>
highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>
set et

let skip_defaults_vim=1
filetype indent off


" js code linting
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" disable by default
let g:ale_enabled = 0
