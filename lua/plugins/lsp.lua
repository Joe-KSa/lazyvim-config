return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      keys = {
        { "K", false },
      },
      inlay_hints = { enabled = false },

      servers = {
        html = {
          filetypes = { "html", "templ", "htmlangular" },
        },
        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayVariableTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
              },
            },
          },
        },
        nil_ls = {
          mason = false,
          cmd = { "nil" },
          autostart = true,
          settings = {
            ["nil"] = {
              formatting = { command = { "nixpkgs-fmt" } },
            },
          },
        },
      },
    },
  },
}
