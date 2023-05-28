return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  cmd = "Telescope",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = true,
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>f/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
    { "<leader>fc", function() require("telescope.builtin").colorscheme({enable_preview = true}) end, desc = "Colorscheme", },
  }
}
