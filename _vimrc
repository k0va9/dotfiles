"plugins {{{
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', { 'type': 'opt' })
  call minpac#add('mattn/vim-molder')
  call minpac#add('mattn/vim-molder-operations')
endfunction
"}}}

"commands {{{
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean call PackInit() | call minpac#clean()
"}}}

"opts {{{
colorscheme habamax
set shiftwidth=2
set expandtab
"}}}

"mapping {{{
let g:mapleader="\<Space>"

tnoremap <C-[> <C-\><C-n>
"}}}

" vim: foldmethod=marker foldlevelstart=99
