
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- telescope (fuzzy finder <leader>pf)
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Treesitter. Syntax highlighting, indentation and folding.
  use ( 'nvim-treesitter/nvim-treesitter', {
      run = ':TSUpdate'
  })
  -- themes
  use 'navarasu/onedark.nvim'
  use 'folke/tokyonight.nvim'
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }

  -- lsp: syntax errors, refactoring routines, code completion
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
      }
  }
  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
end)
