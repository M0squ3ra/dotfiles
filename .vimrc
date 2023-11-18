" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
set number
syntax on
filetype on
filetype plugin on
filetype indent on
colorscheme sonokai
set cursorline
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set updatetime=100
set signcolumn=auto
set noswapfile

"Make the changes take effect: :source ~/.vimrc

" FOLDING
" zo: open a single fold under the cursor
" zc: close the fold under the cursor
" zR: open all folds
" zM: close all folds


" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
	Plug 'dense-analysis/ale'	" linter
	Plug 'preservim/nerdtree'	" file explorer
					" change tab: ctrl + ww
	Plug 'tpope/vim-fugitive'	" :G <git command>
	Plug 'airblade/vim-gitgutter'	" git diff, etc
call plug#end()
" After adding de plugins: :PlugInstall
" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=
" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R
" Use a divider to separate the left side from the right side.
set statusline+=%=
" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" Show the status on the second to last line.
set laststatus=2

" }}}
