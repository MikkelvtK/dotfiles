return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPre",
  sync_install = false,
  auto_install = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "go", "vim", },
    })

    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end,

  -- TODO: Add functionality to hop functions
}
