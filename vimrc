set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Enabling filetype support provides filetype-specific indenting, syntax
" highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on

" NERDTree: Open/Close with backslash
nmap \ :NERDTreeToggle<CR>

" 'matchit.vim' is built-in so let's enable it!
" Hit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

set autoindent                  " Minimal automatic indenting for any filetype
set backspace=indent,eol,start  " Proper backspace behavior

set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=000 guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=000 guibg=darkred guifg=white
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>


set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set list
set listchars=trail:⋅

set number

set mouse=a

" Make the full path of the file visible in the status bar
set laststatus=2
set ruler
set nowrap

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
hi ColorColumn ctermbg=000

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

" Use X Windows clipboard
set clipboard=unnamedplus

" Support the write command when lazily typing W (as opposed to w)
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Write     <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar                                  -bang Wqall     wqa<bang>
command! -bar -nargs=* -complete=file -range=% -bang We        <line1>,<line2>w<bang> | e <args>
command! -bar -nargs=* -complete=file -count   -bang Wnext     <count>wnext<bang> <args>
command! -bar -nargs=* -complete=file -count   -bang Wprevious <count>wprevious<bang> <args>

" Support the quite command when lazily typing Q (as opposed to q)
command! Q q
command! WQ wq
