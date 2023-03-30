local wezterm = require("wezterm")

local launch_menu = {
	{
		args = { "btop" },
	},
	{
		label = "Scratchpad",
		args = { "nvim", "/home/mrnugget/tmp/scratchpad.md" },
		set_environment_variables = { KITTY_COLORS = "dark" },
	},
}


local is_macos = wezterm.target_triple:match("darwin") ~= nil
local function wayland_enabled()
	local wayland = os.getenv("XDG_SESSION_TYPE")
	return wayland == "wayland"
end

local font_size = 11.0
if wayland_enabled() or is_macos then
	font_size = 12.0
end

return {
	-- See: https://wezfurlong.org/wezterm/config/lua/config/term.html
	-- term = "wezterm",

	enable_tab_bar = true,
	font = wezterm.font("MonoLisa-Regular"),
	font_size = font_size,

	launch_menu = launch_menu,

	-- Use this, but then overwrite it basically completely further down
	color_scheme = "Galaxy",
}

