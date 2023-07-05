return {
  { import = "astrocommunity.pack.rust" },
  {
    "simrat39/rust-tools.nvim",
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts, {
        tools = {
          inlay_hints = {
            parameter_hints_prefix = " ",
            other_hints_prefix = " ",
          },
        },
      })
      return opts
    end,
  },
}
