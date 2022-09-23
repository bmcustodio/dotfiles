-- Set mappings for copying to clipboard.
vim.keymap.set("v", "<C-c>", '"+y', opts)
vim.keymap.set("n", "<C-c>", '"+yy', opts)

-- Configure core options.
vim.opt.autoindent = true -- Enable auto-indent.
vim.opt.backspace = "indent,eol,start" -- Tweak backspace's behavior.
vim.opt.clipboard = "unnamedplus" -- Use "unnamedplus".
vim.opt.cmdheight = 0 -- Hide the command line.
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Set completion options.
vim.opt.expandtab = true -- Use spaces instead of tabs.
vim.opt.gdefault = true -- Always substitute all matches in a line.
vim.opt.hlsearch = true -- Highlight all search results.
vim.opt.ignorecase = true -- Always case-insensitive.
vim.opt.incsearch = true -- Search for strings incrementally.
vim.opt.linebreak = true -- Break lines at word.
vim.opt.mouse = "a" -- Enable the use of the mouse.
vim.opt.number = true -- Show line numbers.
vim.opt.wrap = true -- Do not wrap lines.
vim.opt.ruler = true -- Show row and column ruler information.
vim.opt.shiftwidth = 2 -- Number of auto-indent spaces.
vim.opt.showbreak = "↪" -- Wrap-broken line prefix.
vim.opt.showmatch = false -- Highlight matching braces.
vim.opt.showtabline = 0 -- Show tab bar.
vim.opt.smartcase = true -- Enable smart-case search.
vim.opt.smartindent = true -- Enable smart-indent.
vim.opt.smarttab = true -- Enable smart-tabs.
vim.opt.softtabstop = 2 -- Number of spaces per tab.
vim.opt.splitright = true -- Split windows to the right.
vim.opt.tabstop = 2 -- Two spaces per tab.
vim.opt.termguicolors = true -- Enable 24-bit RGB colors.
vim.opt.undolevels = 1000 -- Number of undo levels.
vim.opt.visualbell = true -- Use the visual bell.

-- Don't auto-comment new lines.
vim.api.nvim_create_autocmd("BufEnter", {
  command = "set fo-=c fo-=r fo-=o",
  pattern = "*",
})

-- Don't list quickfix buffers.
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.buflisted = false
  end,
  pattern = "qf",
})

-- Disable unnecessary providers.
local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}
for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
