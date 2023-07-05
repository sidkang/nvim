return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  --

  { import = "astrocommunity.colorscheme.github-nvim-theme", enabled = true },
  { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.everforest", enabled = true },
  {
    "sainnhe/everforest",
    init = function()
      vim.g.everforest_background = "hard"
      vim.opt.background = "dark"
    end,
  },

  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  { import = "astrocommunity.pack.python" },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      local utils = require "astronvim.utils"
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "ruff_lsp" })
    end,
  },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
}
