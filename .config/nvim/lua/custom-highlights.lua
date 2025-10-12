local M = {}

function M.setup()
  local hl = vim.api.nvim_set_hl
  
  -- Gruvbox dark color palette
  local colors = {
    -- Base colors
    bg0 = "#282828",
    bg1 = "#3c3836",
    bg2 = "#504945",
    bg3 = "#665c54",
    bg4 = "#7c6f64",
    
    -- Foreground colors
    fg0 = "#fbf1c7",
    fg1 = "#ebdbb2",
    fg2 = "#d5c4a1",
    fg3 = "#bdae93",
    fg4 = "#a89984",
    
    -- Accent colors
    red = "#fb4934",
    green = "#b8bb26",
    yellow = "#fabd2f",
    blue = "#83a598",
    purple = "#d3869b",
    aqua = "#8ec07c",
    orange = "#fe8019",
    gray = "#928374",
  }

  local purple = colors.purple
  local blue = colors.blue
  local green = colors.green
  local yellow = colors.yellow
  local red = colors.red

  -- HTML
  hl(0, "@tag", { fg = purple, bold = true })
  hl(0, "@tag.attribute", { fg = yellow, italic = true })
  hl(0, "@tag.delimiter", { fg = colors.gray })

  -- CSS
  hl(0, "@property.css", { fg = yellow })
  hl(0, "@type.css", { fg = purple })
  hl(0, "@function.css", { fg = blue })
  hl(0, "@number.css", { fg = green })

  -- JavaScript / TypeScript
  hl(0, "@function.call.javascript", { fg = blue, bold = true })
  hl(0, "@keyword.javascript", { fg = purple, italic = true })
  hl(0, "@variable.javascript", { fg = colors.fg1 })
  hl(0, "@constant.javascript", { fg = yellow })
  hl(0, "@string.javascript", { fg = green })
  hl(0, "@operator.javascript", { fg = red })

  -- JSX / TSX (React / Next.js)
  hl(0, "@tag.jsx", { fg = purple, bold = true })
  hl(0, "@tag.attribute.jsx", { fg = yellow })
  hl(0, "@constructor.jsx", { fg = blue })
  hl(0, "@variable.builtin.jsx", { fg = colors.fg1, italic = true })
  hl(0, "@function.call.jsx", { fg = blue, bold = true })
  hl(0, "@tag.tsx", { fg = purple, bold = true })
  hl(0, "@tag.attribute.tsx", { fg = yellow })
  hl(0, "@function.call.tsx", { fg = blue })
  hl(0, "@variable.builtin.tsx", { fg = green, italic = true })
end

return M
