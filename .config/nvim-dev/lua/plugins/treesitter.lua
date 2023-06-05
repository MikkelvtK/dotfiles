return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPre",
  sync_install = false,
  auto_install = true,
  matchup = {
    enable = true,
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      ensure_installed = {
        "bash",
        "go",
        "dockerfile",
        "html",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "org",
        "query",
        "regex",
        "latex",
        "vim",
        "vimdoc",
        "yaml",
      },
    })
  end,

  -- TODO: Add functionality to hop functions
}
