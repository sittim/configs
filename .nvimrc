" Bundle Vundle configurations
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'oblitum/YouCompleteMe' , { 'do': './install.py --clang-completer' }
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-markdown'
Plugin 'kopischke/unite-spell-suggest'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Raimondi/delimitMate'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'DoxygenToolkit.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'szw/vim-ctrlspace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'moll/vim-bbye'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bbchung/clighter'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'troydm/zoomwintab.vim'
Plugin 'godlygeek/tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set ttimeoutlen=100
set synmaxcol=120
set nocursorline
set re=1
:redraw

" Configure for C++ Development
set exrc
set secure
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=80
:set cursorline
:set t_ut=

"=====[ Indent Guidelines ]===================================================
let g:indent_guides_auto_colors = 0


"=====[ Remap Leader Key ]====================================================
let mapleader = "\<Space>"

"=====[ cycle through buffers ]===============================================
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" =====[ Add semicolins to the end of line ]==================================
:nnoremap <leader>; ms$A;<ESC>`s
:inoremap <leader>; <ESC>ms$A;<ESC>`s

"=====[ Moving line up or down ]==============================================

"=====[ vim-bbye, delete buffer but keep layout ]=============================
:nnoremap <Leader>q :Bdelete<CR>

" =====[ Remap to change windows quickly ]====================================
:nmap <silent> <C-H> :wincmd h<CR>
:nmap <silent> <C-J> :wincmd j<CR>
:nmap <silent> <C-K> :wincmd k<CR>
:nmap <silent> <C-L> :wincmd l<CR>

"=====[ Remap the Escap Key "]================================================
:inoremap jk <Esc>
:set timeout timeoutlen=1000 ttimeoutlen=100

" =====[ Syntastic Config ]===================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['clang_check', 'cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++03 -stdlib=libc++'
let g:syntastic_shell = "/bin/sh"

"=====[ airline configuration ]===============================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_exclude_preview = 1

"=====[ ultisnips ]===========================================================
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-c>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"=====[ vim-cpp-enhanced-highlight ]==========================================
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"=====[ YouCompleteMe Configurations ]========================================
" let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'

let g:ycm_auto_trigger = 50
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_filepath_completion_use_working_dir = 1
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"=====[ ctrl-space ]==========================================================
set hidden
:nmap <silent> <C-H> :wincmd h<CR>
let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'

let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp|md5|o)[\/]'
nnoremap <silent><C-p> :CtrlSpace O<CR>

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
set showtabline=0

"=====[ easy motion ]=========================================================
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>u <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-uinebackward)

map <Leader> <Plug>(easymotion-prefix)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"=====[ tmux line configuration ]=============================================
let g:tmuxline_preset = 'full'

" =====[ clighter ]===========================================================
let g:clighter_libclang_file = '/usr/lib/llvm-3.6/lib/libclang.so'
let g:clighter_compile_args = ['-isystem /usr/lib/llvm-3.6/lib/clang/3.6.0/include', '-std=c++03']

"let g:clighter_compile_args = ['-isystem /usr/lib/llvm-3.6/lib/clang/3.6.0/include', '-I/home/sporty/work/c1202-f5335v2', '-std=c++03']
"=====[ Confgiure the screen ]================================================
let g:gruvbox_improved_warnings = 1
"let g:gruvbox_improved_strings = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
let g:rehash256 = 1
set t_Co=256
syntax enable
set background=dark
 colorscheme gruvbox
" colorscheme solarized
" colorscheme wombat256
" colorscheme jellybeans
" colorscheme Sunburst
" colorscheme molokai

"=====[ Configure Airline ]===================================================
set laststatus=2
let g:airline_powerline_fonts = 1
set number
syntax on
set tags=tags;
set expandtab

"=====[ binding of <c-s> to save a buffer ]===================================
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-s> :<C-u>Update<CR>

nnoremap <F4> :wa <bar> :make!<cr>
nnoremap <F8> :NERDTreeToggle<CR>

augroup BgHighlight
    autocmd!
    autocmd WinEnter * highlight ColorColumn ctermbg=yellow
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul

    "=====[ Indent Guidelines ]===============================================
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

    autocmd BufReadPost quickfix map <buffer> <leader>qq :cclose<cr>
                               \|map <buffer> <c-p> <up>
                               \|map <buffer> <c-n> <down>

    autocmd GuiEnter * set background&
    "=====[ makefile binding ]================================================
    autocmd  BufRead,BufNewFile  *.cpp
        \ let &l:makeprg
        \ = 'make -f '.fnameescape(
            \substitute(expand('%'), '\m_test\.cpp$', '.makefile', ''))
augroup END

nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute"'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute"']+1"<CR>

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

