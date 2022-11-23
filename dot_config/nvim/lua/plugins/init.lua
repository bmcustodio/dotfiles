require("packer").startup(function(use)
  use {
    "bmcustodio/bufferline.nvim",
    config = function()
      require "plugins.configs.bufferline"
    end,
    requires = "kyazdani42/nvim-web-devicons",
  }
  use {
    "christoomey/vim-tmux-navigator",
    config = function()
      require "plugins.configs.vim-tmux-navigator"
    end,
  }
  use {
    "ckipp01/stylua-nvim",
    run = "cargo install stylua",
  }
  use {
    "fatih/vim-go",
    run = ":GoUpdateBinaries",
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require "plugins.configs.trouble"
    end,
  }
  use {
    "hashivim/vim-terraform",
  }
  use {
    "hrsh7th/cmp-buffer",
  }
  use {
    "hrsh7th/cmp-cmdline",
  }
  use {
    "hrsh7th/cmp-nvim-lsp",
  }
  use {
    "hrsh7th/cmp-path",
  }
  use {
    "hrsh7th/cmp-vsnip",
  }
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require "plugins.configs.nvim-cmp"
    end,
  }
  use {
    "hrsh7th/vim-vsnip",
  }
  use {
    "navarasu/onedark.nvim",
    config = function()
      require "plugins.configs.onedark"
    end,
  }
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "plugins.configs.nvim-tree"
    end,
  }
  use {
    "kyazdani42/nvim-web-devicons",
  }
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.nvim-lspconfig"
    end,
  }
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "plugins.configs.lualine"
    end,
    requires = {
      { "kyazdani42/nvim-web-devicons" },
    },
  }
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "plugins.configs.telescope"
    end,
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "BurntSushi/ripgrep" },
      { "sharkdp/fd" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.configs.nvim-treesitter"
    end,
    run = ":TSUpdate",
  }
  use "wbthomason/packer.nvim"
end)
