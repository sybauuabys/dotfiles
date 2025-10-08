return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim", -- Popup + layout library
    "rcarriga/nvim-notify", -- Fancy notifications
  },
  config = function()
    -- Setup Notify
    local notify = require("notify")
    notify.setup({
      stages = "fade_in_slide_out", -- smooth animation
      timeout = 2500, -- auto-hide delay
      render = "compact", -- minimal style
      background_colour = "#1a1b26",
      max_width = 60,
      max_height = 10,
    })
    vim.notify = notify

    -- Keymaps for notify
    local keymap = vim.keymap.set
    keymap("n", "<leader>md", function()
      notify.dismiss({ silent = true, pending = true })
    end, { desc = "Dismiss all notifications" })
    keymap("n", "<leader>mh", function()
      vim.cmd("messages")
    end, { desc = "View message history" })

    -- Setup Noice
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, -- Command-line search on bottom
        command_palette = true, -- Command line in center popup
        lsp_doc_border = true, -- Border for hover/signature
      },
      views = {
        cmdline_popup = {
          position = { row = 5, col = "50%" },
          size = { width = 60, height = "auto" },
          border = { style = "rounded" },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "DiagnosticInfo",
            },
          },
        },
        popupmenu = {
          relative = "editor",
          position = { row = 8, col = "50%" },
          size = { width = 60, height = 10 },
          border = { style = "rounded", padding = { 0, 1 } },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "DiagnosticInfo",
            },
          },
        },
      },
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
    })
  end,
}
