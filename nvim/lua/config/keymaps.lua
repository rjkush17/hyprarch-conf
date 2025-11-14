--------------------------------------------------------------------------------
-- 🧩 Core Keymaps (Base Neovim Configuration)
-- Description: -- Keymaps configuration for all installed Neovim plugins and some my customer keymaps
--------------------------------------------------------------------------------

-- Ensure 'vim' global is recognized by LSP
---@diagnostic disable-next-line: undefined-global
local vim = vim

-- Short alias for setting keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--------------------------------------------------------------------------------
-- ⌨️ Insert Mode Keymaps
--------------------------------------------------------------------------------

-- Insert a new line below and stay in insert mode
map("i", "<C-o>", "<Esc>o", { desc = "Insert new line below" })

-- Insert a new line above and stay in insert mode
map("i", "<C-O>", "<Esc>O", { desc = "Insert new line above" })

-- ✏️ Move Cursor in Insert Mode (using Ctrl + h/j/k/l)
map("i", "<C-h>", "<Left>", opts)  -- Move cursor left
map("i", "<C-j>", "<Down>", opts)  -- Move cursor down
map("i", "<C-k>", "<Up>", opts)    -- Move cursor up
map("i", "<C-l>", "<Right>", opts) -- Move cursor right

-- 🌍 Basic LSP
map("n", "gd", vim.lsp.buf.definition, opts)                -- go to definition
map("n", "gD", vim.lsp.buf.declaration, opts)               -- go to declaration
map("n", "gi", vim.lsp.buf.implementation, opts)            -- go to implementation
map("n", "gr", vim.lsp.buf.references, opts)                -- show references
map("n", "K", vim.lsp.buf.hover, opts)                      -- hover documentation
map("n", "<leader>rn", vim.lsp.buf.rename, opts)            -- rename symbol
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)       -- code actions

-- 🧠 Manual format shortcut (no auto format)
vim.keymap.set("n", "<leader>gf", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format code using LSP" })

-- Better diagnostic keys without overriding common controls
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', '<leader>dd', function()
    vim.diagnostic.setloclist()
end, { desc = 'Show all diagnostics' })

--------------------------------------------------------------------------------
-- 🧩 Plugin: todo-comments.nvim
--------------------------------------------------------------------------------

-- Jump to next TODO comment
map("n", "<leader>tn", function()
    require("todo-comments").jump_next()
end, vim.tbl_extend("force", opts, { desc = "Next TODO comment" }))

-- Jump to previous TODO comment
map("n", "<leader>tp", function()
    require("todo-comments").jump_prev()
end, vim.tbl_extend("force", opts, { desc = "Previous TODO comment" }))

-- 🔭 Telescope Integration

-- Open all TODO comments using Telescope UI
map(
    "n",
    "<leader>tt",
    ":TodoTelescope<CR>",
    vim.tbl_extend("force", opts, {
        desc = "Open all TODOs with Telescope",
    })
)

-- Open all TODO comments in the Location List
map(
    "n",
    "<leader>tl",
    ":TodoLocList<CR>",
    vim.tbl_extend("force", opts, {
        desc = "Open all TODOs in Location List",
    })
)

--------------------------------------------------------------------------------
-- 🧩 Plugin: telescope.nvim
--------------------------------------------------------------------------------

-- Find files using Telescope's built-in file finder
map(
    "n",
    "<C-p>",
    require("telescope.builtin").find_files,
    vim.tbl_extend("force", opts, {
        desc = "Find files",
    })
)

-- Live grep with Telescope
map(
    "n",
    "<C-g>",
    "<cmd>Telescope live_grep<CR>",
    vim.tbl_extend("force", opts, {
        desc = "Live grep search",
    })
)

--------------------------------------------------------------------------------
-- 🧩 Plugin: bufferline.nvim
--------------------------------------------------------------------------------

-- Go to next buffer
map(
    "n",
    "<leader>bn",
    ":BufferLineCycleNext<CR>",
    vim.tbl_extend("force", opts, {
        desc = "Next buffer",
    })
)

-- Go to previous buffer
map(
    "n",
    "<leader>bp",
    ":BufferLineCyclePrev<CR>",
    vim.tbl_extend("force", opts, {
        desc = "Previous buffer",
    })
)

-- Close current buffer
map(
    "n",
    "<leader>x",
    ":bdelete<CR>",
    vim.tbl_extend("force", opts, {
        desc = "Close current buffer",
    })
)

--------------------------------------------------------------------------------
-- ⚡ Plugin: flash.nvim
--------------------------------------------------------------------------------

-- Jump to any word/character using Flash in normal, visual, operator-pending modes
map({ "n", "x", "o" }, "s", function()
    require("flash").jump()
end, { noremap = true, silent = true, desc = "Flash Jump" })

-- Treesitter-aware jump (scope-aware) in normal, visual, operator-pending modes
map({ "n", "x", "o" }, "S", function()
    require("flash").treesitter()
end, { noremap = true, silent = true, desc = "Flash Treesitter" })

-- Remote jump from operator-pending mode (like targets.vim)
map("o", "fr", function()
    require("flash").remote()
end, { noremap = true, silent = true, desc = "Flash Remote" })

--------------------------------------------------------------------------------
-- 🗂️ Plugin: ufo.nvim
--------------------------------------------------------------------------------

-- Open all folds
map("n", "<leader>za", require("ufo").openAllFolds, { desc = "Open all folds" })

-- Close all folds
map("n", "<leader>zc", require("ufo").closeAllFolds, { desc = "Close all folds" })

-- Toggle fold under cursor
map("n", "z", "za", { desc = "Toggle fold under cursor" })

--------------------------------------------------------------------------------
-- ✨ Plugin: noice.nvim
--------------------------------------------------------------------------------

-- Open Noice
vim.api.nvim_set_keymap("n", "<leader>nn", ":Noice<CR>", { noremap = true, silent = true })

-- Dismiss Noice notifications
vim.api.nvim_set_keymap("n", "<leader>c", ":NoiceDismiss<CR>", { noremap = true, silent = true })

-- Show Noice history
vim.api.nvim_set_keymap("n", "<leader>nh", ":NoiceHistory<CR>", { noremap = true, silent = true })

--------------------------------------------------------------------------------
-- 📋 Plugin: nvim-neoclip
--------------------------------------------------------------------------------

-- Open Neoclip clipboard history using Telescope
map("n", "<leader>a", ":Telescope neoclip<CR>", { noremap = true, silent = true })

--------------------------------------------------------------------------------
-- 🌲 Plugin: neo-tree.nvim
--------------------------------------------------------------------------------

-- Toggle NvimTree file explorer
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

--------------------------------------------------------------------------------
-- 🌐 Plugin: live.server.nvim
--------------------------------------------------------------------------------

-- Start Live Server
vim.api.nvim_set_keymap("n", "<leader>ls", ":LiveServerStart<CR>", { noremap = true, silent = true })

-- Stop Live Server
vim.api.nvim_set_keymap("n", "<leader>le", ":LiveServerStop<CR>", { noremap = true, silent = true })

--------------------------------------------------------------------------------
-- 💬 Plugin: Comment.nvim
--------------------------------------------------------------------------------

-- Toggle comment in normal mode (linewise)
map("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment (linewise)", silent = true })

-- Toggle comment in visual mode (linewise)
map("v", "<leader>/", function()
    require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment (visual)", silent = true })

--------------------------------------------------------------------------------
-- xxx End of the File xxx --
--------------------------------------------------------------------------------
