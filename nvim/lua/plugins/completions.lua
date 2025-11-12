return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        build = "make install_jsregexp", -- optional, but improves regex matching
        config = function()
            local ls = require("luasnip")

            -- 🔹 Load friendly-snippets (community ones)
            require("luasnip.loaders.from_vscode").lazy_load()

        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",        -- LSP completion
            "hrsh7th/cmp-buffer",          -- Buffer words
            "hrsh7th/cmp-path",            -- File system paths
            "saadparwaiz1/cmp_luasnip",    -- Snippets source
            "L3MON4D3/LuaSnip",            -- Snippet engine
            "rafamadriz/friendly-snippets", -- Predefined snippets
                "onsails/lspkind.nvim",  -- 🔥 icons
        },

        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Load vscode-style snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),

                    -- Tab navigation
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),

                formatting = {
                    format = function(entry, vim_item)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snip]",
                            buffer = "[Buf]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({
                filetypes = { "html", "css", "xml", "javascriptreact", "typescriptreact", "eruby" }, -- Add eruby
            })
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Ensure Treesitter is installed
    },
}
