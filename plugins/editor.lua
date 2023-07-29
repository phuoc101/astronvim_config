return {
  -- Surrounding
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      -- Use default configurations
      require("nvim-surround").setup()
    end,
  },
  -- Movements
  {
    "jinh0/eyeliner.nvim",
    event = "VeryLazy",
    config = function()
      require("eyeliner").setup({
        highlight_on_key = true,
        dim = true,
      })
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    branch = "v2", -- optional but strongly recommended
    config = function()
      local hop = require("hop")
      -- you can configure Hop the way you like here; see :h hop-config
      hop.setup({ keys = "etovxqpdygfblzhckisuran" })

      vim.keymap.set({ "n" }, "s", "<cmd>HopChar1<CR>", { remap = true })
      vim.keymap.set({ "v" }, "s", "<cmd>HopChar1<CR>", { remap = true })
    end,
  },
}
