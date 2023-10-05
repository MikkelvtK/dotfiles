return {
  {
    "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>t", "<Plug>PlenaryTestFile", desc = "Plenary Test File" },
    },
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "abecodes/tabout.nvim",
    event = "BufReadPost",
    dependencies = {
      "nvim-cmp",
      "nvim-treesitter",
    },
    config = true,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    enabled = true,
    config = function()
      vim.notify = require("notify")
    end,
  },
  {
    "echasnovski/mini.pairs",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    config = true,
  },
  {
    "andymass/vim-matchup",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>g"] = { name = "+Git" },
      },
    },
  },
}
