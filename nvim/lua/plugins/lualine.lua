return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		-- Load matugen palette
		local p = require("colors.matugen").palette

		-- Lualine theme using Base16 roles
		local matugen_theme = {
			normal = {
				a = { fg = p.base00, bg = p.base0B, gui = "bold" }, -- green
				b = { fg = p.base05, bg = p.base01 },
				c = { fg = p.base05, bg = "NONE" },
			},
			insert = {
				a = { fg = p.base00, bg = p.base0D, gui = "bold" }, -- blue
			},
			visual = {
				a = { fg = p.base00, bg = p.base0E, gui = "bold" }, -- magenta
			},
			replace = {
				a = { fg = p.base00, bg = p.base08, gui = "bold" }, -- red
			},
			inactive = {
				a = { fg = p.base03, bg = "NONE" },
				b = { fg = p.base03, bg = "NONE" },
				c = { fg = p.base03, bg = "NONE" },
			},
		}

		require("lualine").setup({
			options = {
				theme = matugen_theme, -- 🔴 THIS is the key
				globalstatus = true,
				icons_enabled = true,

				-- powerline arrows disabled (clean + correct colors)
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},

			sections = {
				lualine_a = {
					{ "mode", upper = true },
				},

				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
					{ "diagnostics", sources = { "nvim_lsp" } },
				},

				lualine_x = {
					{
						function()
							local msg = "No LSP"
							local ft = vim.bo.filetype
							for _, client in ipairs(vim.lsp.get_clients()) do
								if client.config.filetypes and vim.tbl_contains(client.config.filetypes, ft) then
									return "LSP: " .. client.name
								end
							end
							return msg
						end,
						icon = " ",
					},
				},

				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
