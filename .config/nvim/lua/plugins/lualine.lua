return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- Palette synced with your SketchyBar Catppuccin Mocha
    local colors = {
      base = "#1e1e2e",
      mantle = "#181825",
      crust = "#11111b",
      text = "#cdd6f4",
      subtext = "#a6adc8",
      surface0 = "#313244",
      surface1 = "#45475a",
      overlay0 = "#6c7086",
      lavender = "#b4befe",
      mauve = "#cba6f7",
      blue = "#89b4fa",
      green = "#a6e3a1",
      yellow = "#f9e2af",
      orange = "#fab387",
      red = "#f38ba8",
    }

    local theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      insert = {
        a = { bg = colors.green, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      visual = {
        a = { bg = colors.mauve, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      replace = {
        a = { bg = colors.red, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      inactive = {
        a = { bg = colors.surface0, fg = colors.overlay0, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.overlay0 },
        c = { bg = colors.surface0, fg = colors.overlay0 },
      },
    }

    lualine.setup({
      options = {
        theme = theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.orange }, -- same as SketchyBar accent
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
