return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "crispgm/cmp-beancount",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp",                priority = 1000 },
        { name = "luasnip",                 priority = 750 },
        { name = "buffer",                  priority = 500 },
        { name = "path",                    priority = 250 },
        { name = "nvim_lsp_signature_help", priority = 850 },
      })
    end,
    config = function(_, opts)
      local cmp = require("cmp")

      cmp.setup(opts)

      cmp.setup.filetype("beancount", {
        sources = cmp.config.sources({
          { name = "luasnip", priority = 750 },
          {
            name = "beancount",
            option = {
              account = vim.fn.expand("$HOME/Developer/ledger/ledger.bean"),
            },
            priority = 500,
          },
        }),
      })
    end,
  },
}
