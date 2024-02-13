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
config.color_scheme = "AdventureTime"

config.font = wezterm.font_with_fallback({
	{ family = "CaskaydiaCove Nerd Font" },
	{ family = "FiraCode Nerd Font" },
	{ family = "Iosevka Nerd Font" },
})

config.font_size = 14
config.window_background_opacity = 0.90
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.use_fancy_tab_bar = true

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

config.launch_menu = launch_menu
config.mouse_bindings = mouse_bindings
config.keys = keys

wezterm.on("gui-startup", function(window)
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:maximize()
end)

return config
