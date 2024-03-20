-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- normal with jk
vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- bordered terminal
local borderTerm = function()
  Util.terminal(nil, { border = "rounded" })
end
vim.keymap.set("n", "<C-/>", borderTerm, { desc = "terminal" })
vim.keymap.set("n", "<C-_>", borderTerm, { desc = "terminal" }) -- tmux
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>") -- exit to normal terminal
vim.keymap.set("n", "<A-v>", "<C-v>") -- visual block alias
