return {
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },
  {
    "tanvirtin/monokai.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme monokai]])
    end
  },
}
