-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Add Plugins
require("lazy").setup({
  -- Theme 
  {
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  -- Auto Completion
  "hrsh7th/nvim-cmp",  -- Completion Engine
  "hrsh7th/cmp-buffer",  -- Buffer Completion
  "hrsh7th/cmp-path",  -- Path Completion
  "hrsh7th/cmp-cmdline",  -- Command Completion
  "hrsh7th/cmp-nvim-lsp",  -- LSP Completion
  "hrsh7th/cmp-nvim-lua",  -- Vim Runtime API Cmp

  -- Snippet
  {
    "L3MON4D3/LuaSnip",  -- Snip Engine
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  "saadparwaiz1/cmp_luasnip",

  -- LSP
  "williamboman/mason.nvim",  -- LSP Installer
  "williamboman/mason-lspconfig.nvim",  -- Bridge
  "neovim/nvim-lspconfig", -- LSP Base

})
