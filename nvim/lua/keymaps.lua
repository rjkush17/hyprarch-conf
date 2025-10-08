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
map("i", "<C-h>", "<Left>", opts) -- Move cursor left
map("i", "<C-j>", "<Down>", opts) -- Move cursor down
map("i", "<C-k>", "<Up>", opts) -- Move cursor up
map("i", "<C-l>", "<Right>", opts) -- Move cursor right

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
-- 🧩 Plugin: vim-visual-multi
--------------------------------------------------------------------------------

vim.g.VM_maps = {
	["Find Under"] = "<leader>vd", -- Select word under cursor
	["Find Subword Under"] = "<leader>vd", -- Select subword under cursor
	["Remove Region"] = "<leader>vx", -- Remove current region
	["Skip Region"] = "<leader>vn", -- Skip current match
	["Undo"] = "<leader>vu", -- Undo last selection
	["Redo"] = "<leader>vr", -- Redo last undone selection
	["Start Regex Search"] = "<leader>v/", -- Start regex search for multi-cursor
}

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
-- 🧩 Plugin: none-ls.nvim
--------------------------------------------------------------------------------

-- Format current buffer using LSP
map(
	"n",
	"<leader>gf",
	vim.lsp.buf.format,
	vim.tbl_extend("force", opts, {
		desc = "Format current buffer",
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
vim.api.nvim_set_keymap("n", "<leader>n", ":Noice<CR>", { noremap = true, silent = true })

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

-- Toggle Neo-tree file explorer
map("n", "<C-b>", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim-tree" })

--------------------------------------------------------------------------------
-- 🧠 Plugin: nvim-lspconfig
--------------------------------------------------------------------------------

-- Show hover information
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })

-- Go to definition
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })

-- Trigger code action
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

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
-- 🤖 Plugin: Avante
--------------------------------------------------------------------------------

map("n", "<leader>aa", "<cmd>AvanteToggle<CR>", { desc = "Avante Toggle" })
map("n", "<leader>ar", "<cmd>AvanteRefresh<CR>", { desc = "Avante Refresh" })
map("n", "<leader>af", "<cmd>AvanteFocus<CR>", { desc = "Avante Focus" })
map("n", "<leader>an", "<cmd>AvanteAsk<CR>", { desc = "Avante Ask" })
map("n", "<leader>ac", "<cmd>AvanteChat<CR>", { desc = "Avante Chat" })
map("n", "<leader>acn", "<cmd>AvanteChatNew<CR>", { desc = "Avante New Chat" })
map("n", "<leader>ab", "<cmd>AvanteBuild<CR>", { desc = "Avante Build" })
map("n", "<leader>ah", "<cmd>AvanteHistory<CR>", { desc = "Avante History" })
map("n", "<leader>as", "<cmd>AvanteStop<CR>", { desc = "Avante Stop" })
map("n", "<leader>ae", "<cmd>AvanteEdit<CR>", { desc = "Avante Edit" })
map("n", "<leader>aR", "<cmd>AvanteSwitchProvider<CR>", { desc = "Avante Switch Provider" })
map("n", "<leader>aM", "<cmd>AvanteModels<CR>", { desc = "Avante Models" })
map("n", "<leader>a?", "<cmd>AvanteSwitchSelectorProvider<CR>", { desc = "Avante Switch Selector" })
map("n", "<leader>aT", "<cmd>AvanteShowRepoMap<CR>", { desc = "Avante Repo Map" })
map("n", "<leader>aC", "<cmd>AvanteClear<CR>", { desc = "Avante Clear Chat" })

--------------------------------------------------------------------------------
--xxx End of keymaps xxx--
--------------------------------------------------------------------------------
