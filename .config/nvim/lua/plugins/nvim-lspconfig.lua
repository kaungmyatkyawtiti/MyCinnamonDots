-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       -- autoformat = false,
--       inlay_hints = { enabled = false },
--     },
--   },
-- }

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hints = { enabled = false }
      opts.servers = opts.servers or {}
      opts.setup = opts.setup or {}

      opts.setup.taplo = function(_, _)
        local fname = vim.fn.expand("%:t")
        if fname == "starship.toml" then
          return true -- returning true skips default setup (disables Taplo here)
        end
      end
    end,
  },
}
