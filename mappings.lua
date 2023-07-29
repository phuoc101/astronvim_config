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
    ["<C-Right>"] = { ":vertical resize +2<CR>" },
    -- Switch buffer
    ["<S-l>"] = { "<cmd>bnext<cr>" },
    ["<S-h>"] = { "<cmd>bprevious<cr>" },
    -- FZF
    ["<leader>ff"] = { "<cmd>Files<cr>", desc = "Find files" },
    ["<leader>fw"] = { "<cmd>Rg<cr>", desc = "Find words" },
    -- Buffers
    ["<leader>bp"] = { "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin Buffer" },
    ["<leader>bP"] = { "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    ["<leader>bd"] = { "<Cmd>bdelete!<CR>", desc = "Delete buffer" },
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
    -- Sane paste option
    ["p"] = { "P" },
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
