return {
  window = {
    width = 0.9,
  },
  on_open = function()
    -- Disable Incline when ZenMode is active
    if pcall(require, "incline") then
      require("incline").disable()
    end
  end,
  on_close = function()
    -- Re-enable Incline when ZenMode closes
    if pcall(require, "incline") then
      require("incline").enable()
    end
  end,
}
