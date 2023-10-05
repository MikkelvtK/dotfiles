return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "elixir",
        "heex",
        "eex",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          cmd = { os.getenv("HOME") .. "/.local/share/elixir-ls/release/language_server.sh" },
          settings = {
            elixirLS = {
              dialyzerEnabled = false,
            },
          },
        },
      },
    },
    setup = {
      elixirls = function(_, _)
        local utils = require("plugins.lsp.utils")
        utils.on_attach(function(client, bufnr)
          require("inlay-hints").on_attach(client, bufnr)
        end)
      end,
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "jfpedroza/neotest-elixir",
    },
    opts = {
      adapters = {
        ["neotest-elixir"] = {},
      },
    },
  },
}
