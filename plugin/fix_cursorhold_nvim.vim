" Maintainer:   Antoine Madec <aja.madec@gmail.com>

if exists('g:loaded_fix_cursorhold_nvim')
  finish
else
  let g:loaded_fix_cursorhold_nvim = 'yes'
endif

set eventignore+=CursorHold,CursorHoldI

augroup fix_cursorhold_nvim
  autocmd!
  autocmd CursorMoved * call s:CursorHoldTimer("n")
  autocmd CursorMovedI * call s:CursorHoldTimer("i")
augroup end

function s:CursorHold_Cb(timer_id) abort
  set eventignore-=CursorHold
  doautocmd <nomodeline> CursorHold
  set eventignore+=CursorHold
endfunction

function s:CursorHoldI_Cb(timer_id) abort
  set eventignore-=CursorHoldI
  doautocmd <nomodeline> CursorHoldI
  set eventignore+=CursorHoldI
endfunction

function s:CursorHoldTimer(mode) abort
  if exists('g:fix_cursorhold_nvim_timer')
    call timer_stop(g:fix_cursorhold_nvim_timer)
  endif
  let cb = a:mode == "n" ? 's:CursorHold_Cb' : 's:CursorHoldI_Cb'
  let t = get(g:, 'cursorhold_updatetime', &updatetime)
  let g:fix_cursorhold_nvim_timer = timer_start(t, function(cb))
endfunction
