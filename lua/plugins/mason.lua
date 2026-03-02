return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "ruff", -- Cambiamos flake8 por ruff
      },
    },
  },

  -- Configuramos LazyVim para que use Ruff como linter y formateador
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {}, -- Esto activa el LSP de Ruff
      },
    },
  },
}
