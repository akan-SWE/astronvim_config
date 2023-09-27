return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "monokai-pro-spectrum",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,

  -- set up UI icons
  -- icons = {
  --   ActiveLSP = "",
  --   ActiveTS = " ",
  --   BufferClose = "",
  --   DapBreakpoint = "",
  --   DapBreakpointCondition = "",
  --   DapBreakpointRejected = "",
  --   DapLogPoint = "",
  --   DapStopped = "",
  --   DefaultFile = "",
  --   Diagnostic = "",
  --   DiagnosticError = "",
  --   DiagnosticHint = "",
  --   DiagnosticInfo = "",
  --   DiagnosticWarn = "",
  --   Ellipsis = "",
  --   FileModified = "",
  --   FileReadOnly = "",
  --   FoldClosed = "",
  --   FoldOpened = "",
  --   FolderClosed = "",
  --   FolderEmpty = "",
  --   FolderOpen = "",
  --   Git = "",
  --   GitAdd = "",
  --   GitBranch = "",
  --   GitChange = "",
  --   GitConflict = "",
  --   GitDelete = "",
  --   GitIgnored = "",
  --   GitRenamed = "",
  --   GitStaged = "",
  --   GitUnstaged = "",
  --   GitUntracked = "",
  --   LSPLoaded = "",
  --   LSPLoading1 = "",
  --   LSPLoading2 = "",
  --   LSPLoading3 = "",
  --   MacroRecording = "",
  --   Paste = "",
  --   Search = "",
  --   Selected = "",
  --   TabClose = "",
  -- },
   plugins = {
    {
      "onsails/lspkind.nvim",
      opts = function(_, opts)
        -- use codicons preset
        opts.preset = "codicons"
        -- set some missing symbol types
        opts.symbol_map = {
          Array = "",
          Boolean = "",
          Key = "",
          Namespace = "",
          Null = "",
          Number = "",
          Object = "",
          Package = "",
          String = "",
        }
        return opts
       end,
    },
  },

--   -- Setting up adapter 
--   local dap = require('dap')
--   dap.adapters.lldb = {
--     type = 'executable',
--     command = '/usr/bin/lldb', -- adjust as needed, must be absolute path
--     name = 'lldb'
--   }
--
-- local dap = require('dap')
-- dap.configurations.cpp = {
--   {
--     name = 'Launch',
--     type = 'lldb',
--     request = 'launch',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},
--
--     -- 💀
--     -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
--     --
--     --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--     --
--     -- Otherwise you might get the following error:
--     --
--     --    Error on launch: Failed to attach to the target process
--     --
--     -- But you should be aware of the implications:
--     -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
--     runInTerminal = false,
--   },
-- }
--
-- -- If you want to use this for Rust and C, add something like this:
--
-- dap.configurations.c = dap.configurations.cpp
}
