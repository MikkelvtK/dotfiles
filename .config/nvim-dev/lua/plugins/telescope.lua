return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make", }
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",   desc = "Recent" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
      { "<leader>f/", "<cmd>Telescope live_grep<cr>",  desc = "Grep" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help Tags" },
      {
        "<leader>fc",
        function() require("telescope.builtin").colorscheme({ enable_preview = true }) end,
        desc =
        "Colorscheme",
      },
    },
    opts = {
      defaults = {
        layout_config = {
          preview_width = 0.55,
        },
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-n>"] = function(...)
              require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-p>"] = function(...)
              require("telescope.actions").cycle_history_prev(...)
            end,
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v", },
        ["<leader>f"] = { name = "+File" },
        ["<leader>q"] = { name = "+Quit" },
        ["<leader>qq"] = { cmd = "<cmd>q<cr>", desc = "Quit" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end
  }
}
