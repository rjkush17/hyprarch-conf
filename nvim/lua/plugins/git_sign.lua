return {
	{
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup({
					signs = {
						add = { text = "┃" },
						change = { text = "┃" },
						delete = { text = "_" },
						topdelete = { text = "‾" },
						changedelete = { text = "~" },
						untracked = { text = "┆" },
					},
					signs_staged = {
						add = { text = "┃" },
						change = { text = "┃" },
						delete = { text = "_" },
						topdelete = { text = "‾" },
						changedelete = { text = "~" },
						untracked = { text = "┆" },
					},
					signs_staged_enable = true,
					signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
					numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
					linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
					word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
					watch_gitdir = {
						follow_files = true,
					},
					auto_attach = true,
					attach_to_untracked = false,
					current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
					current_line_blame_opts = {
						virt_text = true,
						virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
						delay = 1000,
						ignore_whitespace = false,
						virt_text_priority = 100,
						use_focus = true,
					},
					current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
					sign_priority = 6,
					update_debounce = 100,
					status_formatter = nil, -- Use default
					max_file_length = 40000, -- Disable if file is longer than this (in lines)
					preview_config = {
						-- Options passed to nvim_open_win
						border = "single",
						style = "minimal",
						relative = "cursor",
						row = 0,
						col = 1,
					},
				})
			end,
		},
		{
			"tpope/vim-fugitive",
			cmd = {
				"Git",
				"Gdiffsplit",
				"Gread",
				"Gwrite",
				"Ggrep",
				"GMove",
				"GDelete",
				"GBrowse",
				"GRemove",
				"GRename",
				"Glgrep",
				"Gedit",
			},
			ft = { "fugitive" },
		},
		{
			"kdheepak/lazygit.nvim",
			cmd = "LazyGit",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
	},
	-- Lua
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("diffview").setup({
				use_icons = true, -- Use Nerd Font icons
				enhanced_diff_hl = true, -- Treesitter syntax highlight in diffs
				view = {
					merge_tool = {
						layout = "diff3_mixed", -- better for 3-way merge view
						disable_diagnostics = true,
					},
				},
			})
		end,
	},
}
