local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Macchiato"

config.font = wezterm.font("DejaVuSansM Nerd Font")
config.font_size = 14

config.enable_tab_bar = false

return config
