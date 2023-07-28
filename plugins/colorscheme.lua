return {
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    config = function()
      -- local colors = require("nightfox.lib.color")
      -- local carbonfox = require("nightfox.palette").load("carbonfox").generate_spec(0)
      local carbon_palette = require("nightfox.palette").load "carbonfox"
      local dayfox_palette = require("nightfox.palette").load "dayfox"
      local Color = require "nightfox.lib.color"

      require("nightfox").setup {
        options = {
          styles = {
            comments = "italic",
            conditionals = "italic",
            constants = "bold",
            functions = "bold",
            keywords = "bold, italic",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "italic",
            variables = "NONE",
          },
          inverse = {
            -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
        },
        groups = {
          carbonfox = {
            CursorLine = { bg = Color.from_hex(carbon_palette.bg3) },
            Visual = {
              bg = Color.from_hex(carbon_palette.fg3),
              fg = Color.from_hex(carbon_palette.bg0),
              style = "bold",
            },
            VertSplit = { fg = Color.from_hex(carbon_palette.fg3) },
            MatchParen = { style = "underline,bold" },
          },
          dayfox = {
            CursorLine = { bg = Color.from_hex(dayfox_palette.bg0) },
            Visual = {
              bg = Color.from_hex(dayfox_palette.bg3),
              fg = Color.from_hex(dayfox_palette.fg0),
              style = "bold",
            },
            VertSplit = { fg = Color.from_hex(dayfox_palette.fg3) },
            MatchParen = { style = "underline,bold" },
          },
        },
      }
    end,
  },
}
