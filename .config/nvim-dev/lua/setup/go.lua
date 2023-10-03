if not require("config").pde.go then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork", "gosum" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(
        opts.ensure_installed or {},
        { "delve", "gotests", "golangci-lint", "gofumpt", "goimports",
          "golangci-lint-langserver", "impl", "gomodifytags", "iferr", "gotestsum" }
      )
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    config = function(_, opts)
      require("go").setup(opts)
    end,
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          cmd = { "gopls", "serve", },
          filetypes = { "go", "gomod" },
          root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              staticcheck = true,
              semanticTokens = true,
            },
          },
        },
        golangci_lint_ls = {},
      },
      setup = {
        gopls = function(_, _)
          local group = vim.api.nvim_create_augroup("GoFormat", {})
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
              require("go.format").goimport()
            end,
            group = group,
          })

          local utils = require("plugins.lsp.utils")
          utils.on_attach(function(client, bufnr)
            local map = function(mode, lhs, rhs, desc)
              if desc then
                desc = desc
              end
              vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
            end

            if client.name == "gopls" then
              map("n", "<leader>ly", "<cmd>GoModTidy<cr>", "Go Mod Tidy")
              map("n", "<leader>lc", "<cmd>GoCoverage<Cr>", "Go Test Coverage")
              map("n", "<leader>lt", "<cmd>GoTest<Cr>", "Go Test")
              map("n", "<leader>lR", "<cmd>GoRun<Cr>", "Go Run")
              map("n", "<leader>dT", "<cmd>lua require('dap-go').debug_test()<cr>", "Go Debug Test")

              if not client.server_capabilities.semanticTokensProvider then
                local semantic = client.config.capabilities.textDocument.semanticTokens
                client.server_capabilities.semanticTokensProvider = {
                  full = true,
                  legend = {
                    tokenTypes = semantic.tokenTypes,
                    tokenModifiers = semantic.tokenModifiers,
                  },
                  range = true,
                }
              end
            end
          end)
        end,
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-go",
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require "neotest-go",
      })
    end,
  },
}
