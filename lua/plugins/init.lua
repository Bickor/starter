return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier",
        "gopls"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },

  -- Delve for go debugging
  {
    "mfussenegger/nvim-dap",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- Enable Copilot, followed: http://www.infotinks.com/setting-up-neovim-nvchad-lsp-and-github-copilot-on-mac-or-linux/
  {
    "github/copilot.vim",
    lazy = false,
    config = function ()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end
  },
  -- Enable Copilot Chat, https://github.com/CopilotC-Nvim/CopilotChat.nvim
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim", -- or zbirenbaum/copilot.lua
      "nvim-lua/plenary.nvim", -- for curl, log and async functions
    },
    lazy = false,
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options.
    },
  },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   opts = function()
  --   end
  -- }
}
