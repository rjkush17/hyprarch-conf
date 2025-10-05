return {
  "barrett-ruth/live-server.nvim",
  build = "npm install -g live-server",  -- Installs live-server globally
  config = function()
    require("live-server").setup()

    end,
  ft = { "html", "css", "js" }  -- Load only for these filetypes
}

