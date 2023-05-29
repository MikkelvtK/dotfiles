-- TODO: Add function jumping

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPre",
  sync_install = false,
  auto_install = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "go" },
      highlight = {
        enable = true,
      },
    })
  end,
}
