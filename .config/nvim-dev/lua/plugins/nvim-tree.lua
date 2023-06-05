return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  keys = {
    { "<leader>fe", "<cmd>NvimTreeToggle<cr>", desc = "File Tree" },
  },
  opts = {
    view = {
      number = true,
      relativenumber = true,
    },
    filters = {
      custom = { ".git" },
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          git = false,
        }
      },
    }
  }
}
