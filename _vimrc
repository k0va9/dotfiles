"plugins {{{
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', { 'type': 'opt' })
  call minpac#add('ctrlpvim/ctrlp.vim')

  "lsp
  call minpac#add('prabirshrestha/vim-lsp')
  call minpac#add('mattn/vim-lsp-settings')
  call minpac#add('prabirshrestha/asyncomplete.vim')
  call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
endfunction

"disable Please do... message
let g:lsp_settings_enable_suggestions=0
"}}}

"commands {{{
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean call PackInit() | call minpac#clean()
"}}}

"opts {{{
colorscheme retrobox

"for lsp preview
"highlight clear FloatBorder

set shiftwidth=2
set expandtab
set ambiwidth=double
set foldmethod=syntax
"}}}

"mapping {{{
let g:mapleader="\<Space>"

tnoremap <C-[> <C-\><C-n>
nnoremap <leader>f <Cmd>CtrlP .<CR>
nnoremap gh <Cmd>LspHover<CR>
nnoremap gd <Cmd>LspDefinition<CR>
"}}}

" vim: foldmethod=marker foldlevelstart=99
