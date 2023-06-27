return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "imsnif/kdl.vim",
    -- lazy load on kdl files, this config format is used by zellij
    ft = "kdl",
  },
  {
    "akinsho/toggleterm.nvim",
    -- require("toggleterm").setup {
    --   open_mapping = [[<c-\>]],  -- toogle terminal with ctrl-\ but not working close terminal
    -- },
    -- These did not work , still don't understand overriding config
    -- opts = {
    --   open_mapping = [[<c-\>]],  -- toogle terminal with ctrl-\ but not working close terminal
    -- }
    opts = function(_, opts)
      opts.config = {
        open_mapping = [[<c-\>]],  -- toogle terminal with ctrl-\ but not working close terminal
        shadding_factor = 0.3,
      }
      return opts
    end,
  },
}
