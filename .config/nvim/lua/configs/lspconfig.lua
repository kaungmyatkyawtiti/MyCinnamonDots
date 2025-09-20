-- require("nvchad.configs.lspconfig").defaults()
--
-- local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- pull in nvchad defaults
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

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
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
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

-- Emmet (restricted filetypes)
vim.lsp.config("emmet_language_server", {
  on_attach = on_attach,
  on_init = on_init,
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
})

-- TS (disable suggestions)
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
})

vim.lsp.config("intelephense", {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local cwd = assert(vim.uv.cwd())
    local root = vim.fs.root(fname, { 'composer.json', '.git' })

    -- prefer cwd if root is a descendant
    on_dir(root and vim.fs.relpath(cwd, root) and cwd)
  end,
  settings = {
    intelephense = {
      telemetry = {
        enabled = false,
      },
    },
  },
})

-- CSS (ignore unknown at-rules)
vim.lsp.config("cssls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    css = {
      lint = { unknownAtRules = "ignore" },
    },
  },
})

-- Tailwind (custom filetypes)
vim.lsp.config("tailwindcss", {
  on_attach = on_attach,
  on_init = on_init,
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
})

-- vim.lsp.config("gopls", {
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
-- })

-- vim.lsp.config("pylsp", {
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
-- })

vim.lsp.enable(servers)

vim.lsp.enable {
  "lua_ls",
  "ts_ls",
  "emmet_language_server",
  "intelephense",
  "tailwindcss",
  "cssls",
}
