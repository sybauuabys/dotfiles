# pyright: reportUndefinedVariable=false
# pylint: disable=E0602

# ================================
# Qutebrowser Configuration
# Catppuccin Mocha + Performance
# ================================
# Location: ~/.config/qutebrowser/config.py

# --- Imports ---
config.load_autoconfig()  # Keep this to allow :set changes to persist

# ================================
# General Behavior
# ================================

# Always restore session on startup
c.auto_save.session = True
c.session.lazy_restore = True


# Smooth scrolling globally
c.scrolling.smooth = True

# Global video and JS settings
c.content.javascript.enabled = True
c.content.autoplay = False
c.content.media.audio_video_capture = True
c.content.media.audio_capture = True
c.content.media.video_capture = True
c.content.webgl = True
c.content.javascript.can_open_tabs_automatically = False
config.bind("M", "spawn mpv {url}")


# Half-page smooth scroll
config.bind("<Ctrl-d>", "scroll-page 0 0.5")
config.bind("<Ctrl-u>", "scroll-page 0 -0.5")

# Fast scrolling with j k
config.bind("j", "cmd-repeat 5 scroll-px 0 20")
config.bind("k", "cmd-repeat 5 scroll-px 0 -20")


# Disable autoplay for videos
c.content.autoplay = False

# ================================
# Tabs Configuration
# ================================
# Show tabs at the top
c.tabs.position = "top"
c.window.hide_decoration = True

# Increase tab font size
c.fonts.tabs.selected = "14pt default_family"
c.fonts.tabs.unselected = "14pt default_family"

# Add nice padding
c.statusbar.padding = {"top": 8, "bottom": 8, "left": 12, "right": 12}

# Use rounded corners for completion menu
c.completion.scrollbar.width = 10

# Add padding to tabs (top, bottom, left, right)
c.tabs.padding = {"top": 8, "bottom": 8, "left": 8, "right": 8}

# Maximum width of tabs
c.tabs.max_width = 300

# ================================
# Command Line & Status Bar
# ================================
# Increase command line font size
c.fonts.statusbar = "14pt default_family"
c.fonts.completion.entry = "14pt default_family"
c.fonts.completion.category = "bold 14pt default_family"

# Status bar always visible
c.statusbar.show = "always"

# ================================
# Catppuccin Mocha Theme
# ================================
# This matches your tmux and sketchybar aesthetic

catppuccin = {
    "rosewater": "#f5e0dc",
    "flamingo": "#f2cdcd",
    "pink": "#f5c2e7",
    "mauve": "#cba6f7",
    "red": "#f38ba8",
    "maroon": "#eba0ac",
    "peach": "#fab387",
    "yellow": "#f9e2af",
    "green": "#a6e3a1",
    "teal": "#94e2d5",
    "sky": "#89dceb",
    "sapphire": "#74c7ec",
    "blue": "#89b4fa",
    "lavender": "#b4befe",
    "text": "#cdd6f4",
    "subtext1": "#bac2de",
    "subtext0": "#a6adc8",
    "overlay2": "#9399b2",
    "overlay1": "#7f849c",
    "overlay0": "#6c7086",
    "surface2": "#585b70",
    "surface1": "#45475a",
    "surface0": "#313244",
    "base": "#1e1e2e",
    "mantle": "#181825",
    "crust": "#11111b",
}

# Force Qutebrowser UI colors
c.colors.completion.fg = catppuccin["text"]
c.colors.completion.odd.bg = catppuccin["base"]
c.colors.completion.even.bg = catppuccin["mantle"]
c.colors.completion.category.bg = catppuccin["surface0"]
c.colors.completion.category.fg = catppuccin["lavender"]
c.colors.completion.item.selected.bg = catppuccin["surface1"]
c.colors.completion.item.selected.fg = catppuccin["text"]

# URL color
c.colors.statusbar.url.fg = "#cdd6f4"  # Base text
c.colors.statusbar.url.hover.fg = "#89b4fa"  # Blue on hover
c.colors.statusbar.url.success.https.fg = "#a6e3a1"  # Green for HTTPS
c.colors.statusbar.url.error.fg = "#f38ba8"  # Red for errors


# Tab colors
c.colors.tabs.bar.bg = catppuccin["mantle"]
c.colors.tabs.odd.bg = catppuccin["base"]
c.colors.tabs.even.bg = catppuccin["base"]
c.colors.tabs.selected.odd.bg = catppuccin["mauve"]
c.colors.tabs.selected.even.bg = catppuccin["mauve"]
c.colors.tabs.selected.odd.fg = catppuccin["crust"]
c.colors.tabs.selected.even.fg = catppuccin["crust"]
c.colors.tabs.odd.fg = catppuccin["text"]
c.colors.tabs.even.fg = catppuccin["text"]

# Status bar
c.colors.statusbar.normal.bg = catppuccin["mantle"]
c.colors.statusbar.normal.fg = catppuccin["text"]
c.colors.statusbar.command.bg = catppuccin["surface0"]
c.colors.statusbar.command.fg = catppuccin["lavender"]
c.colors.statusbar.insert.bg = catppuccin["green"]
c.colors.statusbar.insert.fg = catppuccin["crust"]
c.colors.statusbar.passthrough.bg = catppuccin["blue"]
c.colors.statusbar.passthrough.fg = catppuccin["crust"]

# download bar
c.colors.messages.info.bg = catppuccin["crust"]
c.colors.downloads.error.bg = catppuccin["red"]
c.colors.downloads.start.bg = catppuccin["green"]
c.colors.downloads.stop.bg = catppuccin["mantle"]

# Tab tiling format
c.tabs.title.format = "{audio}{current_title}"

# ======================
# Font Configuration
# ======================

# UI font size
c.fonts.default_size = "13pt"

# Webpage font sizing
c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 13
c.fonts.web.size.minimum = 0
c.fonts.web.size.minimum_logical = 6

# Default font family for web content
c.fonts.web.family.standard = "JetBrainsMono Nerd Font"
c.fonts.web.family.fixed = "JetBrainsMono Nerd Font"
c.fonts.web.family.serif = "JetBrainsMono Nerd Font"
c.fonts.web.family.sans_serif = "JetBrainsMono Nerd Font"
c.fonts.web.family.cursive = "JetBrainsMono Nerd Font"
c.fonts.web.family.fantasy = "JetBrainsMono Nerd Font"

# Completion (command suggestions)
c.colors.completion.fg = catppuccin["text"]
c.colors.completion.odd.bg = catppuccin["base"]
c.colors.completion.even.bg = catppuccin["base"]
c.colors.completion.category.bg = catppuccin["mantle"]
c.colors.completion.category.fg = catppuccin["lavender"]
c.colors.completion.item.selected.bg = catppuccin["surface1"]
c.colors.completion.item.selected.fg = catppuccin["mantle"]

# Privacy Settings
config.set("content.webgl", False, "*")  # Disable WebGL
config.set("content.canvas_reading", False)  # Prevent canvas fingerprinting
config.set("content.geolocation", False)  # Block location access
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")


# ================================
# Key Bindings (Optional)
# ================================
config.bind("<Ctrl-w>", "tab-close")
config.bind("<Ctrl-t>", "open -t")
config.bind("<Ctrl-r>", "config-source")


# ================================
# End of Config
# ================================
