-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
	-- first key is the mode
	n = {
		-- second key is the lefthand side of the map
		-- mappings seen under group name "Buffer"
		-- ["<leader>bD"] = {
		--   function()
		--     require("astronvim.utils.status").heirline.buffer_picker(
		--       function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
		--     )
		--   end,
		--   desc = "Pick to close",
		-- },

		-- tables with the `name` key will be registered with which-key if it's installed
		-- this is useful for naming menus
		["<leader>b"] = { name = "Buffers" },
		-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

		-- Rust Tools
		["<leader>rr"] = { "<Cmd>RustRunnables<CR>" },
		["<leader>rm"] = { "<Cmd>RustExpandMacro<CR>" },

		["<leader>fB"] = {
			"<Cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>",
			name = "Search current buffer",
		},

		-- move lines
		["<A-j>"] = { ":m .+1<CR>==" },
		["<A-k>"] = { ":m .-2<CR>==" },

		-- Toggle Term
		["<C-\\>"] = { "<Cmd>ToggleTerm<Cr>", desc = "Toggle terminal" },
	},
	i = {
		["<A-j>"] = { "<Esc>:m .+1<CR>==gi" },
		["<A-k>"] = { "<Esc>:m .-2<CR>==gi" },
	},
	v = {
		["<A-j>"] = { ":m '>+1<CR>gv=gv" },
		["<A-k>"] = { ":m '<-2<CR>gv=gv" },
	},
	t = {
		-- setting a mapping to false will disable it
		-- ["<esc>"] = false,
		["<C-\\>"] = { "<Cmd>ToggleTerm<Cr>", desc = "Toggle terminal" },
		["<C-h>"] = { "<Left>" },
		["<C-j>"] = { "<Down>" },
		["<C-k>"] = { "<Up>" },
		["<C-l>"] = { "<Right>" },
	},
}
