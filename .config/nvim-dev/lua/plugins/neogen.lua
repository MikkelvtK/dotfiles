return {
  "danymat/neogen",
  event = "VeryLazy",
  opts = {
    snippet_engine = "luasnip",
    enabled = true,
    languages = {
      lua = {
        template = {
          annotation_convention = "ldoc",
        },
      },
    },
  },
  keys = {
    { "<leader>cgd", function() require("neogen").generate() end, desc = "Annotation", },
    { "<leader>cgc", function() require("neogen").generate { type = "class" } end, desc = "Class", },
    { "<leader>cgf", function() require("neogen").generate { type = "func" } end, desc = "Function", },
    { "<leader>cgt", function() require("neogen").generate { type = "type" } end, desc = "Type", },
  },
}
