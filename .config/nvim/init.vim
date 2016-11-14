call plug#begin('~/.config/nvim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'oblitum/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'icymind/NeoSolarized' 
Plug 'kopischke/unite-spell-suggest'
Plug 'scrooloose/nerdcommenter'
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'rhysd/vim-clang-format'
Plug 'dhruvasagar/vim-table-mode'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'keith/tmux.vim'
Plug 'kana/vim-operator-user'
Plug 'idanarye/vim-smile'
Plug 'dag/vim-fish'
Plug 'mhartington/oceanic-next'
Plug 'sickill/vim-monokai'
Plug 'wannesm/wmgraphviz.vim'
Plug 'endel/vim-github-colorscheme'
Plug 'jacoborus/tender.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

filetype plugin indent on " required
set termguicolors
set shell=bash

set ttimeoutlen=50
set re=1
set hlsearch

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
" set t_Co=
set path+=**

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

:nnoremap <Space> i_<Esc>r

nnoremap <silent> ]<Spac_e> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

autocmd TextChanged,InsertLeave *.cpp,*.h silent! update

:set spelllang=en_us

augroup VimSetColumns
    autocmd WinEnter * execute "set colorcolumn=" . join(range(81,255), ',')
    autocmd WinEnter * set cul 
    autocmd WinLeave * set colorcolumn=|set nocul
    autocmd FileType cpp set synmaxcol=80
    autocmd FileType md set synmaxcol=300
augroup END

"=====[ vim-markdown ]========================================================
augroup VimMarkdown
    autocmd!
    autocmd BufNewFile,BufRead *.md set conceallevel=0
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

"=====[ vim-markdown ]========================================================
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

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
" :inoremap <esc> `

"=====[ vim-clang-format ]======================================================
    let g:clang_format#code_style='google'

    let g:clang_format#style_options = {
                \ "AccessModifierOffset" : -3,
                \ "Standard" : "C++03"}

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

"=====[ NerdTree ]==============================================================
let g:NERDTreeWinSize=26

"=====[ CtrlP ]================================================================
" let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/build/*,*.so,*.swp,*.zip,*.o,*.a,*_test,*.prefs,.project,.cproject
set wildignore+=.ccsproject,Test,Debug,Production,*.d
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|o)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
let g:ctrlp_user_command = 'ag --ignore={build,*.o} %s -l --hidden -g ""'
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


"=====[ airline configuration ]===============================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

"=====[ ultisnips ]===========================================================
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"=====[ vim-cpp-enhanced-highlight ]==========================================
let g:cpp_class_scope_highlight = 1

"=====[ YouCompleteMe Configurations ]========================================
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0  " asks if OK to load .ycm_confing.py
let g:ycm_use_ultisnips_completer = 1
let g:ycm_auto_trigger = 1
let g:ycm_key_detailed_diagnostics = '<leader>d'
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>y :YcmForceCompileAndDiagnostics<CR><CR>
let g:ycm_error_symbol = ''
let g:ycm_warning_symbol = ''

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"=====[ vim-multiple-cursors]===================================================
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    " call youcompleteme#DisableCursorMovedAutocommands()
    " let g:ycm_auto_trigger = 99
    augroup VimSaveConfigs
        autocmd!
    augroup END
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    " let g:ycm_auto_trigger = 1
    " call youcompleteme#EnableCursorMovedAutocommands()
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

"=====[ vim-table-mode ]======================================================
" let g:table_mode_corner="+"
" let g:table_mode_corner_corner="+"
" let g:table_mode_header_fillchar="="
" let g:table_mode_corner_corner="+"
" let g:table_mode_header_fillchar="="
let g:table_mode_corner = '|'

"=====[ Confgiure the screen ]================================================
syntax enable
" --- gruvbox
" let g:gruvbox_improved_warnings = 1
" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox

" colorscheme wombat
" colorscheme github
" colorscheme monokai
" colorscheme tender

" ----- Solarized
colorscheme NeoSolarized
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

" ----- OceanicNext
" colorscheme OceanicNext
" let g:oceanic_next_terminal_bold = 0

" set background=light
set background=dark

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

