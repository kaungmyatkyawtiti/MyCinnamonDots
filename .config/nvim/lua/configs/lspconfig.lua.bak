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
  "graphql",
  "prismals",
  "docker_compose_language_service",
  "dockerls",
  "jdtls",
  "jsonls",
  "html",
  "lua_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

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

lspconfig.emmet_language_server.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "htmlangular",
    "htmldjango",
    "javascriptreact",
    "less",
    "php",
    "pug",
    "sass",
    "scss",
    "typescriptreact",
  },
}

lspconfig.ts_ls.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
}

lspconfig.intelephense.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(_)
    return vim.loop.cwd()
  end,
  settings = {
    intelephense = {
      telemetry = {
        enabled = false,
      },
    },
  },
}

-- lspconfig.gopls.setup {
--   on_init = on_init,
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     gopls = {
--       completeUnimported = true,
--       usePlaceholders = true,
--       analyses = {
--         unusedparams = true,
--       },
--     },
--   },
-- }

lspconfig.cssls.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
}

-- lspconfig.pylsp.setup {
--   on_init = on_init,
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       plugins = {
--         mccabe = {
--           threshold = 50,
--         },
--         pycodestyle = {
--           ignore = { "E501", "W503" },
--           maxLineLength = 120,
--         },
--       },
--     },
--   },
-- }

lspconfig.tailwindcss.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "aspnetcorerazor",
    "astro",
    "astro-markdown",
    "blade",
    "clojure",
    "css",
    "django-html",
    "edge",
    "eelixir",
    "ejs",
    "elixir",
    "erb",
    "eruby",
    "gohtml",
    "gohtmltmpl",
    "haml",
    "handlebars",
    "hbs",
    "heex",
    "html",
    "html-eex",
    "htmlangular",
    "htmldjango",
    "jade",
    "javascript",
    "javascriptreact",
    "leaf",
    "less",
    "liquid",
    "mdx",
    "mustache",
    "njk",
    "nunjucks",
    "php",
    "postcss",
    "razor",
    "reason",
    "rescript",
    "sass",
    "scss",
    "slim",
    "stylus",
    "sugarss",
    "svelte",
    "templ",
    "twig",
    "typescript",
    "typescriptreact",
    "vue",
  },
}
