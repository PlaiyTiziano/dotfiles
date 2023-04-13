return {
	"rcarriga/nvim-notify",
	"lukas-reineke/indent-blankline.nvim",
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.ai",
		version = "*",
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter" },
		config = true,
	},
	{ "nmac427/guess-indent.nvim", config = true },
	{ "folke/which-key.nvim", config = true },
	{ "numToStr/Comment.nvim", config = true },
	{ "simrat39/symbols-outline.nvim", config = true },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({
				icons = false,
			})
		end,
	},

	-- Git
	{ "almo7aya/openingh.nvim", dev = true },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		config = function() end,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
			-- OPTIONAL: to replace the diff from fugitive with diffview.nvim
			-- (fugitive is still needed to open in browser)
			-- "sindrets/diffview.nvim",
		},
	},

	-- Language specific
	-- Rust
	"simrat39/rust-tools.nvim",

	-- Lua
	"ckipp01/stylua-nvim",

	-- Plenary
	"nvim-lua/plenary.nvim",
}
