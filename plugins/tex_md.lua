return {
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
              forwardSearchAfter = true,
              onSave = false,
            },
            bibtexFormatter = "texlab",
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
              executable = "zathura",
              args = {
                "--synctex-editor-command",
                [[nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server ]] .. vim.v.servername,
                "--synctex-forward",
                "%l:1:%f",
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
