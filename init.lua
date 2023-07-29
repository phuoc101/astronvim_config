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
      format_on_save = false,
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
    -- close some filetypes with <q>
    vim.api.nvim_create_autocmd("FileType", {
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
    --
    -- Highlight on yank
    vim.api.nvim_create_autocmd("TextYankPost", {
      group = augroup "highlight_yank",
      callback = function() vim.highlight.on_yank() end,
    })
    --
    -- resize splits if window got resized
    vim.api.nvim_create_autocmd({ "VimResized" }, {
      group = augroup "resize_splits",
      callback = function() vim.cmd "tabdo wincmd =" end,
    })
    --
    -- wrap and check for spell in text filetypes
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup "wrap_spell",
      pattern = { "gitcommit", "markdown", "tex", "text" },
      callback = function()
        vim.opt_local.wrap = true
      end,
    })
    --
    -- Set up custom filetypes
    vim.filetype.add {
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
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}