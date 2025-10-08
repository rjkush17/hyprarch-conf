local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header ASCII Art
dashboard.section.header.val = {
"                                                                   ",
"   ██   ██ ██    ██ ██████  ██████        ██    ██ ██ ███    ███   ",
"   ██   ██  ██  ██  ██   ██ ██   ██       ██    ██ ██ ████  ████   ",
"   ███████   ████   ██████  ██████  █████ ██    ██ ██ ██ ████ ██   ",
"   ██   ██    ██    ██      ██   ██        ██  ██  ██ ██  ██  ██   ",
"   ██   ██    ██    ██      ██   ██         ████   ██ ██      ██   ",
"                                                                   ",
"                                                                   ",
}

--------------------------------------------------------------------------------
-- 🎛️ Buttons / Menu with Nerd Font icons
--------------------------------------------------------------------------------

dashboard.section.buttons.val = {
    dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰱼  Find File", ":Telescope find_files <CR>"),
    dashboard.button("r", "󰄉  Recent Files", ":Telescope oldfiles <CR>"),
    dashboard.button("g", "  Git Status", ":Telescope git_status <CR>"),
    dashboard.button("p", "  Browse Projects", ":Telescope projects<CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
}


--------------------------------------------------------------------------------
-- 📝 Footer Message
--------------------------------------------------------------------------------

dashboard.section.footer.val = {
    "─────────────────────────────────────────────",
    "   Welcome back, Rishabh!",
    "   Stay productive and keep coding with Hypt-Vim!",
    "   Today is " .. os.date("%A, %B %d, %Y"),
    "─────────────────────────────────────────────",
}


-- Layout arrangement
dashboard.config.layout = {
  { type = "padding", val = 2 },
  dashboard.section.header,
  { type = "padding", val = 2 },
  dashboard.section.buttons,
  { type = "padding", val = 2 },
  dashboard.section.footer,
}

-- Setup Alpha Dashboard
alpha.setup(dashboard.config)
