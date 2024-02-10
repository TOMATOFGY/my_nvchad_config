local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  {
    'toppair/reach.nvim',
    lazy = false,
    config = function()
      require('reach').setup({
        notifications = true
      })
    end
  },
  -- {
  --   "folke/noice.nvim",
  --   lazy = false,
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   },
  --   config = function()
  --     require("noice").setup({
  --       messages = {
  --         -- NOTE: If you enable messages, then the cmdline is enabled automatically.
  --         -- This is a current Neovim limitation.
  --         enabled = true,              -- enables the Noice messages UI
  --         view = "notify",             -- default view for messages
  --         view_error = "notify",       -- view for errors
  --         view_warn = "notify",        -- view for warnings
  --         view_history = "messages",   -- view for :messages
  --         view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  --       }
  --     })
  --   end
  -- },
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({
        --        replace_netrw = true
      })
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    lazy=false,
    config = function()
      require("hop").setup()
      -- vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      -- vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
        "kdheepak/lazygit.nvim",
      lazy=false,
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
  },
  {
  "hedyhli/outline.nvim",
    lazy=false,
  config = function()
    -- Example mapping to toggle outline
    -- vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
    --   { desc = "Toggle Outline" })
    require("outline").setup {
      -- Your setup opts here (leave empty to use defaults)
    }
  end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 , lazy=false}, -- pufan 推荐的主题
  -- https://github.com/rasulomaroff/reactive.nvim
  { 'rasulomaroff/reactive.nvim', lazy=false, config = function()
    require('reactive').setup {
  builtin = {
    cursorline = true,
    cursor = true,
    modemsg = true
  }
}
  end},
  {
  "sourcegraph/sg.nvim",
  dependencies = { "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]] },
},
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    init = function()
      require("core.utils").load_mappings "whichkey"
      vim.o.timeout = true
      vim.o.timeoutlen = 100
    end,
    cmd = "WhichKey",
    opts = overrides.whichkey,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
    end,
  },
}


return plugins
