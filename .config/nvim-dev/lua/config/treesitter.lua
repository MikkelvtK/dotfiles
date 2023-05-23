local M = {}

function M.setup()
  local ok_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
  if not ok_treesitter then
    return
  end

  treesitter.setup({
    -- A list of parser names or "all"
    ensure_installed = { "lua" },

    -- Install languages synchronously
    sync_install = false,

    highlight = {
      enable = true,
    },
  })
end

return M
