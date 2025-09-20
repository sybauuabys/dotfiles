-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local transparent = false -- set to true if you want transparency

      -- === Your Original Custom Colors ===
      local bg = "#0f0f23"
      local bg_dark = "#0a0a1a"
      local bg_high = "#2a2a3e"
      local bg_visual = "#45475a"
      local fg = "#cdd6f4"
      local fg_dark = "#bac2de"
      local fg_gutter = "#6c7086"
      local border = "#7f849c"
      local blue = "#89b4fa"

      -- Load Catppuccin palette dynamically
      local colors = require("catppuccin.palettes").get_palette("mocha")

      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        transparent_background = transparent,
        term_colors = true,

        -- Override Catppuccin base with your colors
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

        integrations = {
          cmp = true, -- Autocompletion
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          leap = true,
          dap = {
            enabled = true,
            enable_ui = true,
          },
        },

        -- ===== Custom Highlights Optimized for Web Dev =====
        custom_highlights = function()
          return {
            -- === General Syntax ===
            Comment = { fg = fg_gutter, style = { "italic" } },
            Constant = { fg = colors.peach },
            String = { fg = colors.yellow, style = { "italic" } },
            Character = { fg = colors.teal },
            Number = { fg = colors.maroon },
            Float = { fg = colors.maroon },
            Boolean = { fg = colors.maroon },
            Identifier = { fg = fg },
            Function = { fg = colors.green },
            Statement = { fg = colors.mauve },
            Conditional = { fg = colors.red },
            Repeat = { fg = colors.red },
            Label = { fg = colors.peach },
            Operator = { fg = fg },
            Keyword = { fg = colors.pink },
            PreProc = { fg = colors.peach },
            Include = { fg = colors.green },
            StorageClass = { fg = colors.yellow },
            Structure = { fg = colors.yellow },
            Typedef = { fg = colors.yellow },
            Special = { fg = colors.peach },
            Type = { fg = colors.teal },

            -- === HTML ===
            ["@tag"] = { fg = colors.red }, -- <div>
            ["@tag.attribute"] = { fg = colors.yellow, style = { "italic" } }, -- class, id, etc.
            ["@tag.delimiter"] = { fg = fg_dark }, -- <, >, />

            -- === CSS ===
            ["@property"] = { fg = blue }, -- CSS properties like display, color
            ["@string.special.url"] = { fg = colors.green, style = { "italic" } },
            ["@number"] = { fg = colors.peach },
            ["@unit"] = { fg = colors.pink }, -- px, rem, em, %

            -- === TailwindCSS ===
            ["@class"] = { fg = colors.teal, style = { "bold" } },
            ["@class.attribute"] = { fg = colors.green, style = { "italic" } },

            -- === JavaScript / TypeScript ===
            ["@variable"] = { fg = fg },
            ["@variable.builtin"] = { fg = colors.red },
            ["@function"] = { fg = colors.green },
            ["@keyword"] = { fg = colors.pink, style = { "italic" } },
            ["@keyword.function"] = { fg = colors.mauve },
            ["@keyword.return"] = { fg = colors.mauve },
            ["@string.regex"] = { fg = colors.yellow, style = { "italic" } },
            ["@punctuation"] = { fg = border },
            ["@operator"] = { fg = colors.sky },

            -- === Markdown ===
            ["@markup.heading"] = { fg = colors.mauve, style = { "bold" } },
            ["@markup.link"] = { fg = blue, style = { "underline" } },
            ["@markup.bold"] = { fg = colors.peach, style = { "bold" } },
            ["@markup.italic"] = { fg = colors.green, style = { "italic" } },
            ["@markup.raw"] = { fg = colors.teal },

            -- === Git Integration ===
            GitSignsAdd = { fg = colors.green },
            GitSignsChange = { fg = colors.peach },
            GitSignsDelete = { fg = colors.red },

            -- === UI Elements ===
            BufferLineSeparator = { fg = colors.peach, bg = "NONE" },
            BufferLineBufferVisible = { fg = fg_dark, bg = "NONE" },
            BufferLineBufferSelected = {
              fg = fg,
              bg = "NONE",
              style = { "bold", "italic" },
            },
            BufferLineIndicatorSelected = { fg = colors.peach, bg = "NONE" },

            -- === Diagnostics ===
            DiagnosticError = { fg = colors.red },
            DiagnosticWarn = { fg = colors.peach },
            DiagnosticInfo = { fg = blue },
            DiagnosticHint = { fg = colors.green },

            -- === Telescope ===
            TelescopeBorder = { fg = blue },
            TelescopePromptBorder = { fg = colors.peach },
          }
        end,
      })

      -- Apply the theme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
