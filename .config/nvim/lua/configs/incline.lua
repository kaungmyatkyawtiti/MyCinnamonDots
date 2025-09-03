require("incline").setup({
  highlight = {
    groups = {
      InclineNormal = { guibg = "#444444", guifg = "#b8bb26" },
      InclineNormalNC = { guifg = "#797979", guibg = "#1e2122" },
    },
  },
  window = {
    margin = { vertical = 0, horizontal = 0 }
  },
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
    local icon, color = require("nvim-web-devicons").get_icon_color(filename)
    return { { icon, guifg = color }, { " " }, { filename } }
  end,
})
