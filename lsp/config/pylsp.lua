return {
	settings = {
		python = {
			pythonPath = vim.fn.system("pyenv which python3"),
		},
		pylsp = {
			plugins = {
				ruff = {
					enabled = true,
					extendSelect = { "I" },
				},
				pyflakes = { enabled = false },
				flake8 = { enabled = false },
				pylint = { enabled = false },
				pycodestyle = {
					ignore = { "W391" },
					maxLineLength = 100,
				},
			},
		},
	},
}
