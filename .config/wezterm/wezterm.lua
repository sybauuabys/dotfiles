-- WezTerm configuration with Gruvbox Dark theme
local wezterm = require("wezterm")
local constants = require("constants")
local commands = require("commands")
local config = wezterm.config_builder()

config.font_size = 19
config.line_height = 1.2
config.font = wezterm.font("DankMono Nerd font")

config.color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors" }
config.color_scheme = "gruvbox-dark"

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 0.8
config.macos_window_background_blur = 40

config.max_fps = 120
config.prefer_egl = true

wezterm.on("augment-command-palette", function()
	return commands
end)

return config
