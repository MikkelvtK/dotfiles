-- Set highlighting on yanking
local highlight_grp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_grp,
  pattern = "*",
})

vim.print(vim.api.nvim_get_hl(0, {}))
