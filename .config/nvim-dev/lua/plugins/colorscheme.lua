return {
  {
    "gbprod/nord.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    "kaiuri/nvim-juliana",
  },
  {
    "tanvirtin/monokai.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme monokai]])
    end
  }
}
