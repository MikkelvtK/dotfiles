if not require("config").pde.typescript then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      "simrat39/inlay-hints.nvim"
    },
    opts = {
      servers = {
        ---Typescript
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
              format = {
              },
            },
            javascript = {
              format = {
                indentSize = vim.bo.shiftwidth,
                convertTabsToSpaces = vim.bo.expandtab,
                tabSize = vim.bo.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
        -- ESLint
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require("plugins.lsp.utils").on_attach(function(client, bufnr)
            if client.name == "tsserver" then
              -- stylua: ignore
              vim.keymap.set("n", "<leader>lo", "<cmd>TypescriptOrganizeImports<CR>",
                { buffer = bufnr, desc = "Organize Imports" })
              -- stylua: ignore
              vim.keymap.set("n", "<leader>lR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = bufnr })
            end

            require("inlay-hints").on_attach(client, bufnr)
          end)
          require("typescript").setup { server = opts }
          return true
        end,
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
              if client then
                local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd "EslintFixAll"
                end
              end
            end,
          })
        end,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      table.insert(opts.sources, require "typescript.extensions.null-ls.code-actions")
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
      "thenbe/neotest-playwright",
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require "neotest-jest",
        require "neotest-vitest",
        require("neotest-playwright").adapter {
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        },
      })
    end,
  },
}
