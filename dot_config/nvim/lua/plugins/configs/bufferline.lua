require("bufferline").setup {
  options = {
    always_show_bufferline = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match "error" and " " or " "
      return "" .. icon .. count
    end,
    numbers = function(opts)
      return opts.ordinal
    end,
    offsets = {
      {
        filetype = "NvimTree",
        highlight = "Directory",
        padding = 1,
        text = "File Explorer",
      },
    },
    separator_style = "slant",
  },
}

-- Bindings for easier navigation between buffers.
vim.keymap.set("n", "<Leader>`", "<Cmd>BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<Leader>=", "<Cmd>BufferLineCycleNext<CR>", opts)
for i = 1, 9, 1 do
  vim.keymap.set(
    "n",
    string.format("<Leader>%d", i),
    string.format('<cmd>lua require("bufferline").go_to_buffer(%d, true)<cr>', i),
    opts
  )
end

-- 'close_buffer' is used to prevent showing 'nvim-tree' "full-screen" when closing a buffer while other buffers are still open.
-- https://github.com/akinsho/bufferline.nvim/issues/140#issuecomment-888245325
-- https://github.com/akinsho/bufferline.nvim/issues/140#issuecomment-1157886739
local function close_buffer(force)
  local tv = require "nvim-tree.view"
  local bl = require "bufferline"
  local tw = tv.get_winnr()
  if tw == nil then
    vim.cmd "bdelete! "
    return
  end
  local wo = vim.api.nvim_win_is_valid(tw)
  local tb = vim.api.nvim_get_current_buf()
  if wo then
    bl.cycle(-1)
  end
  vim.cmd("bdelete" .. (force and "! " or " ") .. tb)
end

-- Bindings for closing buffers.
vim.keymap.set("n", "<Leader>c", function()
  close_buffer(false)
end, opts)
vim.keymap.set("n", "<Leader>d", function()
  close_buffer(true)
end, opts)
