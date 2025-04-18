local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Macchiato"

config.font = wezterm.font("MonaspiceNe Nerd Font", { weight = "Regular" })
config.font_size = 16

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.window_padding = {
    top = ".2cell",
    right = ".2cell",
    bottom = ".2cell",
    left = ".2cell",
}

return config
