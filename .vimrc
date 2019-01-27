:set cursorline
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
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

" Use X Windows clipboard
set clipboard=unnamedplus
