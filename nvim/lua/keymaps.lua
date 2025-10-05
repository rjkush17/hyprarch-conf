local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--todo-comments.nvim Keybindings

-- Jump to next TODO comment (via todo-comments.nvim)
map("n", "<leader>tn", function()
	require("todo-comments").jump_next()
end, vim.tbl_extend("force", opts, { desc = "Next todo comment" }))

-- Jump to previous TODO comment (via todo-comments.nvim)
map("n", "<leader>tp", function()
	require("todo-comments").jump_prev()
end, vim.tbl_extend("force", opts, { desc = "Previous todo comment" }))

-- Telescope integration
-- Open all TODO comments using Telescope UI
vim.keymap.set(
	"n",
	"<leader>tt",
	":TodoTelescope<CR>",
	{ desc = "Open TODOs with Telescope", noremap = true, silent = true }
)
-- Open all TODO comments in the Location List
vim.keymap.set(
	"n",
	"<leader>tl",
	":TodoLocList<CR>",
	{ desc = "Open TODOs in Location List", noremap = true, silent = true }
)

-- Plugin: telescope.nvim → 🔍 Find files using Telescope's built-in file finder
vim.keymap.set(
	"n",
	"<C-p>",
	require("telescope.builtin").find_files,
	{ desc = "Find Files", noremap = true, silent = true }
)

-- Live grep with Telescope
vim.keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

-- 🔀 vim-visual-multi keymaps (All start with <leader>v)
vim.g.VM_maps = {
	["Find Under"] = "<leader>vd", -- Select word under cursor
	["Find Subword Under"] = "<leader>vd", -- Select subword under cursor
	["Remove Region"] = "<leader>vx", -- Remove current cursor/region
	["Skip Region"] = "<leader>vn", -- Skip current match
	["Undo"] = "<leader>vu", -- Undo last selection
	["Redo"] = "<leader>vr", -- Redo last undone selection
	["Start Regex Search"] = "<leader>v/", -- Regex search fr multi-cursor
}

-- 📦 bufferline.nvim Keybindings for buffer navigation

-- Go to next buffer
vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
-- Go to previous buffer
vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
-- Close current buffer
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { noremap = true, silent = true })

-- none-ls.nvim
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- ⚡ flash.nvim Keybindings for fast navigation
-- Jump to word/char using Flash in normal, visual, operator-pending modes
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { noremap = true, silent = true, desc = "Flash Jump" })

-- Treesitter-based jump (scope-aware) in normal, visual, operator-pending modes
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { noremap = true, silent = true, desc = "Flash Treesitter" })

-- Remote jump from operator-pending mode (like targets.vim)
vim.keymap.set("o", "fr", function()
	require("flash").remote()
end, { noremap = true, silent = true, desc = "Flash Remote" })

-- ufo.nvim Keybindings for folding
-- Open all folds
vim.keymap.set("n", "<leader>za", require("ufo").openAllFolds, { desc = "Open all folds" })
-- Close all folds
vim.keymap.set("n", "<leader>zc", require("ufo").closeAllFolds, { desc = "Close all folds" })
-- Toggle a fold under cursor
vim.keymap.set("n", "z", "za", { desc = "Toggle fold under cursor" })

-- noice.nvim
vim.api.nvim_set_keymap("n", "<leader>n", ":Noice<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>c", ":NoiceDismiss<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>nh", ":NoiceHistory<CR>", { noremap = true, silent = true })

-- project.nvim
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { noremap = true, silent = true })

-- telescope-file-browser.nvim: Browse all project folders
vim.keymap.set("n", "<leader>sp", function()
	require("telescope").extensions.file_browser.file_browser({
		path = "~/Projects", -- 👈 change to your main folder
		depth = 10, -- how deep folder tree should go
		hidden = true,
		grouped = true,
		select_buffer = true,
	})
end, { desc = "Browse All Projects" })

-- telescope-projects extension
vim.keymap.set("n", "<leader>fp", function()
	require("telescope").extensions.projects.projects()
end, { desc = "Open Project List" })

--  nvim-neoclip
vim.keymap.set("n", "<leader>a", ":Telescope neoclip<CR>", { noremap = true, silent = true })

-- neo-tree.nvim
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim-tree" })

--- nvim-lspconfig

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" }) -- Fix typo: 'k' -> 'K'
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" }) -- Fix typo: 'k' -> 'K'
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- LazyGit

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- live.server.nvim
-- Keybindings to control the live server
vim.api.nvim_set_keymap("n", "<leader>ls", ":LiveServerStart<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>le", ":LiveServerStop<CR>", { noremap = true, silent = true })

-- Comment.nvim Keybindings for toggling comments

-- Toggle comment in normal mode
vim.keymap.set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment (linewise)", silent = true })

-- Toggle comment in visual mode
vim.keymap.set("v", "<leader>/", function()
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment (visual)", silent = true })

--  Avante Plugins
vim.keymap.set("n", "<leader>aa", "<cmd>AvanteToggle<CR>", { desc = "Avante Toggle" })
vim.keymap.set("n", "<leader>ar", "<cmd>AvanteRefresh<CR>", { desc = "Avante Refresh" })
vim.keymap.set("n", "<leader>af", "<cmd>AvanteFocus<CR>", { desc = "Avante Focus" })
vim.keymap.set("n", "<leader>an", "<cmd>AvanteAsk<CR>", { desc = "Avante Ask" })
vim.keymap.set("n", "<leader>ac", "<cmd>AvanteChat<CR>", { desc = "Avante Chat" })
vim.keymap.set("n", "<leader>acn", "<cmd>AvanteChatNew<CR>", { desc = "Avante New Chat" })
vim.keymap.set("n", "<leader>ab", "<cmd>AvanteBuild<CR>", { desc = "Avante Build" })
vim.keymap.set("n", "<leader>ah", "<cmd>AvanteHistory<CR>", { desc = "Avante History" })
vim.keymap.set("n", "<leader>as", "<cmd>AvanteStop<CR>", { desc = "Avante Stop" })
vim.keymap.set("n", "<leader>ae", "<cmd>AvanteEdit<CR>", { desc = "Avante Edit" })
vim.keymap.set("n", "<leader>aR", "<cmd>AvanteSwitchProvider<CR>", { desc = "Avante Switch Provider" })
vim.keymap.set("n", "<leader>aM", "<cmd>AvanteModels<CR>", { desc = "Avante Models" })
vim.keymap.set("n", "<leader>a?", "<cmd>AvanteSwitchSelectorProvider<CR>", { desc = "Avante Switch Selector" })
vim.keymap.set("n", "<leader>aT", "<cmd>AvanteShowRepoMap<CR>", { desc = "Avante Repo Map" })
vim.keymap.set("n", "<leader>aC", "<cmd>AvanteClear<CR>", { desc = "Avante Clear Chat" })


