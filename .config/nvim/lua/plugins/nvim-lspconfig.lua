return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Keep existing settings
      opts.inlay_hints = { enabled = false }
      opts.servers = opts.servers or {}
      opts.setup = opts.setup or {}

      -- Taplo special handling
      opts.setup.taplo = function(_, _)
        local fname = vim.fn.expand("%:t")
        if fname == "starship.toml" then
          return true -- skip Taplo for this file
        end
      end

      -- ESLint setup
      opts.setup.eslint = function(_, _)
        require("lspconfig").eslint.setup({
          settings = {
            format = { enable = true },
            workingDirectories = { mode = "auto" }, -- important for monorepos
            experimental = { useFlatConfig = true }, -- flat config support
          },
          on_attach = function(client, bufnr)
            -- Disable automatic formatting on change
            client.server_capabilities.documentFormattingProvider = false

            -- Async ESLint fix on save to avoid freeze
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.defer_fn(function()
                  vim.cmd("EslintFixAll")
                end, 0)
              end,
            })
          end,
        })
      end
    end,
  },
}
