local M = {}

function M.setup()
  -- Custom config
  require("config.mini.starter").setup()
  require("config.mini.statusline")

  -- Default config
  local ok_mini, _ = pcall(require, "mini")
  if not ok_mini then
    return
  end

  require("mini.comment").setup({})
  require("mini.pairs").setup({})
  require("mini.indentscope").setup({})
  require("mini.completion").setup({})
end

return M
