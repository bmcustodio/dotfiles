require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "c",
    "comment",
    "cpp",
    "dockerfile",
    "go",
    "gomod",
    "hcl",
    "lua",
    "json",
    "make",
    "markdown",
    "proto",
    "python",
    "regex",
    "rst",
    "vim",
    "yaml",
  },
  highlight = {
    additional_vim_regex_highlighting = false,
    disable = function(lang, bufnr)
      return vim.api.nvim_buf_line_count(bufnr) >= 3000
    end,
    enable = true,
  },
  sync_install = true,
}
