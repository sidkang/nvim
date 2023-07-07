return {
	settings = {
		["rust-analyzer"] = {
			lens = {
				enable = false,
			},
			-- standalone = true,
			checkOnSave = {
				command = "clippy",
			},
		},
	},
}
