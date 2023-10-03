return {
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      theme = "wave",
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd([[colorscheme kanagawa-wave]])
    end,
  },
}
