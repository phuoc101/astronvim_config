return {
  {
    "junegunn/fzf",
    event = "VeryLazy",
    build = " fzf#install() ",
  },
  {
    "junegunn/fzf.vim",
    event = "VeryLazy",
  },
  {
    "danymat/neogen",
    ft = { "python", "c", "cpp" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function() require("neogen").setup { snippet_engine = "luasnip" } end,
  },
}
