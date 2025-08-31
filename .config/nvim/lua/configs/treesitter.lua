local options = {
  ensure_installed = {
    "bash",
    "fish",
    "lua",
    "luadoc",
    "markdown",
    "printf",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
    "typescript",
    "javascript",
    "java",
    "css",
    "dockerfile",
    "dot",
    "sql",
    "prisma",
    "fish",
    "html",
    "graphql",
    "gitignore",
    "http",
    "tmux",
    "javadoc",
    "json",
    "json5",
    "tsx",
    "markdown_inline",
    "meson"
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
