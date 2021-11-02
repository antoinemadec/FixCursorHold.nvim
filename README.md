Fix CursorHold Performance
=================================

Rationale
---------

This plugin exists for two reasons:
  1. fix neovim **CursorHold** and **CursorHoldI** autocmd events [performance bug][issue]
  2. decouple **updatetime** from **CursorHold** and **CursorHoldI** (works for Vim and Neovim)

1., fixes slowdowns and untriggered events

2., you can now use small delays for **CursorHold** without writing the swap file 10x/sec (see :help updatetime)

This will result in more snappiness for plugins using those events, such as:
**coc.nvim**, **vim-gutter**, **tagbar**, **vim-devicons**, **vim-polyglot**, etc.

Installation
---------

Make sure to have the following plugins in your **vimrc**:
```vim
Plug 'antoinemadec/FixCursorHold.nvim'
```
Configuration
---------

```vim
" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100
```

License
-------

MIT

[issue]: https://github.com/neovim/neovim/issues/12587
