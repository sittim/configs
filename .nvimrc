call plug#begin('~/.config/nvim/plugged')

Plug 'Yggdroot/indentLine'
"Plug 'fatih/vim-go',             {'for': 'go'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
"Plug 'scrooloose/syntastic'
" --------------- neomake --------------------
"Plug 'benekastah/neomake'
"Plug 'justmao945/vim-clang'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
"Plug 'ntpeters/vim-airline-colornum'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'kopischke/unite-spell-suggest'
Plug 'scrooloose/nerdcommenter'
" ---------------  Nurdtree -------------------
Plug 'scrooloose/nerdtree',            { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Lokaltog/vim-easymotion'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'DoxygenToolkit.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'szw/vim-ctrlspace'
Plug 'oblitum/rainbow'
Plug 'vim-scripts/a.vim'
Plug 'moll/vim-bbye'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bbchung/clighter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'troydm/zoomwintab.vim'
Plug 'godlygeek/tabular'

"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"function! BuildComposer(info)
  "if a:info.status != 'unchanged' || a:info.force
    "!cargo build --release
    "UpdateRemotePlugins
  "endif
"endfunction

"Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

set ttimeoutlen=50
set synmaxcol=120
"set nocursorline
"set re=1
":redraw

" Configure for C++ Development
set exrc
set secure
set tabstop=4
set softtabstop=4
set noexpandtab
set colorcolumn=80
:set cursorline
:set t_ut=

" =====[ C++ formatting ]=====================================================
set cindent shiftwidth=4
set cinoptions=
set cinoptions+=l1
set cinoptions+=(1
set relativenumber

"=====[ Format Options ]======================================================
set formatoptions=tcq

"=====[ Indent Guidelines ]===================================================
let g:indent_guides_auto_colors = 0
"let g:indentLine_color_term = 239

"=====[ Remap Leader Key ]====================================================
let mapleader = ","

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
":set timeout timeoutlen=1000 ttimeoutlen=100

" =====[ Syntastic Config ]===================================================
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_checkers = ['clang_check', 'cpplint', 'clang_tidy']
"let g:syntastic_c_checkers = ['cpplint']
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++03 -stdlib=libc++'
"let g:syntastic_shell = "/bin/sh"

" =====[ Neomake Config ]=====================================================
"let g:neomake_cpp_clang_maker = {
    "\ 'args': ['-fsyntax-only','-std=c++03','-stdlib=libc++','-Wall', '-Wextra',
    "\          '-I/home/sporty/ws-ccs/hw_1_5/miwt-os',
    "\          '-I/home/sporty/ws-ccs/hw_1_5']
    "\}
"let g:neomake_cpp_clang_maker = {
    "\ 'args': ['-fsyntax-only','-std=c++03','-Wall','-Wextra',
    "\          '-Imiwt-os',
    "\          '-isystem/home/sporty/work/googletest/googletest/include',
    "\          '-isystem/home/sporty/work/googletest/googlemock/include' ]
    "\}
"let g:neomake_cpp_enabled_makers = ['clang']

"autocmd! BufWritePost * Neomake 

"=====[clang complete]========================================================
"let g:clang_cpp_options = '-std=c++03 -stdlib=libc++'
"let g:clang_vim_exec = 'nvim'

"=====[ airline configuration ]===============================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_exclude_preview = 1
"let g:AirlineTheme=solarized

"=====[ ultisnips ]===========================================================
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetsDir="~/.nvim/UltiSnips"

"=====[ vim-cpp-enhanced-highlight ]==========================================
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"=====[ YouCompleteMe Configurations ]========================================
" let g:ycm_min_num_of_chars_for_completion = 99
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'
"let g:ycm_confirm_extra_conf = 0

let g:ycm_auto_trigger = 1
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_filepath_completion_use_working_dir = 1
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_show_diagnostics_ui = 0

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

"=====[oblitum/rainbow]=======================================================
au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1

"=====[ easy motion ]=========================================================
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
nmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>h <Plug>(easymotion-linebackward)

map <Leader> <Plug>(easymotion-prefix)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"let g:EasyMotion_inc_highlight=0
"let g:EasyMotion_move_highlight = 0
"let g:EasyMotion_landing_highlight = 0
nnoremap <leader>nh :nohlsearch<CR>

"=====[ tmux line configuration ]=============================================
let g:tmuxline_preset = 'full'

" =====[ indent line ]========================================================
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)
"let g:indentLine_color_term = 239

" =====[ clighter ]===========================================================
"let g:clighter_compile_args = ['-isystem /usr/lib/llvm-3.6/lib/clang/3.6.0/include',
                              "\'-I/home/sporty/ws-ccs/hw_1_5/miwt-os',
                              "\'-std=c++03']
"let g:clighter_cursor_hl_mode=1
let g:clighter_highlight_mode=0
"=====[ Confgiure the screen ]================================================
" Generic Cofiguration
syntax enable
"set t_Co=256
"let g:rehash256 = 1

" --- gruvbox
"let g:gruvbox_improved_warnings = 1
"let g:gruvbox_italic = 1
"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox

" --- solarized
let g:solarized_italic=1
let g:solarized_underline=1
let g:solarized_bold=1
set background=light
"set background=dark
colorscheme solarized

set laststatus=2
set number
syntax on
set tags=tags;
set expandtab

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

    "set background&
    
    "=====[ makefile binding ]================================================
    autocmd  BufRead,BufNewFile  *.cpp
        \ let &l:makeprg
        \ = 'make -f '.fnameescape(
            \substitute(expand('%'), '\m_test\.cpp$', '.makefile', ''))
augroup END

nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

