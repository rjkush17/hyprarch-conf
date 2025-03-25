return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x", -- Fixed this line
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = 33, -- Set NeoTree width to 25 columns (adjust as needed)
			},
			filesystem = {
				filtered_items = {
					visible = true, -- Show hidden files
					hide_dotfiles = false, -- Don't hide files starting with `.`
					hide_gitignored = false, -- Show gitignored files too
				},
			},
		})
		vim.keymap.set('n', '<C-b>', ':Neotree filesystem toggle left<CR>', {})
		vim.keymap.set("n", "<leader>b", function()
			if vim.bo.filetype == "neo-tree" then
				vim.cmd("wincmd p") -- Go to the previous window if NeoTree is focused
			else
				vim.cmd("Neotree focus") -- Move focus to NeoTree if it's open
			end
		end, { noremap = true, silent = true })
	end
}
