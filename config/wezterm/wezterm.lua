-- Use CTRL+SHIFT+R to reload configurations
-- The only required line is this one.
local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action
-- Some empty tables for later use
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

-- config.default_prog = { "pwsh.exe", "-NoLogo" }
-- config.default_prog = { "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe" }
-- config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }

-- Use Config Builder Object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
-- Theme Names: cyberpunk, FirefoxDev, AdventureTime, GruvboxDark, GruvboxDarkHard, Hacktober, Hybrid, iceberg-dark, idea, Japanesque, Macintosh (base16), matrix, Matrix (terminal.sexy), Mikazuki (terminal.sexy), Monokai Remastered, Neon, Neon (terminal.sexy), Operator Mono Dark, Royal
config.color_scheme = "GruvboxDarkHard"
config.font = wezterm.font_with_fallback({
	{ family = "CaskaydiaCove Nerd Font" },
	{ family = "FiraCode Nerd Font" },
	{ family = "Iosevka Nerd Font" },
})

-- Background Settings
-- config.window_background_image = "D:\\Pictures\\Anime Grils\\ForVSCODE\\nier-automata-2b-desktop-wallpaper.jpg"
-- config.window_background_image = "D:\\Pictures\\Wallpapers\\VDay-en.jpg"
config.window_background_image_hsb = {
	-- Darken the background image
	brightness = 0.3,

	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 1.0,

	-- You can adjust the saturation also.
	saturation = 1.0,
}

config.font_size = 14
config.window_background_opacity = 0.95
config.text_background_opacity = 1.0
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 10000
config.default_workspace = "home"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Key Settings
config.leader = { key = "a", mods = "CTRL", timeout_miliseconds = 1000 }
config.keys = {
	-- { key = "c", mods = "LEADER", action = wezterm.action.ActiveCopyMode },
}

-- Set Pwsh as the default on Windows
config.default_prog = { "pwsh.exe", "-NoLogo" }

table.insert(launch_menu, {
	label = "PowerShell",
	args = { "powershell.exe", "-NoLogo" },
})
table.insert(launch_menu, {
	label = "Pwsh",
	args = { "pwsh.exe", "-NoLogo" },
})

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config.launch_menu = launch_menu
config.mouse_bindings = mouse_bindings
config.keys = keys

return config
