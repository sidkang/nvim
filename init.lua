return {
	-- Configure AstroNvim updates
	updater = {
		remote = "origin",   -- remote to use
		channel = "stable",  -- "stable" or "nightly"
		version = "latest",  -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "nightly",  -- branch name (NIGHTLY ONLY)
		commit = nil,        -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil,   -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_quit = false,   -- automatically quit the current session after a successful update
		remotes = {          -- easily add new remotes to track
			--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
			--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
			--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		},
	},

	-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	lsp = {
		-- customize lsp formatting options
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					-- "python",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- disable lua_ls formatting capability if you want to use StyLua to format your lua code
				-- "lua_ls",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		},
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
	},

	-- Configure require("lazy").setup() options
	lazy = {
		defaults = { lazy = true },
		performance = {
			rtp = {
				-- customize default disabled vim plugins
				disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
			},
		},
	},

	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		-- Set up custom filetypes
		-- vim.filetype.add {
		--   extension = {
		--     foo = "fooscript",
		--   },
		--   filename = {
		--     ["Foofile"] = "fooscript",
		--   },
		--   pattern = {
		--     ["~/%.config/foo/.*"] = "fooscript",
		--   },
		-- }
		--
		--
		--
		vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineEnter" }, {
			desc = "After event activate en input method",
			group = vim.api.nvim_create_augroup("auto_input_method_activate", { clear = true }),
			pattern = { "*" },
			callback = function()
				vim.cmd([[ :silent !open -g "hammerspoon://SwitchIME?to=en" ]])
			end,
		})

		-- Beancount Settings
		vim.filetype.add({
			extension = {
				bean = "beancount",
			},
		})
		vim.api.nvim_create_autocmd({ "BufReadPost" }, {
			desc = "Setup commentstring in beancount files",
			group = vim.api.nvim_create_augroup("beancount_ft_setup", { clear = true }),
			pattern = { "*.bean", "*.beancount" },
			callback = function()
				vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
				vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
				-- vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
				-- vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
			end,
		})
	end,
}
