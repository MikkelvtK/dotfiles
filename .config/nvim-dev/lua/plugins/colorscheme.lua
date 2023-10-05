return {
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, _)
      vim.cmd([[colorscheme dracula]])
    end,
  },
}
