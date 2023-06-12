local M = {}

function M.init()
  local lsp = {
    float = {
      focusable = true,
      style = "minimal",
      border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
    },
    diagnostic = {
      virtual_text = true,
      float = {
        focusable = true,
        style = "minimal",
        border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
      },
    },
  }
  local diagnostic_signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn",  text = "" },
    { name = "DiagnosticSignHint",  text = "" },
    { name = "DiagnosticSignInfo",  text = "" },
  }

  for _, sign in ipairs(diagnostic_signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.diagnostic.config(lsp.diagnostic)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)
end

return M
