" ==========[ Begin Plugins ]=============================================
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-markdown'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'Lokaltog/vim-easymotion'
Plug 'freitass/todo.txt-vim'
Plug 'lukaszkorecki/workflowish'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'endel/vim-github-colorscheme'

call plug#end()

syntax enable
:inoremap jk <Esc>
let mapleader = ","
let maplocalleader = "\\"
:set number
:set laststatus=2

" =====[ GVIM GUI setup ]====================================
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" =====[ Remap to change windows quickly ]====================================
:nmap <silent> <C-H> :wincmd h<CR>
:nmap <silent> <C-J> :wincmd j<CR>
:nmap <silent> <C-K> :wincmd k<CR>
:nmap <silent> <C-L> :wincmd l<CR>

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

"=====[ gruvbox ]=============================================================
let g:gruvbox_improved_warnings = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
" set background=dark
set background=light

"=====[ ultisnips ]===========================================================
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetsDir="~/.nvim/UltiSnips"

"=====[ workflowish ]===========================================================
autocmd BufWinLeave *.wofl mkview
autocmd BufWinEnter *.wofl silent loadview

