return {
  -- { import = "astrocommunity.colorscheme.github-nvim-theme", enabled = true },
  -- { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.everforest", enabled = true },
  {
    "sainnhe/everforest",
    init = function()
      vim.g.everforest_background = "soft"
      vim.opt.background = "dark"
    end,
  },
}
