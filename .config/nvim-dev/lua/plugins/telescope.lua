return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  cmd = "Telescope",
  dependencies = { 'nvim-lua/plenary.nvim' },
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
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        layout_config = {
          preview_width = 0.55,
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
          },
        },
      },
    })
  end,
}
