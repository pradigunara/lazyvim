-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = vim.api.nvim_create_augroup("custom-go-autocmd", { clear = true }),
  pattern = { "*.go" },
  callback = function()
    vim.cmd("silent setlocal ts=4 sw=4")
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  group = vim.api.nvim_create_augroup("custom-hl-insert", { clear = true }),
  pattern = { "*" },
  callback = function()
    vim.cmd("silent setlocal cursorline")
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "BufRead" }, {
  group = vim.api.nvim_create_augroup("custom-nohl-normal", { clear = true }),
  pattern = { "*" },
  callback = function()
    vim.cmd("silent setlocal nocursorline")
  end,
})