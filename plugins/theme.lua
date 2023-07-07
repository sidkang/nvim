return {
	-- { import = "astrocommunity.colorscheme.github-nvim-theme", enabled = true },
	-- { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },

	-- { import = "astrocommunity.colorscheme.everforest", enabled = true },
	-- {
	-- 	"sainnhe/everforest",
	-- 	init = function()
	-- 		vim.g.everforest_background = "hard"
	-- 		vim.opt.background = "dark"
	-- 	end,
	-- },

	{
		"neanias/everforest-nvim",
		lazy = false,
		config = function()
			require("everforest").setup({
				background = "hard", -- soft, medium, hard
				italics = true,
				transparent_background_level = 10,
			})
		end,
	},
}
