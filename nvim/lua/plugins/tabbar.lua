return {
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                options = {
                    numbers = "none",
                    show_buffer_icons = true,
                    show_close_icon = false, -- remove main close icon
                    show_buffer_close_icons = false, -- remove buffer close icons
                    separator_style = "thick", -- or try "padded_slant"
                    always_show_bufferline = true,
                    indicator = { style = "underline" }, -- subtle underline instead of bold block
                    modified_icon = "●",
                    close_icon = "",
                    max_name_length = 18, -- truncate long names
                    tab_size = 20,
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "━━━   File Explorer  ━━━",
                            text_align = "center",
                            separator = true,
                        },
                    },

                    custom_filter = function(buf_number)
                        return true
                    end,
                    -- optional: highlight inactive tabs differently
                    highlights = {
                        buffer_selected = {
                            bold = true,
                            italic = false,
                        },
                        fill = {
                            bg = "#1e1e2e", -- match your colorscheme background
                        },
                    },
                },
            })
        end,
    },
}
