return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "carbonfox",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = true,
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Autocmds
    local function augroup(name) return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true }) end

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Make q close some filetypes",
      group = augroup "close_with_q",
      pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
      },
      callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
      end,
    })

    vim.api.nvim_create_autocmd({ "VimResized" }, {
      desc = "Resize splits if window got resized",
      group = augroup "resize_splits",
      callback = function() vim.cmd "tabdo wincmd =" end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Wrap and check for spell in text filetypes",
      group = augroup "wrap_spell",
      pattern = { "gitcommit", "markdown", "tex", "text" },
      callback = function() vim.opt_local.wrap = true end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Mappings for vimtex",
      group = augroup "vimtex_map",
      pattern = { "tex", "bib" },
      callback = function()
        local tex_mappings = require("astronvim.utils").empty_map_table()
        local utils = require "astronvim.utils"
        local user_opts = astronvim.user_opts
        tex_mappings.n["<localleader>ll"] = { "<cmd>TexlabBuild | <cr>", desc = "Build Tex file" }
        tex_mappings.n["<localleader>lv"] = { "<cmd>TexlabForward<cr>", desc = "Forward search" }
        utils.set_mappings(user_opts("tex_mapping", tex_mappings))

        local wk = require "which-key"
        wk.register({
          l = { name = "Latex" },
        }, { mode = "n", prefix = "<localleader>" })
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Mappings for markdown preview",
      group = augroup "markdown_map",
      pattern = { "markdown" },
      callback = function()
        local md_mappings = require("astronvim.utils").empty_map_table()
        local utils = require "astronvim.utils"
        local user_opts = astronvim.user_opts
        md_mappings.n["<localleader>mv"] = { "<cmd>MarkdownPreview<cr>", desc = "Preview markdown" }
        utils.set_mappings(user_opts("md_mapping", md_mappings))

        local wk = require "which-key"
        wk.register({
          m = { name = "Markdown" },
        }, { mode = "n", prefix = "<localleader>" })
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Set indent space for specific filetypes",
      group = augroup "set_indent",
      pattern = { "markdown", "cpp", "c", "lua", "latex", "xml" },
      callback = function()
        local set = vim.opt
        set.tabstop = 2
        set.shiftwidth = 2
      end,
    })

    vim.filetype.add {
      desc = "Set up custom filetypes",
      extension = {
        -- ROS filetypes
        launch = "xml",
        sdf = "xml",
        jinja = "xml",
        xacro = "xml",
        rviz = "yaml",
        msg = "conf",
        srv = "conf",
        -- default tex flavor
        tex = "tex",
      },
    }
  end,
}
