call pathogen#infect()
Helptags

syntax on
filetype on
filetype plugin on
filetype indent on
set nocompatible

set number

inoremap ;a <esc>

map <S-tab> :set hls!<cr>:set hls?<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set wmh=0
set wmw=0

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" for templates
autocmd BufNewFile *.* silent! 0r ~/.vim/templates/%:e.tpl
autocmd FileType c,cpp,python,java,javascript,matlab silent! source ~/.vim/settings/code.vim
autocmd FileType c,cpp,java,javascript silent! source ~/.vim/bindings/common_code_bindings.vim
autocmd FileType matlab colorscheme matlabdark
" Note, perl automatically sets foldmethod in the syntax file
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

"Mapping to jump to <+...> place holder.
nnoremap <C-y> /<+.\{-1,}+><cr>c/+>/e<cr>
inoremap <C-y> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>

let mapleader = ","
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>

"Auto load session if Session.vim exists.
silent! source Session.vim

let g:tagbar_autofocus = 1

"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_disable_auto_complete = 1
"let g:neocomplcache_enable_camel_case_completion = 1

source ~/.vim/settings/neocomset.vim

" Recommended key-mappings.
" " <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" " <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

nmap <leader>t :TagbarToggle<CR>
"nmap <silent> <leader>t :Tlist<CR>

" only needed for windows
"set bs=2
"let g:NERDTreeChDirMode=1
"--------------
"
"TODO good for whitespace but not as general command
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

" Show trailing whitespace:
"match ExtraWhitespace /\s\+$/

" Show trailing whitepace and spaces before a tab:
"match ExtraWhitespace /\s\+$\| \+\ze\t/

" Show tabs that are not at the start of a line:
"match ExtraWhitespace /[^\t]\zs\t\+/

" Show spaces used for indenting (so you use only tabs for indenting).
"match ExtraWhitespace /^\t*\zs \+/

"set omnifunc=syntaxcomplete#Complete

" -- ctags --
" add current directory's generated tags file to available tags
set tags=./tags,tags,~/.vim/cpp_src/cpp
"'''''''''''''

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"save marks accross sessions uppercase only
"set viminfo='1000,f1

" let arrow keys be useful
map <right> :bn<cr>
map <left> :bp<cr>

command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" map <ctrl>+F12 to generate ctags for current folder:
map <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .<CR><CR>

" remove windows M newline chars
map <c-F7> :%s/\r\(\n\)/\1/g<CR>
" convert 4 spaces at start of line to a tab
map <C-F8> :Space2Tab<CR>
" delete trailing whitespace
map <C-F9> :%s/\s\+$//<CR>
" delete all double spaces - assumes 4 space tabs
map <C-F6> :%s/\t/    /g<CR>:Space2Tab<CR>:%s/ \{2,}/ /g<CR>
