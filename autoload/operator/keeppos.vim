let s:save_cpo = &cpo " {{{
set cpo&vim " }}}

let s:ope = ''

onoremap <silent> <Plug>(operator-keeppos-select-char) :normal! v`[o`]<CR>
onoremap <silent> <Plug>(operator-keeppos-select-line) :normal! V`[o`]<CR>
onoremap <silent> <Plug>(operator-keeppos-select-block) :normal! <C-v>`[o`]<CR>

function! operator#keeppos#map(ope) " {{{
  if mode(1) ==# 'no' && s:ope != a:ope
    return ''
  endif

  let s:view = winsaveview()
  set operatorfunc=operator#keeppos#do
  let s:ope = a:ope
  return 'g@'
endfunction " }}}

function! operator#keeppos#do(type) " {{{
  let pre = v:count ? v:count : ''
  let pre .= v:register == '' ? '' : '"' . v:register

  let suf = printf("\<Plug>(operator-keeppos-select-%s)", a:type)

  execute 'normal' . pre . s:ope . suf 

  call winrestview(s:view)
endfunction " }}}

let &cpo = s:save_cpo " {{{
unlet s:save_cpo " }}}

" vim:set et ts=2 sts=2 sw=2 tw=0 foldmethod=marker commentstring=\ "\ %s:
