return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "lua",
        "luadoc",
        "luap",
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      opts = {},
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              diagnostics = {
                globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins" },
              },
              completion = { callSnippet = "Replace" },
              telemetry = { enable = false },
              hint = {
                enable = false,
              },
            },
          },
        },
      },
      setup = {
        lua_ls = function(_, _)
          local utils = require("plugins.lsp.utils")
          utils.on_attach(function(client, bufnr)
            if client.name == "lua_ls" then
              vim.keymap.set("n", "<leader>dX", function() require("osv").run_this() end,
                { buffer = bufnr, desc = "OSV Run" })
              vim.keymap.set("n", "<leader>dL", function() require("osv").launch({ port = 8086 }) end,
                { buffer = bufnr, desc = "OSV Launch" })
            end

            -- FIX:inlay hints not working for lua
            require("inlay-hints").on_attach(client, bufnr)
          end)
        end,
      },
    },
  },
}
