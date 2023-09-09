local M = {}

function M.format()
  local buf = vim.api.nvim_get_current_buf()

  vim.lsp.buf.format {
    bufnr = buf,
    filter = true
  }
end

function M.on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end
end

return M
