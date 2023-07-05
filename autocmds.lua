vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  desc = "Setup commentstring in beancount files",
  -- group = vim.api.nvim_create_augroup("beancount_ft_setup", { clear = true }),
  pattern = { "*.bean", "*.beancount" },
  callback = function()
    vim.api.nvim_set_keymap("i", "<C-m>", "<Plug>luasnip-next-choice", {})
    vim.api.nvim_set_keymap("s", "<C-m>", "<Plug>luasnip-next-choice", {})
    vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
    vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
  end,
})
