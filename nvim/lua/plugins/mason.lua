return {
    {
        -- 🧱 Mason core (LSP, DAP, Linters, Formatters)
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",         -- auto LSP setup
            "neovim/nvim-lspconfig",                     -- core LSP
            "WhoIsSethDaniel/mason-tool-installer.nvim", -- auto install tools
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "tsserver", -- TypeScript / JavaScript
                    "html",
                    "cssls",
                    "jsonls",
                    "bashls",
                    "emmet_ls",
                    "lua_ls",
                },
                automatic_installation = true,
            })

            require("mason-tool-installer").setup({
                ensure_installed = {
                    "prettier",
                    "eslint_d",
                },
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim", -- previously called jose-elias-alvarez/null-ls.nvim
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- ✅ Formatters
                    null_ls.builtins.formatting.stylua,         -- Lua
                    null_ls.builtins.formatting.prettier,       -- JS, TS, JSX, TSX, JSON, CSS, HTML
                    null_ls.builtins.formatting.htmlbeautifier, -- HTML
                    null_ls.builtins.formatting.rubocop,        -- Ruby
                    null_ls.builtins.formatting.fixjson,        -- JSON

                    -- ✅ Linters
                    null_ls.builtins.diagnostics.rubocop,   -- Ruby lint
                    null_ls.builtins.diagnostics.eslint,    -- JS/TS lint
                    null_ls.builtins.diagnostics.erblint,   -- ERB
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Lua LSP
            lspconfig.lua_ls.setup({})

            -- TypeScript/JavaScript LSP
            lspconfig.ts_ls.setup({})

            -- Ruby LSPs
            lspconfig.solargraph.setup({})
            lspconfig.ruby_lsp.setup({})

            -- Tailwind CSS LSP
            lspconfig.tailwindcss.setup({
                filetypes = {
                    "html", "css", "scss", "javascript", "typescript",
                    "javascriptreact", "typescriptreact", "svelte", "vue"
                },
                init_options = {
                    userLanguages = {
                        eruby = "html", -- for Ruby on Rails ERB files
                    },
                },
            })
        end
    },
}
