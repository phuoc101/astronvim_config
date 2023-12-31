return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      local dashboard = require "alpha.themes.dashboard"
      dashboard.section.header.val = {
        "⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎",
        "⠀⠈⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠋⠀",
        "⠀⠀⠘⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣧⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠃⠀⠀",
        "⠀⠀⠀⠸⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⢟⣦⡀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠁⠀⠀⠀",
        "⠀⠀⠀⠀⢹⣿⣄⠀⠀⠀⠀⣶⠀⠀⣼⢰⣿⣿⡟⣵⡿⣿⣷⣄⠀⠀⢸⠃⠀⢀⠆⠀⠀⠀⣰⡟⠁⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⢻⣿⣆⠀⠀⠀⣿⡄⣸⣿⣼⣿⡟⣼⠁⡉⠙⣿⣿⡆⣀⣼⠀⠀⡾⠀⠀⢀⣼⡟⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠈⢿⣿⣆⣀⠀⠿⣷⣿⣿⣿⣿⣿⣿⣿⣿⠛⠿⣿⣿⣿⡏⢸⡆⢃⣀⣠⣾⠏⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⣤⣄⡀⠉⠹⢿⣎⣿⣿⣿⣿⠀⠀⠈⡿⠃⢡⣼⣿⣿⠿⠛⠉ ⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠘⠻⢿⣿⣿⣿⣳⣮⣜⣿⣿⣿⣿⣿⠀⠀⢠⡇⠀⣿⠛⡛⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⡿⢿⣇⣿⣿⣿⣿⣿⣿⣿⠀⠀⢸⠁⠀⠏⢐⣁⣤⡶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡄⣹⣿⣿⣿⣿⣿⣿⣿⠀⠀⣼⠀⢀⣶⡿⠻⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡋⠀⠻⣯⣙⢿⣿⣿⠀⠀⡧⣀⣿⣿⣿⡦⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡄⡀⠘⣯⣿⢮⣻⣀⢾⡙⢻⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣻⢳⣿⢏⣾⣟⣓⢘⣿⡾⢫⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⣼⠿⣿⣿⣇⠀⠘⠁⢇⡛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠈⠹⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      }
      dashboard.config.layout[1].val = vim.fn.max { 1, vim.fn.floor(vim.fn.winheight(0) * 0.1) }
      dashboard.config.layout[3].val = 2
      return opts
    end,
  },
  -- You can disable default plugins as follows:
  { "mrjones2014/smart-splits.nvim", enabled = false },
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      require("luasnip.loaders.from_vscode").load { paths = "./lua/user/snips/cpp" }
      require("luasnip.loaders.from_vscode").load { paths = "./lua/user/snips/python" }
      require("luasnip.loaders.from_vscode").load { paths = "./lua/user/snips/launch" }
      require("luasnip.loaders.from_vscode").load { paths = "./lua/user/snips/tex" }
      require("luasnip.loaders.from_vscode").load { paths = "./lua/user/snips/shell" }
      require("luasnip.loaders.from_vscode").load { paths = "./lua/user/snips/markdown" }
    end,
  },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  {
    "folke/which-key.nvim",
    config = function(plugin, opts)
      require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- Add bindings which show up as group name
      local git_mappings = require("astronvim.utils").empty_map_table()
      local utils = require "astronvim.utils"
      local user_opts = astronvim.user_opts
      git_mappings.n["<leader>gj"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" }
      git_mappings.n["<leader>gk"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" }
      utils.set_mappings(user_opts("git_mapping", git_mappings))
    end,
  },
}
