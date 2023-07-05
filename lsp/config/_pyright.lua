local path = require("lspconfig/util").path

return {
  settings = {
    python = {
      -- pythonPath = vim.fn.trim(vim.fn.system "pyenv which python3"),
      venvPath = path.join(vim.env.PYENV_ROOT, "verions"),
      venv = vim.fn.system "pyenv version-name",
    },
  },
  single_file_support = true,
}
