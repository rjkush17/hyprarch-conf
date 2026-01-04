-- return {
--     {
--         "akinsho/bufferline.nvim",
--         dependencies = { "nvim-tree/nvim-web-devicons" },
--         config = function()
--             require("bufferline").setup({
--                 options = {
--                     numbers = "none",
--                     show_buffer_icons = true,
--                     show_close_icon = false, -- remove main close icon
--                     show_buffer_close_icons = false, -- remove buffer close icons
--                     separator_style = "thick", -- or try "padded_slant"
--                     always_show_bufferline = true,
--                     indicator = { style = "underline" }, -- subtle underline instead of bold block
--                     modified_icon = "●",
--                     close_icon = "",
--                     max_name_length = 18, -- truncate long names
--                     tab_size = 20,
--                     diagnostics = "nvim_lsp",
--                     offsets = {
--                         {
--                             filetype = "NvimTree",
--                             text = "━━━   File Explorer  ━━━",
--                             text_align = "center",
--                             separator = true,
--                         },
--                     },
--
--                     custom_filter = function(buf_number)
--                         return true
--                     end,
--                     -- optional: highlight inactive tabs differently
--                     highlights = {
--                         buffer_selected = {
--                             bold = true,
--                             italic = false,
--                         },
--                         fill = {
--                             bg = "#1e1e2e", -- match your colorscheme background
--                         },
--                     },
--                 },
--             })
--         end,
--     },
-- }
return {
	{
		"leath-dub/snipe.nvim",
		enabled = false,
		keys = {
			{
				"<TAB>",
				function()
					require("snipe").open_buffer_menu()
				end,
				desc = "Quick Switch Buffer",
			},
			{
				"<C-TAB>",
				function()
					require("snipe").open_file_menu()
				end,
				desc = "Recent Files",
			},
			{
				"<leader>bb",
				function()
					require("snipe").open_buffer_menu({ sort = "name" })
				end,
				desc = "Buffers (A-Z)",
			},
		},
		opts = {
			ui = {
				max_height = -1,
				position = "center",
				open_win_override = {
					border = "single",
				},
				preselect_current = true,
				preselect = nil,
				text_align = "left",
				persist_tags = true,
			},
			hints = {
				dictionary = "1234567890",
				prefix_key = ".",
			},
			navigate = {
				leader = ",",
				leader_map = {
					["d"] = function(m, i)
						require("snipe").close_buf(m, i)
					end,
					["v"] = function(m, i)
						require("snipe").open_vsplit(m, i)
					end,
					["h"] = function(m, i)
						require("snipe").open_split(m, i)
					end,
				},
				next_page = "J",
				prev_page = "K",
				under_cursor = "<cr>",
				cancel_snipe = "<esc>",
				close_buffer = "D",
				open_vsplit = "V",
				open_split = "H",
			},
			sort = "default",
		},
	},

	{
		"mistweaverco/bafa.nvim",
		pin = true,
		config = function()
			require("bafa").setup({
				notify = {
					provider = "vim.notify",
				},
				ui = {
					jump_labels = {
						keys = {
							"1",
							"2",
							"3",
							"4",
							"5",
							"6",
							"7",
							"8",
							"9",
							"0",
							"11",
							"12",
							"13",
							"14",
							"15",
							"16",
							",",
							".",
						},
					},
					diagnostics = true,
					line_numbers = false,
					title = {
						text = " Buffers",
						pos = "center",
					},
					border = "rounded",
					style = "minimal",
					position = {
						preset = "center",
						row = nil,
						col = nil,
					},
					icons = {
						diagnostics = {
							Error = " ",
							Warn = " ",
							Info = "󰛨 ",
							Hint = "",
						},
						sign = {
							changes = "┃",
						},
					},
					hl = {
						sign = {
							modified = "GitSignsChange",
							deleted = "GitSignsDelete",
						},
					},
				},
			})
		end,
	},
}
