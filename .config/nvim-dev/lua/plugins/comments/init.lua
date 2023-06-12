return {
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTelescope" },
    event = "BufReadPost",
    config = true,
    keys = {
      { "]t",         function() require("todo-comments").jump_next() end, desc = "Next ToDo" },
      { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous ToDo" },
      { "<leader>cT", "<cmd>TodoTelescope<cr>",                            desc = "ToDo" },
    },
  },
  {
    "numToStr/Comment.nvim",
    opt = true,
    keys = { "gc", "gb", "gcc", "gcb" },
    config = true,
  },
}
