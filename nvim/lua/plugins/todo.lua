return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup {
      -- Configuration options
      signs = true, -- Show icons in the signs column
      sign_priority = 8, -- Sign priority
      keywords = {
        FIX = {
          icon = " ", -- Icon used for the sign and in search results
          color = "error", -- Can be a hex color or a named color
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- Other keywords that map to this FIX keyword
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE", -- The GUI style to use for the foreground highlight group
        bg = "BOLD", -- The GUI style to use for the background highlight group
      },
      merge_keywords = true, -- When true, custom keywords will be merged with the defaults
      highlight = {
        multiline = true, -- Enable multiline todo comments
        multiline_pattern = "^.", -- Lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- Extra lines that will be re-evaluated when changing a line
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- Pattern or table of patterns used for highlighting (vim regex)
        comments_only = true, -- Uses treesitter to match keywords in comments only
        max_line_len = 400, -- Ignore lines longer than this
        exclude = {}, -- List of file types to exclude highlighting
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], -- Ripgrep regex
      },
    }

    -- Keybindings
    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })

    -- Telescope integration
  vim.keymap.set("n", "<C-T>", ":TodoTelescope<CR>", { desc = "Open TODOs with Telescope" })
  vim.keymap.set("n", "T", ":TodoLocList<CR>", { desc = "Open TODOs in Location List" })
  end
}


-- The plugin recognizes keywords like TODO, FIX, HACK, WARN, PERF, NOTE, and TEST by default. 
