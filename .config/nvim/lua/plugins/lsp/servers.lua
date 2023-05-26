local M = {}

local servers = {
  gopls = {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
}

local function init(server, opts)
  local lspconfig = require("lspconfig")
  lspconfig[server].setup(opts)
end

function M.setup()
  require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
  })
  
  for server, opts in pairs(servers) do
    init(server, opts)
  end
end

return M
