-- TODO: Add more colorschemes and options to switch between them
return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nord]])
    end
  }
}
