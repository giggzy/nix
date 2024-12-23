return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "╔╗ ╔╗╔═══╗╔╗   ╔══╗ ╔═══╗╔════╗",
        "║║ ║║║╔═╗║║║   ╚╣╠╝ ║╔══╝║╔╗╔╗║",
        "║║ ║║║╚═╝║║║    ║║  ║╚══╗╚╝║║╚╝",
        "║║ ║║║╔══╝║║ ╔╗ ║║  ║╔══╝  ║║  ",
        "║╚═╝║║║   ║╚═╝║╔╣╠╗╔╝╚╗   ╔╝╚╗ ",
        "╚═══╝╚╝   ╚═══╝╚══╝╚══╝   ╚══╝ ",
      }
      return opts
    end,
  },
  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      luasnip.filetype_extend("typescript", { "typescriptreact" })
    end,
  },
  --[[ NOT WORKING TRYING TO CUSTOMIZE CMP PLUGIN
  {
    "hrsh7th/nvim-cmp",
    config = function(plugin, opts)
      require "plugins.configs.nvim-cmp"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom nvim-cmp configuration such as custom snippets
      local cmp = require "cmp"
      cmp.setup.buffer {
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
        },
      }
    end,
  }
  --]]
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { -- add a new dependency to telescope that is our new plugin
      "dhruvmanila/telescope-bookmarks.nvim",
      keys = {
        { "<leader>fR", "<cmd>Telescope bookmarks<cr>", desc = "Chrome Bookmarks" },
      },
      opts = {
        extensions = {
          bookmarks = {
            selected_browser = "chrome",
            url_open_command = "open",
          },
        },
      },
      config = function()
        require("telescope").load_extension("bookmarks")
      end, 
    },
    -- the first parameter is the plugin specification
    -- the second is the table of options as set up in Lazy with the `opts` key
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require("plugins.configs.telescope")(plugin, opts)

      -- require telescope and load extensions as necessary
      local telescope = require "telescope"
      telescope.load_extension "bookmarks"
    end,
  }
}
