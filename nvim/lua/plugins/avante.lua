return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    -- version = "v0.0.24", -- never set to "*"
    opts = {
        provider = "openai",
        providers = {
            openai = {
                endpoint = "https://api.openai.com/v1",
                model = "gpt-4o-mini",
            },
        },
    },
    build = "make",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        -- optional extras:
        "echasnovski/mini.pick",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        "ibhagwan/fzf-lua",
        "stevearc/dressing.nvim",
        "folke/snacks.nvim",
        "nvim-tree/nvim-web-devicons",
        "zbirenbaum/copilot.lua",
        {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = { insert_mode = true },
                    use_absolute_path = true,
                },
            },
        },
        {
            "MeanderingProgrammer/render-markdown.nvim",
            ft = { "markdown", "Avante" },
            opts = { file_types = { "markdown", "Avante" } },
        },
    },
}
