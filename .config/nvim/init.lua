-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

vim.keymap.set("n", "<Leader><Esc>", ":w<return>")
vim.keymap.set("n", "<Leader><Tab>", ":w<return>")

-- Go to a certain numbered pane
vim.keymap.set("n", "<Leader>1", ":tabn 1<CR>")
vim.keymap.set("n", "<Leader>2", ":tabn 2<CR>")
vim.keymap.set("n", "<Leader>3", ":tabn 3<CR>")
vim.keymap.set("n", "<Leader>4", ":tabn 4<CR>")
vim.keymap.set("n", "<Leader>2", ":tabn 2<CR>")
vim.keymap.set("n", "<Leader>5", ":tabn 5<CR>")

-- Go to the previous or next pane
vim.keymap.set("n", "<C-]>", ":tabn<CR>")
vim.keymap.set("n", "<C-[>", ":tabp<CR>")

-- Horizontal and Vertical split pane
vim.keymap.set("n", "<leader>h", ":split<CR>")
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")

-- Open new tab
vim.keymap.set("n", "<leader>t", ":tabnew<CR>") -- Opens a new tab

-- Open file search
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")

-- Set background to light for solarized
vim.o.background = "light"
