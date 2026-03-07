return {
	{
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
					terminal_colors = false,
				},
			})
				vim.cmd("colorscheme onedark")
		end,
	},
	-- lua/plugins/rose-pine.lua
	{
		"rose-pine/neovim",
		name = "rose-pine",
            enable = false,
		lazy = false, -- load immediately
		priority = 1000, -- load before other UI plugins
		config = function()
			require("rose-pine").setup({
				variant = "main", -- auto, main, moon, dawn
				dark_variant = "main",

				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true,
					migrations = true,
				},

				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",
				},

				highlight_groups = {

                       Type = { bold = true },

        -- methods = "NONE"
        Method = {},

        -- numbers = "NONE"
        Number = {},

        -- strings = "italic"
        String = { italic = true },

        -- comments = "italic"
        Comment = { italic = true },

        -- keywords = "bold,italic"
        Keyword = { bold = true, italic = true },

        -- constants = "NONE"
        Constant = {},

        -- functions = "bold"
        Function = { bold = true },

        -- operators = "NONE"
        Operator = {},

        -- variables = "bold"
        Identifier = { bold = true },

        -- parameters = "italic"
        Parameter = { italic = true },

        -- conditionals = "italic"
        Conditional = { italic = true },

					DiagnosticError = { fg = "love" },
					DiagnosticWarn = { fg = "gold" },
					DiagnosticInfo = { fg = "foam" },
					DiagnosticHint = { fg = "iris" },
				},
			})

			-- vim.cmd.colorscheme("rose-pine")
		end,
	},
}
