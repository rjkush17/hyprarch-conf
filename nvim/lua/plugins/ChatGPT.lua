return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    require("chatgpt").setup({
      -- Read API key from external file (safer than hardcoding or env)
      api_key_cmd = "cat /home/zatch/.config/openai/api_key.txt",

      -- OpenAI parameters — customize your model here
      openai_params = {
        model = "gpt-4o", -- or "gpt-4o-mini", "gpt-3.5-turbo", "gpt-4-turbo"
        max_tokens = 512, -- limit response size (save tokens)
        temperature = 0.7,
        top_p = 1,
        frequency_penalty = 0,
        presence_penalty = 0,
      },

      -- ChatGPT.nvim UI settings
      chat = {
        welcome_message = WELCOME_MESSAGE,
        loading_text = "Loading, please wait ...",
        question_sign = "", -- Icon for user question
        answer_sign = "ﮧ",   -- Icon for GPT answer
        max_line_length = 120,
      },

      -- Disable auto suggestions (important if you want to save tokens)
      auto_start = true,

      -- Optional log level (DEBUG, INFO, WARN, ERROR)
      log_level = "INFO",
    })
  end,
}

