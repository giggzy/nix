return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.python" },
  -- ERROR: The following are not installing some dependencies, npm error but not sure why
  -- { import = "astrocommunity.pack.yaml" },
  -- { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.json" },
  -- END ERROR
  -- Integrates copilot and cmp, uses TAB, current <C-j> is not working
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { -- further customize the options set by the community
  --   "copilot.lua-cmp",
  --   opts = {
  --     suggestion = {
  --       keymap = {
  --         next = "<C-j>",
  --         prev = "<C-k>",
  --         select = "<CR>",
  --         cancel = "<C-c>",
  --         dismiss = "<C-e>",
  --       },
  --     },
  --   },
  -- },
  -- { import = "astrocommunity.completion.copilot-lua" },
  --[[
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require "cmp"
      return {
        mapping = {
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_previous_item(),
          ["<C-p>"] = cmp.mapping.select_previous_item(),
        },
      }
    end,
  },
  {
    // FAILS, attempt to index into a nil value (global 'cmp')
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.mapping = require("astronvim.utils").list_insert_unique(opts.mapping, {
          ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ["<C-k>"] = cmp.mapping.select_previous_item { behavior = cmp.SelectBehavior.Select },
          ["<C-p>"] = cmp.mapping.select_previous_item { behavior = cmp.SelectBehavior.Select },
      })
    end,
  },
  --]]
}
