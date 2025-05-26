require("config.lazy")
require("nvim-configs")
require("dashboard")

-- autosave tddf
vim.opt.tabstop = 2      -- Number of spaces a tab counts for
vim.opt.shiftwidth = 1   -- Number of spaces for indentation
vim.opt.expandtab = true -- Convert tabs to spaces

vim.o.number = true  -- Enable absolute line numbers
vim.o.relativenumber = true  -- Enable relative line numbers
vim.o.cursorline = true  -- Highlight the current line
vim.cmd [[highlight CursorLineNr guifg=#61afef gui=bold]]


vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {"*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp"},
  callback = function()
    local path = vim.fn.expand("%:p")
    -- Open image with your preferred image viewer in background
    os.execute(string.format("nohup gthumb '%s' >/dev/null 2>&1 &", path))

    -- Close the image buffer in Neovim
    vim.defer_fn(function()
      vim.cmd("bd!")
    end, 10)
  end,
})


