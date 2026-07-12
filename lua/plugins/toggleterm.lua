return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = true,
  -- ⚡ Solo se despierta si usas el comando manual o tus atajos de teclado
  cmd = { "ToggleTerm", "ToggleTermToggleAll" },
  keys = {
    -- El mapeo principal open_mapping se puede manejar de forma nativa por Lazy aquí
    { "<c-]>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal Principal (ID 1)", mode = { "n", "i", "t" } },
    { "<leader>t2", "<cmd>2ToggleTerm direction=horizontal<cr>", desc = "Toggle Segunda Terminal", mode = "n" },
  },
  config = function()
    local toggleterm = require("toggleterm")

    -- Detectar OS usando la API de Neovim moderna (vim.uv reemplaza a vim.loop)
    local uv = vim.uv or vim.loop
    local is_linux = uv.os_uname().sysname == "Linux"
    local default_shell = nil

    if not is_linux then
      default_shell = "pwsh.exe -NoLogo -NoExit --ExecutionPolicy Bypass"
    end

    toggleterm.setup({
      -- Ya no necesitas open_mapping aquí adentro porque lo maneja el 'keys' de Lazy de arriba
      hide_number = true,
      start_in_insert = true,
      direction = "horizontal",
      shell = default_shell,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
      auto_scroll = true,
      shade_filetypes = {},
      shading_factor = 2,
      close_on_exit = true,
      persist_size = true,
      highlights = {
        FloatBorder = {
          guifg = "#5c6170",
          guibg = "NONE",
        },
      },
    })

    -- 🛠️ Navegación interna de la terminal mejorada (Lua nativo)
    local term_maps_group = vim.api.nvim_create_augroup("ToggleTermNavigation", { clear = true })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm#*",
      group = term_maps_group,
      callback = function()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end,
    })
  end,
}
