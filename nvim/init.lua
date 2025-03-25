require("config.lazy")
require("nvim-configs")
require("dashboard")

-- autosave tddf
vim.opt.tabstop = 2      -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2   -- Number of spaces for indentation
vim.opt.expandtab = true -- Convert tabs to spaces

vim.o.number = true  -- Enable absolute line numbers
vim.o.relativenumber = true  -- Enable relative line numbers
vim.o.cursorline = true  -- Highlight the current line
vim.cmd [[highlight CursorLineNr guifg=#61afef gui=bold]]
