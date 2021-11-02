vim.cmd [[packadd packer.nvim]]

-- automatically recompile when this file is saved
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

require('packer').startup {
  function(use)
    -- neovim configuration
    use 'wbthomason/packer.nvim'

    -- language support
    use 'jxnblk/vim-mdx-js'
    use 'vim-polyglot'
    use 'vim-graphql'

    -- usability
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup {}
      end
    }
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
  end
}
