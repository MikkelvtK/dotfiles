local M = {}

--- to_diagnostic returns the movement action function for navigating
--- diagnostics.
-- @tparam boolean next decides whether to next diagnostic or previous
-- @tparam string severity indicates the severity of the diagnostic
-- @treturn returns the function that will take the action
function M.to_diagnostic(next, severity)
  local fn = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    fn { severity = severity }
  end
end

function M.init_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, bufnr)
    end,
  })
end

return M
