if not require("config").pde.python then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, { "debugpy", "black" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace", -- "openFilesOnly",
              },
            },
          },
        },
      },
      setup = {
        pyright = function(_, _)
          local lsp_utils = require "plugins.lsp.utils"
          lsp_utils.on_attach(function(client, bufnr)
            local map = function(mode, lhs, rhs, desc)
              if desc then
                desc = desc
              end
              vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
            end
            if client.name == "pyright" then
              map("n", "<leader>lo", "<cmd>PyrightOrganizeImports<cr>", "Organize Imports")
            end
          end)
        end,
      },
    },
  },
}
