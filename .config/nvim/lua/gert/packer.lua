
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
	'rose-pine/neovim',
	as = 'rosepine',
	config = function()
		vim.cmd('colorscheme rose-pine')
	end
  })

  use 'mbbill/undotree'


  use({
      "aserowy/tmux.nvim",
      config = function() return require("tmux").setup() end
  })
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon') 
  use('tpope/vim-fugitive')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  {'neovim/nvim-lspconfig',
		  	opts  = {
				inlay_hints = {
						enabled = true
					}
		  		}
	  	  },
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup()
  end}
  use {
  "ray-x/lsp_signature.nvim",
  }
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    "lewis6991/satellite.nvim"
  }
end)
