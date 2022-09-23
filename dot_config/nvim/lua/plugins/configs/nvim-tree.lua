local icons = require "nvim-web-devicons"
require("nvim-tree").setup {
  create_in_closed_folder = true,
  diagnostics = {
    enable = true,
  },
  disable_netrw = true,
  filesystem_watchers = {
    enable = true,
  },
  filters = {
    custom = {
      "^\\.git$",
      "^\\.terraform",
      "^\\vendor$",
    },
    dotfiles = false,
  },
  git = {
    ignore = false,
  },
  renderer = {
    add_trailing = true,
    highlight_opened_files = "all",
  },
  sort_by = "case_sensitive",
  update_focused_file = {
    enable = true,
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = { {
        action = "dir_up",
        key = "u",
      } },
    },
    side = "left",
  },
}

-- Bind '\tt' to 'NvimTreeToggle'.
vim.keymap.set("n", "<Leader>tt", "<Cmd>NvimTreeToggle<CR>", opts)
