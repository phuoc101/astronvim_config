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
      require("eyeliner").setup {
        highlight_on_key = true,
        dim = true,
      }
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    branch = "v2", -- optional but strongly recommended
    config = function()
      local hop = require "hop"
      -- you can configure Hop the way you like here; see :h hop-config
      hop.setup { keys = "etovxqpdygfblzhckisuran" }

      vim.keymap.set({ "n" }, "s", "<cmd>HopChar1<CR>", { remap = true })
      vim.keymap.set({ "v" }, "s", "<cmd>HopChar1<CR>", { remap = true })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
      }
      local t = {}
      -- Syntax: t[keys] = {function, {function arguments}}
      t["<C-b>"] = { "scroll", { "-vim.wo.scroll", "true", "50" } }
      t["<C-f>"] = { "scroll", { "vim.wo.scroll", "true", "50" } }
      t["<C-u>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "50" } }
      t["<C-d>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "50" } }

      require("neoscroll.config").set_mappings(t)
    end,
  },
}
