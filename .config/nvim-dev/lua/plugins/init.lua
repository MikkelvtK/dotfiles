return {
  "nvim-lua/plenary.nvim",
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-storm]])
    end,
  }
}
