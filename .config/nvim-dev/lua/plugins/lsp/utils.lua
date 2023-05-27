local M = {}

function M.on_attach(client, bufnr)
  local keymap = vim.keymap.set

  keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
  keymap("n", "gK", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Prev Diagnostic" })
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })

  -- TODO: Create a function to handle the mapping
  keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", { desc = "Prev Error" })
  keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", { desc = "Next Error" })
  keymap("n", "[w", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARNING})<CR>", { desc = "Prev Warning" })
  keymap("n", "]w", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARNING})<CR>", { desc = "Next Warning" })

  local inlay_hints = require("inlay-hints")
  inlay_hints.on_attach(client, bufnr)
end

function M.init_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

return M
