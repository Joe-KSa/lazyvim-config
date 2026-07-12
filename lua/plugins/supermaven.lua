-- This file contains the configuration for the supermaven-nvim plugin in Neovim.
-- It is used to add a supermaven-nvim integration to the Neovim editor.
-- Supermaven is a plugin that allows you to use the Supermaven language server
-- to provide code completion, diagnostics, and other features for the Supermaven
-- programming language.

return {
  {
    "supermaven-inc/supermaven-nvim",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
}
