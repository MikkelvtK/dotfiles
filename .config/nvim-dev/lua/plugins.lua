local M = {}

local api = vim.api
local fn = vim.fn
local cmd = vim.cmd

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 0,
    },
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      })

      cmd([[packadd packer.nvim]])
    end

    local packergrp = api.nvim_create_augroup("packer_user_config", { clear = true })
    api.nvim_create_autocmd(
      { "BufWritePost" },
      { pattern = "init.lua", command = "source <afile> | PackerCompile", group = packergrp }
    )
  end

  -- plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    ----
    -- MODULES
    ----

    -- Plenary
    use {
      "nvim-lua/plenary.nvim",
      module = "plenary"
    }

    -- Web devicons
    use {
      "nvim-tree/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    ----
    -- COLORSCHEMES
    ----

    -- Tokyonight
    use {
      "folke/tokyonight.nvim",
      config = function()
        cmd([[colorscheme tokyonight]])
      end,
      enable = true,
    }

    -- Everforest
    use {
      "sainnhe/everforest",
      config = function()
        vim.g.everforest_better_performance = 1
        vim.cmd.colorscheme [[everforest]]
      end,
      disable = true,
    }

    ----
    -- LSP
    ----

    -- Mason / lspconfig
    use {
      "neovim/nvim-lspconfig",
      event = "BufReadPre",
      requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
      config = function()
        require("config.lsp").setup()
      end,
    }

    ----
    -- GENERAL
    ----

    -- Mini
    use {
      "echasnovski/mini.nvim",
      config = function()
        require("config.mini").setup()
      end,
    }

    -- WhichKey
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    -- Git
    use {
      "TimUntersberger/neogit",
      cmd = "Neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

    -- Nvim-tree
    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons",
      },
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      config = function()
        require("config.nvimtree").setup()
      end,
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
      config = function()
        require("config.treesitter").setup()
      end,
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require("packer")
  packer.init(conf)
  packer.startup(plugins)
end

return M
