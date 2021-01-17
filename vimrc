" --- Start of vundle configuration ---
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'

call vundle#end()
filetype plugin indent on
" --- End of vundle configuration ---

syntax on

set showcmd  " bottom line will show information about command
set wildmenu " visual autocomplete for command menu
set hlsearch " highlight matches when searching
set incsearch " incremental searching
set ignorecase " searches while ignoring case
set smartcase " unless the search contains 1+ capital letters

" NERDTree: Open/Close with backslash
nmap \ :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" NERDCommenter: Change leader from \ to ,
nnoremap ,/ :call NERDComment(0, "toggle")<Enter>
vnoremap ,/ :call NERDComment(0, "toggle")<Enter>

" General
set autoindent                  " Minimal automatic indenting for any filetype
set backspace=indent,eol,start  " Proper backspace behavior
set expandtab                   " Expand tabs to spaces
set mouse=a                     " Enable mouse support in all modes
set number                      " Display line numbers
set nowrap                      " Do not automatically wrap text on load
set formatoptions-=t            " Do not automatically wrap text when typing
set clipboard=unnamedplus       " Use X Windows clipboard
set signcolumn=yes              " Always show the sign column

" Cursor lines
set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=000 guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=000 guibg=darkred guifg=white

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
hi ColorCOlumn ctermbg=000

" Set footer theme
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1

" Vertical and horizontal split configs
set splitbelow  " :sp will split the pane below the current
set splitright  " :vsp will split the pane to the right of the current
nnoremap <C-J> <C-W><C-J>  " Ctrl + J = move to the pane down
nnoremap <C-K> <C-W><C-K>  " Ctrl + K = move to the pane up
nnoremap <C-L> <C-W><C-L>  " Ctrl + L = move to the pane right
nnoremap <C-H> <C-W><C-H>  " Ctrl + H = move to the pane left

" Buffer navigation shortcuts
set hidden
nnoremap <C-N> :bnext<CR>  " Ctrl + N = show next buffer
nnoremap <C-P> :bprev<CR>  " Ctrl + P = show previous buffer

" Disable auto-commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Change the shape of the cursor when toggling read-only/insert modes
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" Press <Tab> and <Shift+Tab> to indent/unindent a highlighted block
" and keep highlight
vmap <Tab> >gv
vmap <S-Tab> <gv

" Support the write command when lazily typing W (as opposed to w)
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Write     <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar                                  -bang Wqall     wqa<bang>
command! -bar -nargs=* -complete=file -range=% -bang We        <line1>,<line2>w<bang> | e <args>
command! -bar -nargs=* -complete=file -count   -bang Wnext     <count>wnext<bang> <args>
command! -bar -nargs=* -complete=file -count   -bang Wprevious <count>wprevious<bang> <args>

" Support the quit command when lazily typing Q (as opposed to q)
command! Q q
command! WQ wq

" Gitgutter config for changes
set updatetime=250  " Refresh faster than the default 4000ms
set signcolumn=yes  " Always show the sign (gutter) column
highlight! link SignColumn LineNr  " Number and sign columns have the same bg

" --- Language-specific configs ---
" Map <za> to Space for folding code/methods
nnoremap <space> za

" Language linters
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \}
