call plug#begin('~/.config/nvim/plugged')

Plug 'benekastah/neomake'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
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
Plug 'vim-scripts/a.vim'
Plug 'moll/vim-bbye'
Plug 'ludovicchabant/vim-gutentags'
Plug 'troydm/zoomwintab.vim'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'nelstrom/vim-qargs'
Plug 'jaxbot/github-issues.vim'
Plug 'shougo/deoplete.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhartington/oceanic-next'
Plug 'mlr-msft/vim-loves-dafny', {'for': 'dafny'}

call plug#end()

set shell=bash

set ttimeoutlen=50
set synmaxcol=80
set re=1
"set ttyfast
"set lazyredraw
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

"=====[ Set Cursor ]========================================================
" use an orange cursor in insert mode
let &t_SI = "\<Esc>]12;orange\x7"
" use a red cursor otherwise
let &t_EI = "\<Esc>]12;red\x7"
silent !echo -ne "\033]12;red\007"
" reset cursor when vim exits
autocmd VimLeave * silent !echo -ne "\033]112\007"
" use \003]12;gray\007 for gnome-terminal

"=====[ vim-markdown ]========================================================
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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

:nnoremap <Leader>q :Bdelete<CR>

" =====[ Remap to change windows quickly ]====================================
:nmap <silent> <C-H> :wincmd h<CR>
:nmap <silent> <C-J> :wincmd j<CR>
:nmap <silent> <C-K> :wincmd k<CR>
:nmap <silent> <C-L> :wincmd l<CR>

"=====[ Remap the Escap Key ]================================================
:inoremap jk <Esc>

"=====[git_issues_vim]=======================================================
let g:github_access_token = "d06087b63b8fade6f1dd5064f8f4adb11579b728"

"=====[ AG ]==================================================================
let g:ag_working_path_mode="r"

" =====[ CtrlP ]==============================================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.so,*.swp,*.zip,*.o,*.a,*_test
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_switch_buffer=0

" =====[ Neomake Config ]=====================================================
"let g:neomake_cpp_clang_maker = {
    "\ 'args': ['-fsyntax-only','-std=c++03','-stdlib=libc++','-Wall', '-Wextra',
    "\          '-I/home/sporty/ws-ccs/hw_1_5/miwt-os',
    "\          '-I/home/sporty/ws-ccs/hw_1_5']
    "\}
let g:neomake_cpp_clang_maker = {
    \ 'args': ['-fsyntax-only','-std=c++03','-Wall','-Wextra', '-I.']
    \}
let g:neomake_cpp_enabled_makers = ['clang']

autocmd! BufWritePost * Neomake 

"=====[ airline configuration ]===============================================

let g:deoplete#enable_at_startup=1
"=====[ airline configuration ]===============================================
let g:airline_powerline_fonts = 1

"=====[ ultisnips ]===========================================================
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

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
let g:ycm_confirm_extra_conf = 0  " asks if OK to load .ycm_confing.py

let g:ycm_auto_trigger = 1
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_filepath_completion_use_working_dir = 1
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_show_diagnostics_ui = 0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"=====[ easy motion ]=========================================================
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
nmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>h <Plug>(easymotion-linebackward)

map <Leader> <Plug>(easymotion-prefix)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nnoremap <leader>nh :nohlsearch<CR>

"=====[ tmux line configuration ]=============================================
let g:tmuxline_preset = 'full'

"=====[ Confgiure the screen ]================================================
" Generic Cofiguration
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" --- gruvbox
"let g:gruvbox_improved_warnings = 1
"let g:gruvbox_italic = 1
"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox
"
" --- solarized
"let g:solarized_italic=1
"let g:solarized_underline=1
"let g:solarized_bold=1
"let g:solarized_visibility= "high"
"set background=dark
"colorscheme solarized
"call togglebg#map("<F3>")

set background=dark
colorscheme OceanicNext

"=====[ Generic Configurations ]================================================
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.7.py<cr>
map <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.7.py<cr>

set laststatus=2
set number
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

