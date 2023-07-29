return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon",
        },
        separator_style = "thin",
        offsets = {
          {
            filetype = "NvimTree",
            text = "NvimTree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
}
