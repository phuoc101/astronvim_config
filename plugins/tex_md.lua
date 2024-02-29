return {
  -- {
  --   "lervag/vimtex",
  --   ft = { "tex", "bib" },
  --   config = function()
  --     -- Preview methods
  --     vim.g.vimtex_view_method = "zathura"
  --     vim.g.vimtex_view_general_viewer = "zathura"
  --     vim.g.vimtex_view_forward_search_on_start = false
  --     -- Disable some unused features
  --     vim.g.vimtex_toc_enabled = 0
  --     vim.g.vimtex_fold_enabled = 0
  --     vim.g.vimtex_format_enabled = 0
  --     vim.g.vimtex_indent_enabled = 0
  --     --
  --     vim.g.tex_flavor = "latex"
  --     vim.g.vimtex_quickfix_ignore_filters = {
  --       "Underfull",
  --       "Overfull",
  --       "Package caption Warning",
  --       "Rerun to get cross-references right.",
  --     }
  --   end,
  -- },
  {
    "f3fora/nvim-texlabconfig",
    ft = { "tex", "bib" },
    build = "go build -o ~/.local/bin",
    config = function()
      local config = {
        cache_activate = true,
        cache_filetypes = { "tex", "bib" },
        cache_root = vim.fn.stdpath "cache",
        reverse_search_start_cmd = function() return true end,
        reverse_search_edit_cmd = vim.cmd.edit,
        reverse_search_end_cmd = function() return true end,
        file_permission_mode = 438,
      }
      require("texlabconfig").setup(config)
      require("lspconfig").texlab.setup {
        settings = {
          texlab = {
            auxDirectory = ".",
            build = {
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              executable = "latexmk",
              forwardSearchAfter = false,
              onSave = false,
            },
            bibtexFormatter = "texlab",
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
              -- executable = "zathura",
              -- args = {
              --   "--synctex-editor-command",
              --   [[nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server ]] .. vim.v.servername,
              --   "--synctex-forward",
              --   "%l:1:%f",
              --   "%p",
              -- },
              executable = "sioyek",
              args = {
                "--new-window",
                "--execute-command",
                "toggle_synctex", -- Open Sioyek in synctex mode.
                "--inverse-search",
                [[nvim-texlabconfig -file %%%1 -line %%%2 -server ]] .. vim.v.servername,
                "--forward-search-file",
                "%f",
                "--forward-search-line",
                "%l",
                "%p",
              },
            },
            latexFormatter = "latexindent",
            latexindent = {
              modifyLineBreaks = true,
            },
          },
        },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
