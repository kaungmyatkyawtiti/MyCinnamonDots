-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = function(_, opts)
--       opts.inlay_hints = { enabled = false }
--       opts.servers = opts.servers or {}
--       opts.setup = opts.setup or {}
--
--       opts.setup.taplo = function(_, _)
--         local fname = vim.fn.expand("%:t")
--         if fname == "starship.toml" then
--           return true -- returning true skips default setup (disables Taplo here)
--         end
--       end
--     end,
--   },
-- }

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
            format = { enable = true }, -- optional
          },
          on_attach = function(client, bufnr)
            -- Disable automatic formatting on change
            client.server_capabilities.documentFormattingProvider = false

            -- Run ESLint fix on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.cmd("EslintFixAll")
              end,
            })
          end,
        })
      end
    end,
  },
}
