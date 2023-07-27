return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      -- config variable is the default configuration table for the setup function call
      local null_ls = require("null-ls")

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      opts.sources = {
        null_ls.builtins.formatting.stylua,
        -- for beancount
        null_ls.builtins.formatting.bean_format.with({
          extra_args = { "-c", "70" },
        }),
      }

      return opts -- return final config table
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "prettier",
        "stylua",
      })
    end,
  },
}
