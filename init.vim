" === Add this to ~/.config/nvim/init.vim ===
" Install vim-plug if it doesn't exist on system
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ----- PLUGINS ----- "
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'			      " Line numbers and state on left of document
  Plug 'dense-analysis/ale'			          " Display warnings/errors (esp linting) in real-time
  Plug 'preservim/nerdcommenter'		      " Used for block-commenting shortcut
  Plug 'preservim/nerdtree'			          " Folder navigation within vim
  Plug 'rebelot/kanagawa.nvim'            " Neovim color scheme
  Plug 'ryanoasis/vim-devicons'           " Display icons in Vim and plugins
  Plug 'sheerun/vim-polyglot'		          " Language pack for syntax highlighting
  Plug 'vim-airline/vim-airline'		      " Better UI footer info
  Plug 'vim-airline/vim-airline-themes'		" Better UI footer appearance
  Plug 'mileszs/ack.vim'			            " File search within vim (like thesilversearcher)
"  Plug 'ycm-core/YouCompleteMe'			    " Code completion within vim
call plug#end()


" ----- CONFIGURATION ----- "
colorscheme kanagawa


" Transparent background
highlight Normal ctermbg=NONE guibg=NONE


" Set formatting behavior
" c = auto-wrap comments using text-width + auto-insert comment leader
" r = auto-insert comment leader after pressing Enter
" o = auto-insert comment leader after pressing 'o' in Normal mode
set formatoptions-=cro


set autoindent                  " Minimal automatic indenting for any filetype
set backspace=indent,eol,start  " Proper backspace behavior
set clipboard=unnamedplus       " Use X Windows clipboard
set expandtab                   " Expand tabs to spaces
set formatoptions-=t            " Do not automatically wrap text when typing
set hlsearch			              " Highlight matches when searching
set ignorecase			            " Searches while ignoring case
set incsearch			              " Incremental searching
set mouse=a                     " Enable mouse support in all modes
set nowrap                      " Do not automatically wrap text on load
set number                      " Display line numbers
set showcmd			                " Bottom line will show information about command
set signcolumn=yes              " Always show the sign column
set smartcase			              " Unless the search contains 1+ capital letters
set ttyfast                     " Speed up scrolling in Vim
set wildmenu			              " Visual autocomplete for command menu
set wildmode=longest,list       " Get bash-like tab completions


" Cursor lines
set cursorcolumn
set cursorline


" Make it obvious where 80 characters is
set cc=80


" Set footer theme
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1


" Gitgutter config for changes
set updatetime=250			" Refresh faster than the default 4000ms
set signcolumn=yes			" Always show the sign (gutter) column
highlight! link SignColumn LineNr	" Number and sign columns have the same bg


" Use The Silver Searcher for Ack
let g:ackprg = 'ag --nogroup --nocolor --column'


" Map <za> to Space for folding code/methods
nnoremap <space> za

" NERDTree: Open/Close with backslash
nmap \ :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1


" NERDCommenter: Change leader from \ to ,
nnoremap ,/ :call nerdcommenter#Comment(0, "toggle")<Enter>
vnoremap ,/ :call nerdcommenter#Comment(0, "toggle")<Enter>


" Press <Tab> and <Shift+Tab> to indent/unindent a highlighted block and keep highlight
vmap <Tab> >gv
vmap <S-Tab> <gv


" Vertical and horizontal split configs
set splitbelow	" :sp will split the pane below the current
set splitright	" :vsp will split the pane to the right of the current
nnoremap <C-J> <C-W><C-J>  " Ctrl + J = move to the pane down
nnoremap <C-K> <C-W><C-K>  " Ctrl + K = move to the pane up
nnoremap <C-L> <C-W><C-L>  " Ctrl + L = move to the pane right
nnoremap <C-H> <C-W><C-H>  " Ctrl + H = move to the pane left


" Buffer navigation shortcuts
set hidden
nnoremap <C-N> :bnext<CR>  " Ctrl + N = show next buffer
nnoremap <C-P> :bprev<CR>  " Ctrl + P = show previous buffer


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


" Copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>


" Copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>


" Language linters
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \}
