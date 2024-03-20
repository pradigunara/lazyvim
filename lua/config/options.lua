-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- force using mock xclip if exists
-- if os.execute("command -v cat ~/.xclip-mock") == 0 then
if os.execute("test -f ~/.xclip-mock") == 0 then
  vim.opt.clipboard = "unnamedplus"
  vim.g.clipboard = {
    name = "xclip-mock",
    copy = {
      ["+"] = { "xclip", "-i" },
      ["*"] = { "xclip", "-i" },
    },
    paste = {
      ["+"] = { "xclip", "-o" },
      ["*"] = { "xclip", "-o" },
    },
  }
end
