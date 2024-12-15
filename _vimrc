"plugins {{{
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', { 'type': 'opt' })
  call minpac#add('ctrlpvim/ctrlp.vim')
  call minpac#add('vim-denops/denops.vim')

  "ddu
  call minpac#add('Shougo/ddu.vim')
  call minpac#add('Shougo/ddu-ui-ff')
  call minpac#add('Shougo/ddu-ui-filer')
  call minpac#add('Shougo/ddu-source-file_rec')
  call minpac#add('Shougo/ddu-source-action')
  call minpac#add('Shougo/ddu-filter-matcher_substring')
  call minpac#add('Shougo/ddu-kind-file')
  call minpac#add('Shougo/ddu-commands.vim')
  call minpac#add('kyoh86/ddu-source-git_log')

  "lsp
  call minpac#add('prabirshrestha/vim-lsp')
  call minpac#add('mattn/vim-lsp-settings')
  call minpac#add('prabirshrestha/asyncomplete.vim')
  call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
endfunction


" ddu {{{
call ddu#custom#patch_global(#{
  \ ui: 'ff',
  \ sources: [#{name: 'file_rec', params: {}}],
  \ sourceOptions: #{
  \   _: #{
  \       matchers: ['matcher_substring'],
  \     },
  \ },
  \ kindOptions: #{
  \   file: #{
  \     defaultAction: 'open',
  \   },
  \   action: #{
  \     defaultAction: 'do',
  \   }
  \ },
  \ uiParams: #{
  \     ff: #{
  \      split: 'floating',
  \      floatingBorder: 'double',
  \      displaySourceName: 'long',
  \      displayTree: v:true,
  \     },
  \ }
  \ })


autocmd FileType ddu-ff call s:my_ddu_keymaps()

function! s:my_ddu_keymaps() abort
  nnoremap <buffer><silent> <CR> <Cmd>call ddu#ui#do_action('itemAction')<CR>
  nnoremap <buffer><silent> p    <Cmd>call ddu#ui#do_action('preview')<CR>
  nnoremap <buffer><silent> a    <Cmd>call ddu#ui#do_action('chooseAction')<CR>
  nnoremap <buffer><silent> i    <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q    <Cmd>call ddu#ui#do_action('quit')<CR>
endfunction
" }}}

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
set mouse=
"}}}

"mapping {{{
let g:mapleader="\<Space>"

" vim-fall | ddu | ctrlp
let s:current_ff="ddu"

if s:current_ff == "ddu"
  nnoremap ;gl <Cmd>Ddu git_log -source-param-git_log-showGraph=v:true<CR>
  nnoremap <Space>f <Cmd>Ddu file_rec<CR>
elseif s:current_ff == "ctrlp"
  nnoremap <leader>f <Cmd>CtrlP .<CR>


tnoremap <C-[> <C-\><C-n>
nnoremap gh <Cmd>LspHover<CR>
nnoremap gd <Cmd>LspDefinition<CR>
"}}}

" vim: foldmethod=marker foldlevelstart=99
