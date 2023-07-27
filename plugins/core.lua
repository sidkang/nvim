local utils = require("astronvim.utils")

return {
	"AstroNvim/astrocommunity",

	{
		"goolord/alpha-nvim",
		enabled = false,
	},
	-- {
	-- 	"nvim-notify",
	-- 	opts = function(_, opts)
	-- 		opts.background = "#000000"
	-- 		return opts
	-- 	end,
	-- },
	{
		"nvim-autopairs",
		-- dependencies = {
		-- "windwp/nvim-ts-autotag",
		-- },
		opts = function(_, opts)
			-- opts.fast_wrap.chars = utils.list_insert_unique(opts.fast_wrap.chars, {
			-- 	"<",
			-- })
			-- opts.fast_wrap.chars = { "{", "[", "(", '"', "'", "<" }
			return opts
		end,
	},
	{
		"telescope.nvim",
		opts = function(_, opts)
			if opts.pickers == nil then
				opts.pickers = {}
			else
				vim.notify("telescope something not right")
			end
			opts.pickers = {
				find_files = {
					follow = true,
				},
			}
			return opts
		end,
	},
	{
		"Comment.nvim",
		config = function()
			require("Comment").setup()
			require("Comment.ft").set("beancount", ";%s")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		config = function(plugin, opts)
			require("plugins.configs.luasnip")(plugin, opts)                                     -- include the default astronvim config that calls the setup call
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./lua/user/snippets" } }) -- load snippets paths
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- add more things to the ensure_installed table protecting against community packs modifying it
			opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
				-- "lua"
				"beancount",
			})
		end,
	},
}
