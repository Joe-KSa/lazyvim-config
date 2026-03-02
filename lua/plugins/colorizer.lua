return {
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        options = {
          parsers = {
            css = true,
            tailwind = { enable = true },
          },
          display = {
            mode = "virtualtext",
            virtualtext = { position = "after" },
          },
        },
      })
    end,
  },
}
