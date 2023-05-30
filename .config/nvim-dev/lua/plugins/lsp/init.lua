-- TODO: Add function that checks if servers are install on homescreen
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neodev.nvim",  config = true },
      { "folke/neoconf.nvim", config = true },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "simrat39/inlay-hints.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local servers = require("plugins.lsp.servers")
      local utils = require("plugins.lsp.utils")
      local lspconfig = require("lspconfig")

      require("inlay-hints").setup({
        renderer = "inlay-hints/render/eol",
      })
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      utils.handlers()
      local capabilities = utils.init_capabilities()
      local on_attach = utils.on_attach
      for server, opts in pairs(servers) do
        opts = vim.tbl_extend("force", opts, {
          on_attach = on_attach,
          capabilities = capabilities,
        })
        lspconfig[server].setup(opts)
      end
    end,
  },
}
