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
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "lua_ls", },
      })

      local lspconfig = require("lspconfig")
      local servers = require("plugins.lsp.servers")
      for server, opts in pairs(servers) do
        lspconfig[server].setup(opts)
      end
    end,
  }
}
