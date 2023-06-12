local utils = require("plugins.lsp.utils")

local M = {}

function M.on_attach(_, bufnr)
  local keymap = vim.keymap.set
  local to_diagnostic = utils.to_diagnostic

  -- TODO: Add keymaps for function definitions via LSP
  keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
  keymap("n", "gK", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
  keymap("n", "[d", to_diagnostic(false), { desc = "Prev Diagnostic" })
  keymap("n", "]d", to_diagnostic(true), { desc = "Next Diagnostic" })
  keymap("n", "[e", to_diagnostic(false, "ERROR"), { desc = "Prev Error" })
  keymap("n", "]e", to_diagnostic(true, "ERROR"), { desc = "Next Error" })
  keymap("n", "[w", to_diagnostic(false, "WARNING"), { desc = "Prev Warning" })
  keymap("n", "]w", to_diagnostic(true, "WARNING"), { desc = "Next Warning" })
end

return M
