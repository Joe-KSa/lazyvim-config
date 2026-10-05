local is_win = vim.fn.has("win32") == 1

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "pint", "html-beautify" },
        blade = { "blade-formatter", lsp_format = "never" },
      },
      formatters = {
        pint = {
          command = vim.fn.has("win32") == 1 and "vendor\\bin\\pint.bat" or "vendor/bin/pint",
        },
        ["html-beautify"] = {
          command = "html-beautify",
          args = { "--indent-size", "2", "--file", "-", "--templating", "php" },
        },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
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
        laravel_ls = {
          root_dir = function(bufnr, on_dir)
            local root = vim.fs.root(bufnr, { "artisan" })
            if root then
              on_dir(root)
            end
          end,
        },
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
        nil_ls = is_win and false or {
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
