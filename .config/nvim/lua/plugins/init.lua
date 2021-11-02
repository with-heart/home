vim.cmd [[packadd packer.nvim]]

-- automatically recompile when this file is saved
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

require('packer').startup {
  function(use)
    -- neovim configuration
    use 'wbthomason/packer.nvim'
    use 'tjdevries/astronauta.nvim'

    -- colorscheme
    use {
      'glepnir/zephyr-nvim',
      config = function()
        vim.opt.termguicolors = true
        vim.cmd [[colorscheme zephyr]]
      end
    }

    -- telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- completion/snippets
    use { 
      'hrsh7th/nvim-compe',
      config = [[require'plugins.nvim-compe']]
    }

    -- language support
    use { 
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = [[require'plugins.nvim-treesitter']]
    }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use {
      'neovim/nvim-lspconfig',
      config = [[require'plugins.nvim-lspconfig']]
    }
    use 'jxnblk/vim-mdx-js'
    use {
      'kosayoda/nvim-lightbulb',
      config = [[require'plugins.nvim-lightbulb']]
    }
    use { 
      'mhartington/formatter.nvim',
      config = [[require'plugins.formatter']]
    }

    -- usability
    use {
      'windwp/nvim-autopairs',
      config = [[require'plugins.nvim-autopairs']]
    }
    use {
      'windwp/nvim-ts-autotag',
      config = [[require'plugins.nvim-ts-autotag']]
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use 'tpope/vim-commentary'
    use 'christoomey/vim-tmux-navigator'
    use 'pbrisbin/vim-mkdir'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'kyazdani42/nvim-web-devicons'
    use {
      'glepnir/galaxyline.nvim',
      branch = 'main',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = [[require'plugins.galaxyline']]
    }

    -- git
    use 'tpope/vim-fugitive'
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'tveskag/nvim-blame-line'
  end
}
