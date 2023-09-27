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
  --
  
  { "lukas-reineke/indent-blankline.nvim",
    config = function()
      opts = {}
      -- Other blankline configuration here
      require("indent_blankline").setup(require("indent-rainbowline").make_opts(opts))
    end,
    dependencies = {
      {"TheGLander/indent-rainbowline.nvim"},
    },
  },

   
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup()
  end,

  {
   "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },

  {
  'Wansmer/treesj',

  keys = { "<space>m",
          "<CMD>TSJToggle<CR>",
          "<space>j",
          "<space>s",
          desc = "Toggle Treesitter Join",
        },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin"},

  opts = {},

  },
  
  'mfussenegger/nvim-dap',
  -- config = function()
  --   require('treesj').setup({--[[ your config ]]})
  -- end,
  --
  -- "akinsho/toggleterm.nvim",
  --   tag = '*', config = function()
  --   require("toggleterm").setup()
  -- end,

}
