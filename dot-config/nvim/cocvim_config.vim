" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Enter Selects the completion
"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Tab and Shift-Tab to navigate throught sugestions
inoremap <expr> <tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <s-tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

      "\ coc#pum#visible() ? coc#_select_confirm() :
inoremap <silent><expr> <TAB>
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
