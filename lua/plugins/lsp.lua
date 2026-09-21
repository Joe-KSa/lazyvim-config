return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "pint" },
        blade = { "blade-formatter", lsp_format = "never" },
      },
      formatters = {
        pint = {
          command = "vendor/bin/pint",
        },
        ["blade-formatter"] = {
          prepend_args = {
            "--wrap-attributes=force-expand-multiline",
            "--wrap-line-length=120",
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- keys = {
      --   { "K", false },
      -- },
      inlay_hints = { enabled = false },
      servers = {
        phpactor = false,
        intelephense = {
          enabled = true,
          filetypes = { "php", "blade" },
          get_language_id = function(_, ftype)
            if ftype == "blade" then
              return "php"
            end
            return ftype
          end,
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
        html = {
          filetypes = { "html", "templ", "htmlangular", "blade" },
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
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = {},
      },
    },
  },
}
