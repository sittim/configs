call plug#begin('~/.config/nvim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'benekastah/neomake'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'vim-scripts/a.vim'
Plug 'moll/vim-bbye'
Plug 'ludovicchabant/vim-gutentags'
Plug 'troydm/zoomwintab.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'jaxbot/github-issues.vim'
" Plug 'shougo/deoplete.nvim'
" Plug 'zchee/deoplete-clang'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhartington/oceanic-next'
Plug 'flazz/vim-colorschemes'
" Plug 'artur-shaik/vim-javacomplete2'
Plug 'adragomir/javacomplete'
Plug 'rhysd/vim-clang-format'
" Plug 'bbchung/clighter'
Plug 'davidhalter/jedi-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'blueyed/vim-diminactive'

call plug#end()

set shell=bash

set ttimeoutlen=50
set synmaxcol=80
set re=1

" Configure for C++ Development
set exrc
set secure
set tabstop=4
set softtabstop=4
set noexpandtab
set colorcolumn=80
:set cursorline
:set t_ut=

noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

:nnoremap <Space> i_<Esc>r

nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

:set spelllang=en_us

augroup VimConfigs
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost,VimLeavePre *.h update
    autocmd TextChanged,InsertLeave,FocusLost,VimLeavePre *.cpp update
    autocmd TextChanged,InsertLeave,FocusLost,VimLeavePre *.md update
    autocmd TextChanged,InsertLeave,FocusLost,VimLeavePre *.makefile update
augroup END

" =====[ Remap to change windows quickly ]====================================
" :nnoremap <silent> <C-H> :wincmd h<CR>
" :nnoremap <silent> <C-J> :wincmd j<CR>
" :nnoremap <silent> <C-K> :wincmd k<CR>
" :nnoremap <silent> <C-L> :wincmd l<CR>
:tnoremap <Esc> <C-\><C-n>

:tnoremap <c-h> <C-\><C-n><C-w>h
:tnoremap <c-j> <C-\><C-n><C-w>j
:tnoremap <c-k> <C-\><C-n><C-w>k
:tnoremap <c-l> <C-\><C-n><C-w>l
:nnoremap <c-h> <C-w>h
:nnoremap <c-j> <C-w>j
:nnoremap <c-k> <C-w>k
:nnoremap <c-l> <C-w>l

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

let g:terminal_scrollback_buffer_size=50000

"=====[ Set Cursor ]========================================================
" use an orange cursor in insert mode
" let &t_SI = "\<Esc>]12;orange\x7"
" use a red cursor otherwise
" let &t_EI = "\<Esc>]12;red\x7"
" silent !echo -ne "\033]12;red\007"
" reset cursor when vim exits
" autocmd VimLeave * silent !echo -ne "\033]112\007"
" use \003]12;gray\007 for gnome-terminal

"=====[ vim-markdown ]========================================================
augroup VimMarkdown
    autocmd!
    autocmd BufNewFile,BufRead *.md set conceallevel=0
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

"=====[ vim-repeat ]==========================================================

" =====[ C++ formatting ]=====================================================
set cindent shiftwidth=4
set cinoptions=
set cinoptions+=l1
set cinoptions+=(1
set relativenumber

"=====[ Format Options ]======================================================
set formatoptions=tcq

""=====[ Indent Guidelines ]===================================================
let g:indent_guides_auto_colors = 0
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
let g:indentLine_concealcursor = 0
" let g:indentLine_char = '¦'
" let g:indentLine_color_tty_light = 7 " (default: 4)
" let g:indentLine_color_dark = 9 " (default: 2)
" let g:indentLine_color_term = 81

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

"=====[ Remap the Escap Key ]=================================================
:inoremap jk <Esc>
:inoremap <esc> `

"=====[ JavaComplete ]========================================================
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java map <leader>jd :call javacomplete#GoToDefinition()<CR>

"=====[ JavaComplete2 ]=======================================================
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

" nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" map <F4> <Plug>(JavaComplete-Imports-AddSmart)

" nmap <F6> <Plug>(JavaComplete-Imports-Add)
" imap <F6> <Plug>(JavaComplete-Imports-Add)

" nmap <F7> <Plug>(JavaComplete-Imports-AddMissing)
" imap <F7> <Plug>(JavaComplete-Imports-AddMissing)

"=====[ ClangFormat ]==========================================================
    let g:clang_format#code_style='google'

    let g:clang_format#style_options = {
                \ "AccessModifierOffset" : -3,
                \ "Standard" : "C++03"}

augroup ClangFmt
    autocmd!
    autocmd BufWritePre *.cpp  ClangFormat
    autocmd BufWritePre *.h  ClangFormat
augroup END

:nnoremap <leader>cf :ClangFormat<CR>

"=====[ cpp enhanced highlight ]===============================================
let g:cpp_class_scope_highlight = 1

" =====[ clighter ]============================================================
" let g:clighter_compile_args = ['-isystem /usr/lib/llvm-3.6/lib/clang/3.6.0/include',
                              " \'-I/home/sporty/ws-ccs/hw_1_5/miwt-os',
                              " \'-std=c++03']
" let g:clighter_cursor_hl_mode=1
" let g:clighter_highlight_mode=0
" let g:clighter_autostart = 1

" nmap <silent> <Leader>r :call clighter#Rename()<CR>

"=====[ AG ]==================================================================
" let g:ag_working_path_mode="r"

"=====[ GitHub Issues ]========================================================

"=====[ NerdCommenter]===============================================
let g:NERDSpaceDelims=1

" =====[ CtrlP ]==============================================================
" let g:ctrlp_map = '<C-p>'
" let g:ctrlp_map = '<C-p>'
nnoremap <silent> '<C-p>' :ClearCtrlPCache<cr>\|:CtrlP<cr>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.so,*.swp,*.zip,*.o,*.a,*_test,*.prefs,.project,.cproject
set wildignore+=.ccsproject
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer=0

" =====[ Neomake Config ]=====================================================
" let g:neomake_cpp_clang_maker = {
    " \ 'args': ['-fsyntax-only','-std=c++03','-Wall','-Wextra', '-I.']
    " \}
" let g:neomake_cpp_enabled_makers = ['clang']

let g:neomake_cpp_cpplint_maker = {
            \ 'exe': 'cpplint'
            \ }
let g:neomake_cpp_enabled_makers = ['cpplint']
let g:neomake_java_enabled_makers = ['javac']

augroup Nmake
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost *.java Neomake
    autocmd TextChanged,FocusLost,InsertLeave,VimEnter *.cpp  Neomake
    autocmd TextChanged,FocusLost,InsertLeave,VimEnter *.h  Neomake
augroup END

"=====[ airline configuration ]===============================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

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

"=====[ easy motion ]===-======================================================
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

"=====[deoplete]==============================================================
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.7/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-3.7/lib/clang'
" let g:deoplete#sources#clang#std='c++03'
" let g:deoplete#sources#clang#flags=['-g','-Wall','-Wextra','-Werror',
    " \'-fsyntax-only','-pthread','-Wno-unknown-pragmas','-DDEBUG',
    " \'-D_BIC_SR(x)=','-D_BIS_SR(x)=','-DUSE_CLANG_COMPLETER','-std=c++03',
    " \'-x','c++',
    " \'-isystem', '/usr/local/include',
    " \'-isystem','/usr/include/x86_64-linux-gnu',
    " \'-isystem','/usr/include',
    " \'-isystem', '/usr/include/c++/4.9',
    " \'-isystem','/usr/include/x86_64-linux-gnu/c++/4.9',
    " \'-isystem','/usr/include/c++/4.9/backward',
    " \'-isystem','/usr/lib/llvm-3.6/lib/clang/3.6.2/include',
    " \'-isystem','/home/sporty/work/googletest/googletest/include',
    " \'-isystem','/home/sporty/work/googletest/googlemock/include',
    " \'-isystem','/home/sporty/ti/ccsv6/ccs_base/msp430/include'
    " \]

"=====[ VIM Table Mode ]======================================================
let g:table_mode_corner="|"

"=====[ Confgiure the screen ]================================================
syntax enable

" --- gruvbox
"let g:gruvbox_improved_warnings = 1
"let g:gruvbox_italic = 1
"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox
"
" --- solarized
let g:solarized_italic=1
let g:solarized_underline=1
let g:solarized_bold=1
let g:solarized_visibility= "high"
colorscheme solarized
call togglebg#map("<F3>")

set background=light
 " set background=dark

"=====[ Generic Configurations ]================================================
set laststatus=2
set number
set ruler
set tags=tags;
set expandtab

nnoremap <C-b> :wa <bar> :make!<cr>
nnoremap <F4> :wa <bar> :make!<cr>
nnoremap <F8> :NERDTreeToggle<CR>

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80  " colorcolumn
    autocmd WinEnter * set cul             " highlight current line
    autocmd WinLeave * set colorcolumn=    " column
    autocmd WinLeave * set nocul           " no highlight current line

    autocmd BufReadPost quickfix map <buffer> <leader>qq :cclose<cr>
                               " \|map <buffer> <c-p> <up>
                               " \|map <buffer> <c-n> <down>

    "=====[ makefile binding ]================================================
    autocmd  BufRead,BufNewFile  *.cpp
        \ let &l:makeprg
        \ = 'make -f '.fnameescape(
            \substitute(expand('%'), '\m_test\.cpp$', '.makefile', ''))
augroup END


"Rename tabs to show tab# and # of viewports
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
            let s .= i
            if tabpagewinnr(i,'$') > 1
                let s .= '.'
                let s .= (i== t ? '%#TabWinNumSel#' : '%#TabWinNum#')
                let s .= (tabpagewinnr(i,'$') > 1 ? wn : '')
            end

            let s .= ' %*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= file
            let s .= (i == t ? '%m' : '')
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif

autocmd BufRead,BufNewFile *.dlog set filetype=dlog
