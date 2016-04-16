set shell=bash

set ttimeoutlen=50
set synmaxcol=80
set re=1

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

" =====[ Remap to change windows quickly ]====================================
:tnoremap <Esc> <C-\><C-n>

:tnoremap <c-h> <C-\><C-n><C-w>h
:tnoremap <c-j> <C-\><C-n><C-w>j
:tnoremap <c-k> <C-\><C-n><C-w>k
:tnoremap <c-l> <C-\><C-n><C-w>l
:nnoremap <c-h> <C-w>h
:nnoremap <c-j> <C-w>j
:nnoremap <c-k> <C-w>k
:nnoremap <c-l> <C-w>l

