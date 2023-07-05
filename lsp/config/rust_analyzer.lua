return {
  settings = {
    ["rust-analyzer"] = {
      -- standalone = true,
      inlayHints = {
        bindingModeHints = false,
        chainingHints = true,
        closingBraceHints = false,
        parameterHints = true,
        typeHints = true,
        renderColons = false,
      },
    },
  },
}
