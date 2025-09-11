-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local transparent = false -- set to true if you want transparency

      -- Custom background & palette tweaks
      local bg = "#0f0f23"
      local bg_dark = "#0a0a1a"
      local bg_high = "#2a2a3e"
      local bg_visual = "#45475a"
      local fg = "#cdd6f4"
      local fg_dark = "#bac2de"
      local fg_gutter = "#6c7086"
      local border = "#7f849c"
      local blue = "#89b4fa"

      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        transparent_background = transparent,
        term_colors = true,

        color_overrides = {
          mocha = {
            base = transparent and "NONE" or bg,
            mantle = transparent and "NONE" or bg_dark,
            crust = transparent and "NONE" or bg_dark,
            surface0 = bg_high,
            surface1 = bg_visual,
            surface2 = border,
            overlay0 = fg_gutter,
            overlay1 = fg_dark,
            overlay2 = border,
            text = fg,
            subtext0 = fg_gutter,
            subtext1 = fg_dark,
            blue = blue,
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
