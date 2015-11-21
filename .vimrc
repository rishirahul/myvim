set nocompatible              " be iMproved, required
filetype off                  " required

set number
set mouse=a
set hlsearch
set incsearch
set ignorecase
let mapleader = ";"

nnoremap <c-d> dd
nnoremap <c-x> bved
nnoremap <c-i><c-l> o<esc>
nnoremap <c-i><c-j> i<space><esc>
nnoremap <c-i><c-k> i<tab><esc>
nnoremap > v>
nnoremap < v<
nnoremap <c-f> zf%
nnoremap <c-o> zo
vnoremap qq <Esc>`>a'<Esc>`<i'<Esc>
vnoremap QQ <Esc>`>a"<Esc>`<i"<Esc>
inoremap { {}<left>
inoremap [ []<left>
inoremap < <><left>
inoremap ( ()<left>
inoremap ' ''<left>
inoremap " ""<left>
inoremap /* /**/<left><left>

filetype plugin indent on    " required
syntax on

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
filetype plugin on
syntax on


" Showing line numbers and length
"" set number  " show line numbers
"" set tw=79   " width of document (used by gd)
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing
"" set colorcolumn=80
"" highlight ColorColumn ctermbg=233

" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
execute pathogen#infect()

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*

" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

"install supertab
let g:SuperTabDefaultCompletionType = "context"

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable

augroup pythongroup
    autocmd!
    autocmd filetype python nnoremap <c-c> I#<esc>
    autocmd filetype python :iabbrev funn def :<left>
    autocmd FileType python :iabbrev iff if:<left>
    autocmd FileType python :iabbrev class class:<left>
    autocmd filetype python inoremap ,b (){<CR><CR>}<up>
    autocmd filetype python inoremap ,c {<CR><CR>}<up>
augroup END

augroup Cppgroup
    autocmd filetype c,cpp,verilog nnoremap <c-c> I//<esc>
    autocmd filetype c,cpp,verilog vnoremap <c-b> <Esc>`>a*/<Esc>`<i/*<Esc>
    autocmd filetype c,cpp,verilog inoremap ,b (){<CR><CR>}<up>
    autocmd filetype c,cpp,verilog inoremap ,c {<CR><CR>}<up>
    autocmd FileType c,cpp :iabbrev eliff else if<left>
    autocmd FileType c,cpp :iabbrev forr for(;; <left><left><left>
    autocmd FileType c,cpp :iabbrev clss class <CR>{<CR>public:<CR>private:<CR><up><up><up><up><right><right><right><right><right>
augroup END
