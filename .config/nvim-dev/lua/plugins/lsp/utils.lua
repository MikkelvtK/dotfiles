local M = {}

--- to_diagnostic returns the movement action function for navigating
--- diagnostics.
-- @tparam boolean next decides whether to next diagnostic or previous
-- @tparam string severity indicates the severity of the diagnostic
-- @treturn returns the function that will take the action
local function to_diagnostic(next, severity)
  local fn = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    fn { severity = severity }
  end
end

function M.on_attach(client, bufnr)
  local keymap = vim.keymap.set

  -- TODO: Add keymaps for function definitions via LSP
  keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
  keymap("n", "gK", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
  keymap("n", "[d", to_diagnostic(false), { desc = "Prev Diagnostic" })
  keymap("n", "]d", to_diagnostic(true), { desc = "Next Diagnostic" })
  keymap("n", "[e", to_diagnostic(false, "ERROR"), { desc = "Prev Error" })
  keymap("n", "]e", to_diagnostic(true, "ERROR"), { desc = "Next Error" })
  keymap("n", "[w", to_diagnostic(false, "WARNING"), { desc = "Prev Warning" })
  keymap("n", "]w", to_diagnostic(true, "WARNING"), { desc = "Next Warning" })

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end

  require("inlay-hints").on_attach(client, bufnr)
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
