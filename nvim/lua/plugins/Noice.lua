-- return {
-- 	{
-- 		"folke/noice.nvim",
-- 		event = "VeryLazy",
-- 		dependencies = {
-- 			"MunifTanjim/nui.nvim",
-- 			"rcarriga/nvim-notify",
-- 		},
-- 		config = function()
-- 			require("noice").setup()
-- 			require("notify").setup({
-- 				enabled = false, -- comment: disable noice notifications
-- 				stages = "slide",
-- 				timeout = 2000,
-- 				render = "compact",
-- 				background_colour = "#000000",
-- 				max_width = 45,
-- 				max_height = 4,
-- 				top_down = true, -- show in bottom-right
-- 			})
-- 			-- vim.notify = require("notify")
-- 		end,
-- 	},
-- 	{
-- 		"j-hui/fidget.nvim",
-- 		event = "LspAttach", -- Load only when LSP starts
-- 		opts = {
-- 			progress = {
-- 				suppress_on_insert = true, -- Don't show while typing
-- 				display = {
-- 					done_icon = "✔", -- Simple done icon
-- 					progress_icon = { "dots" }, -- Animated dots while loading
-- 				},
-- 			},
-- 			notification = {
-- 				window = {
-- 					winblend = 0, -- Slight transparency
-- 					border = "none", -- Rounded border for better visuals
-- 					blend = 0,
-- 				},
-- 			},
-- 		},
-- 		config = function(_, opts)
-- 			require("fidget").setup(opts)
-- 			vim.notify = require("fidget").notify -- comment: enable fidget notifications globally
-- 		end,
-- 	},
-- }

return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- "rcarriga/nvim-notify", -- comment: remove notify
		},
		config = function()
			require("noice").setup({
				notify = {
					enabled = false, -- comment: Noice will NOT take over notifications
				},
				messages = {
					enabled = true, -- comment: keep message UI
				},
				lsp = {
					progress = { enabled = false }, -- comment: No LSP progress since fidget does this
					hover = { enabled = true },
					signature = { enabled = true },
				},
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			progress = {
				suppress_on_insert = true,
				display = {
					done_icon = "✔",
					progress_icon = { "dots" },
				},
			},
			notification = {
				window = {
					winblend = 0,
					border = "none",
				},
			},
		},
		config = function(_, opts)
			local fidget = require("fidget")
			fidget.setup(opts)

			vim.notify = fidget.notify -- comment: Fidget handles ALL notifications
		end,
	},
}
