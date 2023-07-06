local utils = require("astronvim.utils")

return {
	"AstroNvim/astrocommunity",

	{
		"goolord/alpha-nvim",
		enabled = false,
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
			require("plugins.configs.luasnip")(plugin, opts) -- include the default astronvim config that calls the setup call
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

	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function(_, config)
			-- config variable is the default configuration table for the setup function call
			local null_ls = require("null-ls")

			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- Set a formatter

				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.stylua.with({
				-- 	extra_args = { "--indent_width", "2" },
				-- }),
				-- null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.bean_format.with({
					extra_args = { "-c", "70" },
				}),
			}

			return config -- return final config table
		end,
	},
}
