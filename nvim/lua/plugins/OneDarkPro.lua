return {
	"olimorris/onedarkpro.nvim",
	lazy = false, -- Load immediately
	priority = 1000, -- Ensure it loads before other themes
	config = function()
		require("onedarkpro").setup({
			colors = {}, -- Override colors if needed
			highlights = {
				keywords = { style = "bold" },
				strings = { style = "italic" },
				functions = { style = "italic" },
			},
			styles = {
				types = "bold",
				methods = "NONE",
				numbers = "NONE",
				strings = "italic",
				comments = "italic",
				keywords = "bold,italic",
				constants = "NONE",
				functions = "bold",
				operators = "NONE",
				variables = "bold",
				parameters = "italic",
				conditionals = "italic",
				virtual_text = "italic",
			},
			options = {
				transparency = true, -- Set true for transparent background
				terminal_colors = true,
			},
		})
		vim.cmd("colorscheme onedark")
	end,
}
