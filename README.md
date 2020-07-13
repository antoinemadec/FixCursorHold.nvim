Fix Neovim's CursorHold perf bug
=================================

Rationale
---------

Neovim's implementations of **CusorHold** and **CursorHoldI** autocmd events have a [performance bug][issue]
which causes slowdowns, and sometimes, don't even trigger those events.

This plugin fixes this by manually triggering those.

This will result in more snapiness for plugins using those events, such as:
**coc.nvim**, **vim-gutter**, **tagbar**, **vim-devicons**, **vim-polyglot**, etc.

Installation
---------

Make sure to have the following plugins in your **vimrc**:
```vim
Plug 'antoinemadec/FixCursorHold.nvim'
```

License
-------

MIT

[issue]: https://github.com/neovim/neovim/issues/12587
