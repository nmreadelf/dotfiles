local wezterm = require 'wezterm';
local mainKey = "ALT"
local act = wezterm.action
local mux = wezterm.mux
local launch_menu = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  mainKey = "META"
  table.insert(launch_menu, {
    label = 'cygwin',
    args = { 'd:\\cygwin64\\bin\\bash.exe', '-i', '-l' },
  })
elseif wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
  mainKey = "META"
else
  mainKey = "ALT"
end

local mykeys = {
  {key="c",     mods="ALT",         action=wezterm.action.CopyTo 'ClipboardAndPrimarySelection'},
  {key="v",     mods="ALT",         action=wezterm.action.PasteFrom 'Clipboard'},
  {key="t",     mods=mainKey,       action=wezterm.action{SpawnCommandInNewTab={}}},
  {key="]",     mods=mainKey,       action=wezterm.action{ActivateTabRelative=1}},
  {key="[",     mods=mainKey,       action=wezterm.action{ActivateTabRelative=-1}},
  {key="w",     mods=mainKey,       action=wezterm.action{CloseCurrentTab={confirm=true}}},
  {key="Enter", mods="CTRL",        action=wezterm.action.ToggleFullScreen},
  {key='%',     mods="CTRL|SHIFT",  action=wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }},
  {key='"',     mods="CTRL|SHIFT",  action=wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }},
  {key='h',     mods="CTRL|SHIFT",  action=act.AdjustPaneSize { 'Left', 5 }},
  {key='k',     mods="CTRL|SHIFT",  action=act.AdjustPaneSize { 'Up', 5 }},
  {key='j',     mods="CTRL|SHIFT",  action=act.AdjustPaneSize { 'Down', 5 }},
  {key='l',     mods="CTRL|SHIFT",  action=act.AdjustPaneSize { 'Right', 5 }},
  {key='{',     mods='SHIFT|ALT',   action=act.MoveTabRelative(-1) },
  {key='}',     mods='SHIFT|ALT',   action=act.MoveTabRelative(1) },
  {key='F9',    mods='ALT',         action=wezterm.action.ShowTabNavigator },
  {key='l',    mods='ALT',         action=wezterm.action.ShowLauncher },
}

for i = 1, 8 do
  table.insert(mykeys, {
    key=tostring(i),
    mods=mainKey,
    action=wezterm.action{ActivateTab=i-1},
  })

  -- move current tab to a specified position
  table.insert(mykeys, {
    key=tostring(i),
    mods="CTRL|ALT",
    action=wezterm.action{MoveTab=i-1},
  })
end

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return {
  prefer_egl = false,
  tab_bar_at_bottom = true,
  window_padding = {
    left = 12,
    right = 8,
    top = 12,
    bottom = 8,
  },
  audible_bell = "Disabled",
  visual_bell = {
    fade_in_function = 'EaseIn',
    fade_in_duration_ms = 150,
    fade_out_function = 'EaseOut',
    fade_out_duration_ms = 150,
  },
  colors = {
    visual_bell = '#202020'
  },
  launch_menu = launch_menu,
  tab_max_width = 24,
  enable_scroll_bar = true,
  keys = mykeys,
  -- color_scheme = "Monokai Remastered",
  -- color_scheme = "Gruvbox Dark",
  color_scheme = "Solarized Dark Higher Contrast",
  -- font = wezterm.font("Hack Nerd Font Mono"),
  font = wezterm.font("Consolas"),
  font_size = 20.0,
  adjust_window_size_when_changing_font_size = false,
  initial_cols = 272,
  initial_rows = 59,
}
