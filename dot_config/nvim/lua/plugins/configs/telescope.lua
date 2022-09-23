require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--column",
      "--glob=!.git/*",
      "--glob=!**/.terraform/*",
      "--glob=!.terraform.lock.hcl",
      "--glob=!.terraform.tfstate*",
      "--glob=!terraform.tfstate*",
      "--glob=!.vscode/*",
      "--hidden",
      "--line-number",
      "--no-heading",
      "--no-ignore",
      "--smart-case",
      "--with-filename",
    },
  },
}
require("telescope").load_extension "fzf"

vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files hidden=true no_ignore=true<CR>", opts)
vim.keymap.set("n", "<Leader>gf", "<Cmd>Telescope live_grep previewer=false<CR>", opts)
