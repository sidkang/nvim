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
				background = "soft", -- soft, medium, hard
				italics = true,
				transparent_background_level = 10,
				on_highlights = function(hl, palette)
					hl.Cursor = { fg = palette.yellow, bg = palette.purple, sp = palette.red }
				end,
			})
		end,
	},
}
