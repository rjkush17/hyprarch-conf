return {
  -- LuaSnip for snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "saadparwaiz1/cmp_luasnip" },
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
    end,
  },

  -- nvim-cmp for autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Press Tab to complete
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- Enable LuaSnip snippets
          { name = "buffer" },
        }),
      })
    end,
  },
  -- ~/.Plugin for emmet html code
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'javascript', 'typescript', 'jsx', 'tsx', 'erb' }, -- Load for specific file types
    config = function()
      -- Optional: Set up any Emmet-specific configurations here
      vim.g.user_emmet_leader_key = '<C-h>' -- Example: Change Emmet leader key
    end,
  },
}

