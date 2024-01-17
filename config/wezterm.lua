local wezterm = require("wezterm")
local config = {}

-- Use Config Builder Object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.color_scheme = "Catppuccin"
-- config.color_scheme = "Macintosh (base16)"
config.font = wezterm.font_with_fallback({
	{ family = "CaskaydiaCove Nerd Font", weight = "Medium" },
	{ family = "FiraCode Nerd Font", weight = "Medium" },
	{ family = "Iosevka Nerd Font", weight = "Medium" },
})
config.font_size = 16.0
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"

-- Key Settings
config.leader = { key = "a", mods = "CTRL", timeout_miliseconds = 1000 }

return config
