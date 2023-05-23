local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- General settings
opt.termguicolors = true
opt.hlsearch = true
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"

-- Time in ms to wait for a mapped sequence to complete
opt.timeoutlen = 300

-- Highlight on yank
vim.cmd [[ 
  augroup YankHighLight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end 
]]
