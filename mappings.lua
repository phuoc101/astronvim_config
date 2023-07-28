-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  -- NORMAL
  n = {
    -- second key is the lefthand side of the map
    -- Resize with arrows
    ["<C-Up>"] = { ":resize -2<CR>" },
    ["<C-Down>"] = { ":resize +2<CR>" },
    ["<C-Left>"] = { ":vertical resize -2<CR>" },
    ["<C-Down>"] = { ":vertical resize +2<CR>" },
    -- Switch buffer
    ["<S-l>"] = { "<cmd>bnext<cr>" },
    ["<S-h>"] = { "<cmd>bprevious<cr>" },
    -- FZF
    ["<leader>ff"] = { "<cmd>Files<cr>", desc = "Find files" },
    ["<leader>fw"] = { "<cmd>Rg<cr>", desc = "Find words" },
    -- Move cursor to end/beginning
    ["B"] = { "^" },
    ["E"] = { "$" },
  },
  -- INSERT
  i = {
    -- Ctrl + hjkl to move
    ["<C-h>"] = { "<Left>" },
    ["<C-j>"] = { "<Down>" },
    ["<C-k>"] = { "<Up>" },
    ["<C-l>"] = { "<Right>" },
    -- Ctrl + BS to del prev word
    ["<C-BS>"] = { "<C-W>" },
    ["<C-Delete>"] = { "<ESC>ldwi" },
  },
  -- VISUAL
  v = {
    -- Move cursor to end/beginning
    ["B"] = { "^" },
    ["E"] = { "$" },
  },
  -- TERMINAL
  t = {
    -- setting a mapping to false will disable it
    ["<C-h>"] = false,
    ["<C-j>"] = false,
    ["<C-k>"] = false,
    ["<C-l>"] = false,
  },
}
