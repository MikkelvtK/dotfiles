local utils = require("plugins.lsp.utils")

local M = {}

function M.on_attach(_, bufnr)
  local keymap = vim.keymap.set
  local to_diagnostic = utils.to_diagnostic

  keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
  keymap("n", "gK", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
  keymap("n", "[d", to_diagnostic(false), { desc = "Prev Diagnostic" })
  keymap("n", "]d", to_diagnostic(true), { desc = "Next Diagnostic" })
  keymap("n", "[e", to_diagnostic(false, "ERROR"), { desc = "Prev Error" })
  keymap("n", "]e", to_diagnostic(true, "ERROR"), { desc = "Next Error" })
  keymap("n", "[w", to_diagnostic(false, "WARNING"), { desc = "Prev Warning" })
  keymap("n", "]w", to_diagnostic(true, "WARNING"), { desc = "Next Warning" })

  -- telescope integration
  keymap("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Goto Definition" })
  keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
  keymap("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { desc = "Goto implementation" })
  keymap("n", "gb", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Goto Type Definition" })

  -- format keymaps
  local format = require("plugins.lsp.format").format
  keymap("n", "<leader>lf", format, { desc = "Format Document" })
  keymap("v", "<leader>lf", format, { desc = "Format Range" })
end

return M
