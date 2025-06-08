-- ~/.config/nvim/lua/plugins/avante.lua
return {
 "yetone/avante.nvim",
 event = "VeryLazy",
 version = false,        -- never set to "*"
 opts = {
  provider = "openai",   -- select provider
  providers = {
   openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o-mini",     -- use GPT‑4o‑mini model
    extra_request_body = {
     temperature = 0.75,
     max_completion_tokens = 1192,      -- adjust as needed
    },
   },
  },
 },
 build = "make",  -- builds binary automatically
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
  keys = {
    { "<leader>aa", "<cmd>AvanteToggle<CR>", desc = "Avante Toggle" },
    { "<leader>ar", "<cmd>AvanteRefresh<CR>", desc = "Avante Refresh" },
    { "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Avante Focus" },
    { "<leader>an", "<cmd>AvanteAsk<CR>", desc = "Avante Ask" },
    { "<leader>ac", "<cmd>AvanteChat<CR>", desc = "Avante Chat" },
    { "<leader>acn", "<cmd>AvanteChatNew<CR>", desc = "Avante New Chat" },
    { "<leader>ab", "<cmd>AvanteBuild<CR>", desc = "Avante Build" },
    { "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Avante History" },
    { "<leader>as", "<cmd>AvanteStop<CR>", desc = "Avante Stop" },
    { "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Avante Edit" },
    { "<leader>aR", "<cmd>AvanteSwitchProvider<CR>", desc = "Avante Switch Provider" },
    { "<leader>aM", "<cmd>AvanteModels<CR>", desc = "Avante Models" },
    { "<leader>a?", "<cmd>AvanteSwitchSelectorProvider<CR>", desc = "Avante Switch Selector" },
    { "<leader>aT", "<cmd>AvanteShowRepoMap<CR>", desc = "Avante Repo Map" },
    { "<leader>aC", "<cmd>AvanteClear<CR>", desc = "Avante Clear Chat" },
  },
}
