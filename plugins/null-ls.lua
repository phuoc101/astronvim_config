return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Python
      formatting.black.with { extra_args = { "--line-length=120" } },
      diagnostics.flake8.with {
        extra_args = { "--max-line-length=120", "--extend-ignore=E203" },
      },
      -- Lua
      formatting.stylua,
      -- LaTeX
      formatting.latexindent.with { extra_args = { "--modifyLineBreaks" } },
      -- Markdown
      formatting.mdformat,
      -- xml
      formatting.xmlformat.with { extra_args = { "--blanks" } },
      -- cmake
      formatting.cmake_format,
    }
    return config -- return final config table
  end,
}
