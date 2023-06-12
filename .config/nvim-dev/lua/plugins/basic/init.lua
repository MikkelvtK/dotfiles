return {
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
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = {
      integrations = { diffview = true },
    },
    keys = {
      { "<leader>gs", "<cmd>Neogit kind=floating<cr>", desc = "Status" },
    },
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
}
