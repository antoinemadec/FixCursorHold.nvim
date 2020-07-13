" Maintainer:   Antoine Madec <aja.madec@gmail.com>

if exists('g:loaded_fix_cursorhold_nvim') || !has('nvim')
  finish
else
  let g:loaded_fix_cursorhold_nvim = 'yes'
endif

set eventignore+=CursorHold

augroup fix_cursorhold_nvim
  autocmd!
  autocmd CursorMoved * call s:CursorHoldTimer()
augroup end

function s:CursorHold_Cb(timer_id) abort
  set eventignore-=CursorHold
  doautocmd <nomodeline> CursorHold
  set eventignore+=CursorHold
endfunction

function s:CursorHoldTimer() abort
  if exists('g:fix_cursorhold_nvim_timer')
    call timer_stop(g:fix_cursorhold_nvim_timer)
  endif
  let g:fix_cursorhold_nvim_timer = timer_start(&updatetime, function('s:CursorHold_Cb'))
endfunction
