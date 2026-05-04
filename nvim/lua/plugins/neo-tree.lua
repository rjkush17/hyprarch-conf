return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("nvim-tree").setup({
				view = {
					signcolumn = "yes",
					cursorline = false,
					width = 31,
					side = "left",
				},

				git = { enable = true, ignore = false },

				diagnostics = {
					enable = true,
					icons = { hint = "", info = "", warning = " ", error = "󰞇 " },
				},

				renderer = {
					indent_markers = { enable = false },
					icons = {
						show = { diagnostics = true, git = true, folder = true, file = true, folder_arrow = true },
						diagnostics_placement = "right_align",
					},
					-- glyphs = {
					--     git = {
					--         unstaged = " ", -- icon for unstaged file
					--         staged = " ", -- icon for staged file
					--         unmerged = " ", -- merge conflict
					--         renamed = "➜ ", -- renamed file
					--         untracked = "★", -- new file
					--         deleted = " ", -- deleted file
					--         ignored = "◌ ", -- ignored by .gitignore
					--     },
					-- },
					highlight_diagnostics = "icon",
					group_empty = true,
					root_folder_label = function(path)
						return vim.fn.fnamemodify(path, ":t")
					end,
				},
				update_focused_file = { enable = true, update_root = false },
				filters = { dotfiles = false, custom = { "^.git$" } },
			})
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					layout_strategy = "horizontal", -- 👈 normal Telescope layout
					layout_config = {
						preview_width = 0.55, -- 👁️ preview on right
						--   prompt_position = "bottom", -- 🔎 search bar on bottom
						width = 0.95,
						height = 0.90,
					},
				},
				extensions = {
					file_browser = {
						-- theme = "ivy", -- clean dropdown
						hijack_netrw = true,
						hidden = true,
						respect_gitignore = false,
						grouped = true,
						previewer = true, -- 👁️ enable preview
					},
				},
			})

			telescope.load_extension("file_browser")

			-- 🔍 Open File Browser in current dir
			vim.keymap.set("n", "<leader>fB", function()
				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					select_buffer = true,
					previewer = true,
				})
			end, { desc = "Open Telescope File Browser (current dir)" })

			-- 🔍 Open File Browser in project root
			vim.keymap.set("n", "<leader>fb", function()
				telescope.extensions.file_browser.file_browser({
					path = vim.loop.cwd(),
					previewer = true,
				})
			end, { desc = "Open Telescope File Browser (root dir)" })
		end,
	},
}
