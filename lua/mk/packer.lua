-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
    use 'eandrju/cellular-automaton.nvim'
    use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }

	}
--	use({
--		'rose-pine/neovim',
--		as = 'rose-pine',
--		config = function()
--			require("rose-pine").setup()
--			vim.cmd('colorscheme rose-pine')
--		end
--	})
    use({
        'ray-x/go.nvim', 
        config = function() 
            require("go").setup()
        end
    })
    use({
        'folke/tokyonight.nvim', 
        config = function() 
            require('tokyonight').setup {
                style = 'night',
            } 
            vim.cmd('colorscheme tokyonight')
        end
    })
	use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use( 'nvim-treesitter/playground') 
	use('nvim-treesitter/nvim-treesitter-context')
    use( 'theprimeagen/harpoon') 
	use( 'mbbill/undotree') 
	use( 'tpope/vim-fugitive') 
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	
    }

    use {
        "D:/matheus/Documentos/codigos/personal/projects/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- TODO ->
                highlight = { 
                   -- pattern = [[(KEYWORDS|NUMBERS)\s*\d+\s*:]],            
                   pattern = [[(KEYWORDS)\s*-]],            
                },
            }
        end
    }

    use('editorconfig/editorconfig-vim')
    use('ThePrimeagen/vim-be-good')
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

end)

