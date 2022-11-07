vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  local bufopts = {
    buffer = bufnr,
    noremap = true,
    silent = true,
  }
  vim.keymap.set("n", "ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gf", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "sh", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "rn", vim.lsp.buf.rename, bufopts)

  -- nvim-cmp
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_flags = {
  debounce_text_changes = 150,
}
require("lspconfig")["gopls"].setup {
  capabilities = capabilities,
  cmd = { "gopls" },
  flags = lsp_flags,
  init_options = {
    usePlaceholders = true,
  },
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      experimentalPostfixCompletions = true,
      gofumpt = true,
      staticcheck = true,
    },
  },
}
require("lspconfig")["sumneko_lua"].setup {
  capabilities = capabilities,
  commands = {
    Format = {
      function()
        require("stylua-nvim").format_file()
      end,
    },
  },
  flags = lsp_flags,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
require("lspconfig")["terraformls"].setup {
  capabilities = capabilities,
  flags = lsp_flags,
  on_attach = on_attach,
}
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.cmd [[TerraformFmt]]
  end,
  pattern = {
    "*.tf",
    "*.tfvars",
  },
})
require("lspconfig")["tflint"].setup {}
