call plug#begin('~/.config/nvim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
" Plug 'oblitum/YouCompleteMe', { 'do': './install.py --clang-completer' }
" Plug 'Rip-Rip/clang_complete'
" Plug 'benekastah/neomake'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
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
Plug 'rhysd/vim-clang-format'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'Rykka/InstantRst'
" Plug 'Rykka/riv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'keith/tmux.vim'
Plug 'kana/vim-operator-user'
Plug 'idanarye/vim-smile'
call plug#end()

set shell=bash

set ttimeoutlen=50
set re=1

" Configure for C++ Development
set exrc             " local rc file
set secure
set tabstop=4
set softtabstop=4
set t_ut=
set relativenumber
set cul
set laststatus=2
set number
set ruler
set tags=tags;
set expandtab
set t_Co=

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

augroup VimSetColumns
    autocmd WinEnter * execute "set colorcolumn=" . join(range(81,255), ',')
    autocmd WinEnter * set cul 
    autocmd WinLeave * set colorcolumn=|set nocul
    autocmd FileType cpp set tabstop=4|set synmaxcol=80|set expandtab
augroup END

augroup VimSaveConfigs
    autocmd!
    au Filetype cpp :au! TextChanged,InsertLeave,FocusLost,VimLeavePre <buffer> :update
    autocmd TextChanged,InsertLeave,FocusLost,VimLeavePre *.md update
    autocmd TextChanged,InsertLeave,FocusLost,VimLeavePre *.makefile update
augroup END

" =====[ Terminal ]============================================================
:tnoremap jk <C-\><C-n>
" :tnoremap <Esc> <C-\><C-n>

" Change windows quickly
:tnoremap <c-h> <C-\><C-n><C-w>h
:tnoremap <c-j> <C-\><C-n><C-w>j
:tnoremap <c-k> <C-\><C-n><C-w>k
:tnoremap <c-l> <C-\><C-n><C-w>l
:nnoremap <c-h> <C-w>h
:nnoremap <c-j> <C-w>j
:nnoremap <c-k> <C-w>k
:nnoremap <c-l> <C-w>l

autocmd BufWinEnter,WinEnter term://* startinsert

let g:terminal_scrollback_buffer_size=50000

"=====[ vim-markdown ]========================================================
augroup VimMarkdown
    autocmd!
    autocmd BufNewFile,BufRead *.md set conceallevel=0
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

" =====[ VIM riv ]============================================================
let g:riv_fold_auto_update=0

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
" let g:indentLine_char = '┆'
let g:indentLine_faster = 1
let g:indentLine_concealcursor = 0

"=====[ Remap Leader Key ]======================================================
let mapleader = ","

"=====[ cycle through buffers ]=================================================
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" =====[ Add semicolins to the end of line ]====================================
:nnoremap <leader>; ms$A;<ESC>`s
:inoremap <leader>; <ESC>ms$A;<ESC>`s

:nnoremap <Leader>q :Bdelete<CR>

"=====[ Remap the Escap Key]====================================================
:inoremap jk <Esc>
:inoremap <esc> `

"=====[ vim-clang-format ]======================================================
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

"=====[ CtrlSF ]================================================================
let g:ctrlsf_auto_close = 0
let g:ctrlsf_ignore_dir = ['.git']
let g:ctrlsf_winsize = '82'

" "=====[ cpp enhanced highlight ]==============================================
let g:cpp_class_scope_highlight = 1

"=====[ GitHub Issues ]=========================================================

"=====[ NerdCommenter]==========================================================
let g:NERDSpaceDelims=1

"=====[ vim-tmux-navigator ]====================================================

"=====[ NerdTree ]==============================================================
let g:NERDTreeWinSize=26

"=====[ CtrlP ]================================================================
" let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.so,*.swp,*.zip,*.o,*.a,*_test,*.prefs,.project,.cproject
set wildignore+=.ccsproject,Test,Debug,Release
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'ag %s -l -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer=0

" =====[ FZF ]==================================================================
" map <silent> <C-p> :FZF -m<cr>

imap <C-f> <plug>(fzf-complete-line)

" <M-p> for open buffers
nnoremap <silent> <M-p> :Buffers<cr>

" <M-S-p> for MRU
nnoremap <silent> <M-S-p> :History<cr>

" Use fuzzy completion relative filepaths across directory
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

" =====[ Neomake Config ]=======================================================
" let g:neomake_cpp_clang_maker = {
    " \ 'args': ['-fsyntax-only','-std=c++03','-Wall','-Wextra', '-I.']
    " \}
" let g:neomake_cpp_enabled_makers = ['clang']

" let g:neomake_cpp_cpplint_maker = {
            " \ 'exe': 'cpplint'
            " \ }
" let g:neomake_cpp_enabled_makers = ['cpplint']
" let g:neomake_java_enabled_makers = ['javac']

" augroup Nmake
    " autocmd!
    " au Filetype cpp :au TextChanged,InsertLeave,VimEnter <buffer> :Neomake
    " " autocmd TextChanged,FocusLost,InsertLeave,VimEnter *.h  Neomake
" augroup END

"=====[ airline configuration ]===============================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"=====[ ultisnips ]===========================================================
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"=====[ vim-cpp-enhanced-highlight ]==========================================
let g:cpp_class_scope_highlight = 1

"=====[ YouCompleteMe Configurations ]========================================
" let g:ycm_min_num_of_chars_for_completion = 99
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_confirm_extra_conf = 0  " asks if OK to load .ycm_confing.py

let g:ycm_auto_trigger = 1
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_filepath_completion_use_working_dir = 1
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>y :YcmForceCompileAndDiagnostics<CR><CR>
"let g:ycm_show_diagnostics_ui = 0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"=====[ clang-completen ]=======================================================
" " let g:clang_auto_select = 0 " 0/1/2 auto select first entry in popup menu
" " let g:clang_complete_auto = 0 " auto complete after -> . ::
" let g:clang_complete_copen = 1 " 1: open quickfix window on error
" let g:clang_hl_errors = 1 " highlight warnings and errors
" let g:clang_periodic_quickfix = 0 " periodically update quickfix
" " you can use g:ClangUpdateQuickFix() with a mapping to do this
" let g:clang_snippets = 1
" " clang_complete, snipmate, ultisnips
" let g:clang_snippets_engine = "ultisnips"
" let g:clang_conceal_snippets = 1
" let g:clang_trailing_placeholder = 0 " for clang_complete snippet engine
" let g:clang_close_preview = 0 " auto close preview window after completion
" let g:clang_exec = "clang" " name or path of clang executable.
" " let g:clang_user_options = '-std=gnu++0x -include malloc.h -fms-extensions -fgnu-runtime'
" " let g:clang_user_options = '-std=c++11 -stdlib=libc++'
" let g:clang_use_library = 1
" let g:clang_library_path = "/usr/lib/"
" let g:clang_sort_algo = "priority"
" let g:clang_complete_macros = 1
" let g:clang_complete_patterns = 1
" let g:clang_library_path="/usr/lib/llvm-3.8/lib" 
" let g:clang_user_options =
                " \ '-std=c++03' .
                " \ '-isystem /usr/local/include'.
                " \ '-isystem /usr/include'.
                " \ '-isystem /usr/include/c++/4.9'.
                " \ '-isystem /usr/include/x86_64-linux-gnu/c++/4.9'.
                " \ '-isystem /usr/include/c++/4.9/backward'.
                " \ '-isystem /home/sporty/work/googletest/googletest/include'.
                " \ '-isystem /home/sporty/work/googletest/googlemock/include'.
                " \ '-isystem /home/sporty/ti/ccsv6/ccs_base/msp430/include'.
                " \ '-I .'.
                " \ '-g'.
                " \ '-Wall'.
                " \ '-Wextra'.
                " \ '-Werror'.
                " \ '-fsyntax-only'.
                " \ '-pthread'.
                " \ '-Wno-unknown-pragmas'.
                " \ '-DDEBUG'.
                " \ '-DTEST'.
                " \ '-D_BIC_SR(x)='.
                " \ '-D_BIS_SR(x)='.
                " \ '-D__MSP430F5335__'.
                " \ '-D__interrupt'

"=====[ vim-multiple-cursors]===================================================
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    call youcompleteme#DisableCursorMovedAutocommands()
    let g:ycm_auto_trigger = 99
    augroup VimSaveConfigs
        autocmd!
    augroup END
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    let g:ycm_auto_trigger = 1
    call youcompleteme#EnableCursorMovedAutocommands()
    augroup VimSaveConfigs
        autocmd!
        au Filetype cpp :au! TextChanged,InsertLeave,FocusLost,VimLeavePre <buffer> :update
        autocmd TextChanged,InsertLeave,FocusLost,VimLeavePre *.md update
        autocmd TextChanged,InsertLeave,FocusLost,VimLeavePre *.makefile update
    augroup END
endfunction

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

"=====[ vim-table-mode ]======================================================
" let g:table_mode_corner="+"
" let g:table_mode_corner_corner="+"
" let g:table_mode_header_fillchar="="
" let g:table_mode_corner_corner="+"
" let g:table_mode_header_fillchar="="
let g:table_mode_corner = '|'
"=====[ Confgiure the screen ]================================================
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" --- gruvbox
" let g:gruvbox_improved_warnings = 1
" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox

" --- solarized
let g:solarized_italic=1
let g:solarized_underline=1
let g:solarized_bold=1
" let g:solarized_visibility= "high"
colorscheme solarized
" set background=dark
" call togglebg#map("<F3>")
" colorscheme wombat

" colorscheme OceanicNext
set background=dark
" set background=light

"=====[ Generic Configurations ]================================================

nnoremap <leader>b :wa <bar> :make!<cr>
nnoremap <F4> :wa <bar> :make!<cr>
nnoremap <F8> :NERDTreeToggle<CR>

augroup BgHighlight
    autocmd!
    autocmd BufReadPost quickfix map <buffer> <leader>qq :cclose<cr>
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
