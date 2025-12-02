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
    "leath-dub/snipe.nvim",

    -- your keymaps (all inside keys table)
    keys = {
        {
            "<TAB>",
            function() require("snipe").open_buffer_menu() end,
            desc = "Quick Switch Buffer", -- comment
        },
        {
            "<C-TAB>",
            function() require("snipe").open_file_menu() end,
            desc = "Recent Files", -- comment
        },
        {
            "<leader>bb",
            function() require("snipe").open_buffer_menu({ sort = "name" }) end,
            desc = "Buffers (A-Z)", -- comment
        },
    },

    -- plugin options
    opts = {
        ui = {
            max_height = -1, -- comment: dynamic height
            position = "center", -- comment: window position

            -- window styling
            open_win_override = {
                border = "single", -- comment: change to "rounded" if you want rounded border
            },

            preselect_current = true, -- comment
            preselect = nil, -- comment

            text_align = "left", -- comment

            persist_tags = true, -- comment
        },

        hints = {
            dictionary = "sadflewcmpghio", -- comment: keys used to tag buffers
            prefix_key = ".", -- comment
        },

        navigate = {
            leader = ",", -- comment: special leader inside the snipe popup

            -- leader actions
            leader_map = {
                ["d"] = function(m, i) require("snipe").close_buf(m, i) end, -- comment: delete
                ["v"] = function(m, i) require("snipe").open_vsplit(m, i) end, -- comment: vsplit
                ["h"] = function(m, i) require("snipe").open_split(m, i) end, -- comment: split
            },

            next_page = "J", -- comment
            prev_page = "K", -- comment

            under_cursor = "<cr>", -- comment: open buffer
            cancel_snipe = "<esc>", -- comment

            close_buffer = "D", -- comment: close buffer under cursor
            open_vsplit = "V", -- comment
            open_split = "H", -- comment
        },

        sort = "default", -- comment: default sorting
    },
}
