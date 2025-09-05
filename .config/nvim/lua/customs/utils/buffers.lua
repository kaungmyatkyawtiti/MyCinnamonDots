local M = {}

-- Return list of listed buffers
function M.buf_list()
  return vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())
end

-- Close all buffers except current
function M.buf_close_others(force)
  force = force or false
  local current = vim.api.nvim_get_current_buf()

  for _, buf in ipairs(M.buf_list()) do
    if buf ~= current then
      pcall(vim.api.nvim_buf_delete, buf, { force = force })
    end
  end
end

return M
