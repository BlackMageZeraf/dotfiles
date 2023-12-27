local wezterm = require("wezterm")
local config = {}

-- Use Config Builder Object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({
	{ family = "Iosevka Nerd Font", scale = 1.25 },
	{ family = "FiraCode Nerd Font", scale = 1.25 },
})
config.window_background_opacity = 0.85
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"

-- Key Settings
config.leader = { key = "a", mods = "CTRL", timeout_miliseconds = 1000 }
config.keys = {
	-- { key = "c", mods = "LEADER", action = wezterm.action.ActiveCopyMode },
}

return config
