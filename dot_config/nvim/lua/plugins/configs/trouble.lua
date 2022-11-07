require("trouble").setup {
  auto_preview = false,
}

vim.keymap.set("n", "<Leader>xx", "<CMD>TroubleToggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", { silent = true, noremap = true })
