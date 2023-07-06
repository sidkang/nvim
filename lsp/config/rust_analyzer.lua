return {
  settings = {
    ["rust-analyzer"] = {
      -- standalone = true,
      checkOnSave = {
        command = "clippy"
      }
    },
  },
}
