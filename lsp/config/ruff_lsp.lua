-- return {
-- 	settings = {
-- 		-- Any extra CLI arguments for `ruff` go here.
-- 		args = {},
-- 		settings = {
-- 			path = vim.fn.system("pyenv which python3"),
-- 		},
-- 	},
-- }

return {
	init_options = {
		settings = {
			-- Any extra CLI arguments for `ruff` go here.
			-- args = { "--config=$HOME/.config/ruff/ruff.toml" },
			--
			organizeImports = true,
			fixAll = true,
			interpreter = vim.fn.system("pyenv which python3"),
		},
	},
	settings = {},
}
