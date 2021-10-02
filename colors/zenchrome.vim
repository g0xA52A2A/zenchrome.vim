let g:colors_name='zenchrome'

call zenchrome#Sync()

augroup Zenchrome
  autocmd!
  autocmd Syntax * call zenchrome#Sync()
  autocmd ColorschemePre *
    \ if expand('<amatch>') !=# 'zenchrome'
    \ |   autocmd! Zenchrome
    \ | endif
augroup END
