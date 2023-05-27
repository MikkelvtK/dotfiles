return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local servers = require("plugins.lsp.servers")
      local utils = require("plugins.lsp.utils")
      local lspconfig = require("lspconfig")

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      local capabilities = utils.init_capabilities()
      for server, opts in pairs(servers) do
        opts = vim.tbl_extend("force", opts, {
          capabilities = capabilities
        })
        lspconfig[server].setup(opts)
      end
    end,
  },
}
