local api = vim.api
local g = vim.g
local opt = vim.opt

-- Disable netrw for nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- General settings
opt.termguicolors = true
opt.cursorline = true
opt.hlsearch = true
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.shiftwidth = 4
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.textwidth = 80
opt.linebreak = true

-- Time in ms to wait for a mapped sequence to complete
opt.timeoutlen = 300
