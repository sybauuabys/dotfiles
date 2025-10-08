# pyright:reportUndefinedVariable=false
# pylint:disable=E0602
# Qutebrowser Configuration —

# --- Imports (must be first) ---
config.load_autoconfig()

# --- Sessions ---
c.auto_save.session = True
c.session.lazy_restore = True

# --- Scrolling ---
# Slightly smoother but not energy heavy
c.scrolling.smooth = False

# --- Content Settings ---
c.content.javascript.enabled = True
c.content.autoplay = False
c.content.webgl = True  # keep on for site compatibility
c.content.media.audio_video_capture = False
c.content.javascript.can_open_tabs_automatically = False

# --- Keybindings ---
config.bind("M", "spawn mpv {url}")
config.bind("<Ctrl-d>", "scroll-page 0 0.5")
config.bind("<Ctrl-u>", "scroll-page 0 -0.5")
config.bind("j", "cmd-repeat 5 scroll-px 0 20")
config.bind("k", "cmd-repeat 5 scroll-px 0 -20")
config.bind("<Ctrl-w>", "tab-close")
config.bind("<Ctrl-t>", "open -t")
config.bind("<Ctrl-r>", "config-source")
config.bind("zs", "spawn --userscript suspend.sh")
config.bind("zr", "spawn --userscript resume.sh")

# --- Tabs ---
c.tabs.position = "top"
c.tabs.padding = {"top": 8, "bottom": 8, "left": 8, "right": 8}
c.tabs.max_width = 300
c.tabs.title.format = "{audio}{current_title}"
c.window.hide_decoration = True

# --- Fonts ---
c.fonts.default_size = "13pt"
c.fonts.tabs.selected = "14pt default_family"
c.fonts.tabs.unselected = "14pt default_family"
c.fonts.statusbar = "14pt default_family"
c.fonts.completion.entry = "14pt default_family"
c.fonts.completion.category = "bold 14pt default_family"
c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 13

for f in ["standard", "fixed", "serif", "sans_serif", "cursive", "fantasy"]:
    setattr(c.fonts.web.family, f, "JetBrainsMono Nerd Font")

# --- UI Padding ---
c.statusbar.padding = {"top": 8, "bottom": 8, "left": 12, "right": 12}
c.statusbar.show = "always"

# --- Theme: Catppuccin Mocha ---
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
    "base": "#1e1e2e",
    "mantle": "#181825",
    "crust": "#11111b",
}

# Tabs
c.colors.tabs.bar.bg = catppuccin["mantle"]
c.colors.tabs.odd.bg = catppuccin["base"]
c.colors.tabs.even.bg = catppuccin["base"]
c.colors.tabs.selected.odd.bg = catppuccin["mauve"]
c.colors.tabs.selected.even.bg = catppuccin["mauve"]
c.colors.tabs.selected.odd.fg = catppuccin["crust"]
c.colors.tabs.selected.even.fg = catppuccin["crust"]
c.colors.tabs.odd.fg = catppuccin["text"]
c.colors.tabs.even.fg = catppuccin["text"]

# Statusbar
c.colors.statusbar.normal.bg = catppuccin["mantle"]
c.colors.statusbar.normal.fg = catppuccin["text"]
c.colors.statusbar.insert.bg = catppuccin["green"]
c.colors.statusbar.insert.fg = catppuccin["crust"]

# URLs
c.colors.statusbar.url.fg = "#cdd6f4"
c.colors.statusbar.url.hover.fg = "#89b4fa"
c.colors.statusbar.url.success.https.fg = "#a6e3a1"
c.colors.statusbar.url.error.fg = "#f38ba8"
