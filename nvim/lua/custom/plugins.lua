local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "rust-analyzer",
        "pyright",
        "mypy",
        "ruff",
        "clangd",
        "clang-format",
        "html-lsp",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1 
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end 
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
} 
return plugins
