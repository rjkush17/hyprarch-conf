-- 🏗️ Core Neovim Configuration
--------------------------------------------------------------------------------

-- Load plugin and custom configs
require("config.lazy")
require("config.keymaps")
-- require("config.lsp")

-- Ensure 'vim' global is recognized by LSP
---@diagnostic disable-next-line: undefined-global
local vim = vim

--------------------------------------------------------------------------------
-- ⌨️ Editor Settings
--------------------------------------------------------------------------------

-- Tab and indentation settings
vim.opt.tabstop = 6      -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4   -- Number of spaces for indentation
vim.opt.expandtab = true -- Convert tabs to spaces
--
-- Line number and cursor settings
vim.o.number = true                                       -- Enable absolute line numbers
vim.o.relativenumber = true                               -- Enable relative line numbers
vim.o.cursorline = true                                   -- Highlight the current line
vim.cmd [[highlight CursorLineNr guifg=#61afef gui=bold]] -- Highlight line number of current line

--------------------------------------------------------------------------------
-- 🖼️ Auto Open Images in Default Viewer
--------------------------------------------------------------------------------

-- Automatically open images in gthumb when entering their buffer
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
    callback = function()
        local path = vim.fn.expand("%:p")
        -- Open image with gthumb in background
        os.execute(string.format("nohup xdg-open '%s' >/dev/null 2>&1 &", path))

        -- Close the image buffer in Neovim
        vim.defer_fn(function()
            vim.cmd("bd!")
        end, 10)
    end,
})

--------------------------------------------------------------------------------
-- ⚠️ LSP Diagnostics Configuration
--------------------------------------------------------------------------------

vim.diagnostic.config({
    -- Virtual text settings
    virtual_text = {
        prefix = "✖", -- Symbol before the diagnostic message
        spacing = 2, -- Space between symbol and message
    },
    signs = true, -- Show signs in the sign column
    underline = true, -- Underline problematic code
    update_in_insert = false, -- Don't update diagnostics while in insert mode
})

--------------------------------------------------------------------------------
-- Some Config for the borders/UI
--------------------------------------------------------------------------------
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5c6370" }) -- thin color
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
  }
)

require("telescope").setup({
  defaults = {
    borderchars = {
      prompt  = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
  },
})
--------------------------------------------------------------------------------
-- xxx End of the FIle xxx
--------------------------------------------------------------------------------
--# Diable mouse doe to hard learnign curve
vim.opt.mouse = "a"
