return {
  "f3fora/nvim-texlabconfig",
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
  ft = { "tex", "bib" }, -- for lazy loading
  build = "go build -o ~/.local/bin",
}
