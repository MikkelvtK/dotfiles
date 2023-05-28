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

function M.handlers()
  local lsp = {
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },
    diagnostic = {
      virtual_text = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
      },
    },
  }

  local diagnostic_signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(diagnostic_signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.diagnostic.config(lsp.diagnostic)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)
end

return M
