return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- Gruvbox dark palette
    local colors = {
      bg = "#282828", -- base background
      bg_alt = "#3c3836", -- slightly lighter background
      fg = "#ebdbb2", -- main foreground
      fg_dim = "#a89984", -- dimmed text
      blue = "#83a598", -- gruvbox blue
      cyan = "#8ec07c", -- gruvbox aqua
      green = "#b8bb26", -- gruvbox green
      yellow = "#fabd2f", -- gruvbox yellow
      orange = "#fe8019", -- gruvbox orange
      red = "#fb4934", -- gruvbox red
      magenta = "#d3869b", -- gruvbox purple
      violet = "#b16286", -- gruvbox bright purple
      surface = "#504945", -- statusline mid tone
      border = "#7c6f64",
    }

    local theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.surface, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.surface, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.surface, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.surface, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.surface, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
      inactive = {
        a = { bg = colors.bg_alt, fg = colors.border, gui = "bold" },
        b = { bg = colors.bg_alt, fg = colors.border },
        c = { bg = colors.bg_alt, fg = colors.border },
      },
    }

    lualine.setup({
      options = {
        theme = theme,
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "" }, "diff" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.orange },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
