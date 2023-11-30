local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Macchiato"

config.font = wezterm.font("Monaspace Neon Var", { weight = "Bold" })
config.harfbuzz_features = { "dlig=1" }
config.font_size = 15

config.enable_tab_bar = false

return config
