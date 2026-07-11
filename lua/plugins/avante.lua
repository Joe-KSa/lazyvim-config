return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy", -- Cargará de forma segura después de que Neovim inicie
    version = false, -- set this if you want to always pull the latest change
    opts = {
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = "openai", -- Recommend using Claude
      log_level = "info",
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com",
          proxy = nil,
          allow_insecure = false,
          timeout = 30000,
          extra_request_body = {
            temperature = 0.1,
            max_tokens = 4096,
          },
          model = "gpt-4o", -- Tu modelo preferido
        },
        gemini = {
          endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
          model = "gemini-2.5-flash",
          timeout = 30000, -- Timeout in milliseconds
          temperature = 0,
          max_tokens = 4096,
        },
        openai = {
          endpoint = "https://openrouter.ai/api/v1",
          model = "deepseek/deepseek-v3.2",
          api_key_name = "OPENROUTER_API_KEY", -- Add your API key here
        },
      },
      auto_suggestions_provider = "copilot",
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = false,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      mappings = {
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },
      hints = { enabled = false },
      windows = {
        position = "left", -- the position of the sidebar
        wrap = true, -- similar to vim.o.wrap
        width = 30, -- default % based on available width
        sidebar_header = {
          enabled = true,
          align = "center",
          rounded = false,
        },
        input = {
          prefix = "> ",
          height = 8,
        },
        edit = {
          start_insert = true,
        },
        ask = {
          floating = false,
          start_insert = true,
          focus_on_apply = "ours",
        },
      },
      highlights = {
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      diff = {
        autojump = true,
        list_opener = "copen",
        override_timeoutlen = 500,
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",

      -- Copilot configurado correctamente como dependencia directa
      {
        "zbirenbaum/copilot.lua",
        opts = {
          suggestion = { enabled = false },
          panel = { enabled = false },
        },
        config = function(_, opts)
          require("copilot").setup(opts)
        end,
      },

      {
        "HakonHarnes/img-clip.nvim",
        enabled = false,
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    config = function(_, opts)
      -- Aseguramos explícitamente que Copilot se inicialice antes que Avante en caso de duda
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })

      require("avante").setup(opts)

      local function set_avante_colors()
        local highlights = {
          { group = "AvanteTitle", opts = { fg = "#1e222a", bg = "#98c379" } },
          { group = "AvanteSidebarWinSeparator", opts = { fg = "#5c6170" } },
          { group = "AvanteInlineHint", opts = { fg = "#8394a3", italic = true, force = true } },
        }

        for _, hl in ipairs(highlights) do
          vim.api.nvim_set_hl(0, hl.group, hl.opts)
        end
      end

      set_avante_colors()

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = set_avante_colors,
      })
    end,
  },
}
