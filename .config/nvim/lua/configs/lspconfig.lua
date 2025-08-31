-- require("nvchad.configs.lspconfig").defaults()
--
-- local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- pull in nvchad defaults
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- all servers you want active
local servers = {
  "eslint",
  "emmet_language_server",
  "graphql",
  "tailwindcss",
  "ts_ls",
  "prismals",
  "jdtls",
  "jsonls",
  "cssls",
  "html",
  "lua_ls",
}

-- set up all servers with defaults
for _, lsp in ipairs(servers) do
  if lsp ~= "lua_ls" then -- lua_ls has custom config below
    lspconfig[lsp].setup({
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    })
  end
end

-- custom config for lua_ls
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        enable = false, -- disable lua_ls diagnostics
        -- globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
          vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/love2d/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})
