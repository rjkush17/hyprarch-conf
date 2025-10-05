return {
  -- Mason Installer UI
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  -- Bridge between Mason and LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",     -- ✅ Fixed name from ts_ls
          "solargraph",
          "ruby_lsp",
          "tailwindcss",  -- ✅ Tailwind LSP
        }
      })
    end
  },

  -- Main LSP Configuration
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

      -- Optional: basic keymaps (commented if needed later)
      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    end
  },
}

