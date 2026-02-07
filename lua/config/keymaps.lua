-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.opt.number = true
vim.opt.relativenumber = true

-- colors
vim.opt.termguicolors = true

-- configure tabs
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true

-- single statusline
vim.opt.laststatus = 3

-- clear all occurrences
vim.keymap.set('n', '<leader><leader>', '<CMD>nohl<CR>')

-- system clipboard
vim.keymap.set('n', '<leader>bn', '<CMD>bn<CR>')
vim.keymap.set('n', '<leader>bp', '<CMD>bp<CR>')
vim.keymap.set('n', '<leader>bd', '<CMD>bd<CR>')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+yy')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')
