return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require("lualine").setup()
  end,
}
