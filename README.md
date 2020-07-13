Fix Neovim's CursorHold perf bug
=================================

Rationale
---------

Neovim's current implementation of **CusorHold** autocmd has a [performance bug][issue]
which causes slowdowns, and sometimes, don't even trigger **CursorHold**.

This plugin fixes this by manually triggering **CursorHold**.

This will result in more snapiness for plugins using **CursorHold**, such as:
**coc.nvim**, **tagbar**, **vim-devicons**, **vim-polyglot**, etc.

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
