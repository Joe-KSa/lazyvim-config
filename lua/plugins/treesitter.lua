return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- 1. Añadimos los lenguajes requeridos
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "blade",
        "php_only",
      })

      -- 2. Reconocimiento de archivos .blade.php
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      -- 3. Inyección segura (evita el error 'nil value' en versiones recientes)
      local ok, parsers = pcall(require, "nvim-treesitter.parsers")
      if ok and parsers then
        local parser_configs
        if type(parsers.get_parser_configs) == "function" then
          parser_configs = parsers.get_parser_configs()
        elseif type(parsers.get_parser_configs) == "table" then
          parser_configs = parsers.get_parser_configs
        end

        -- Si obtenemos la configuración y blade no está, lo inyectamos manualmente
        if parser_configs and not parser_configs.blade then
          parser_configs.blade = {
            install_info = {
              url = "https://github.com/EmranMR/tree-sitter-blade",
              files = { "src/parser.c" },
              branch = "main",
            },
            filetype = "blade",
          }
        end
      end

      return opts
    end,
  },
}
