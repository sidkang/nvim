return {
	settings = {
		["rust-analyzer"] = {
			-- standalone file support
			-- setting it to false may improve startup time
			-- standalone = true,

			lens = {
				enable = false,
			},

			checkOnSave = {
				command = "clippy",
			},
		},
	},
}
