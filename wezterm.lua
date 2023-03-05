local wezterm = require 'wezterm';
local mainKey = "ALT"

local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
if BinaryFormat == "dll" then
    mainKey = "META"
elseif BinaryFormat == "dylib" then
    mainKey = "META"
else
    mainKey = "ALT"
end

local mykeys = {
    {key="C", mods=mainKey, action="Copy"},
    {key="V", mods=mainKey, action="Paste"},
    {key="t", mods=mainKey, action=wezterm.action{SpawnCommandInNewTab={}}},
    {key="]", mods=mainKey, action=wezterm.action{ActivateTabRelative=1}},
    {key="[", mods=mainKey, action=wezterm.action{ActivateTabRelative=-1}},
    {key="w", mods=mainKey, action=wezterm.action{CloseCurrentTab={confirm=true}}},
    {key="Enter", mods="CTRL", action=wezterm.action.ToggleFullScreen},
}

for i = 1, 8 do
  -- go to one tab
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

return {
  tab_bar_at_bottom = true,
  window_padding = {
    left = 12,
    right = 8,
    top = 12,
    bottom = 8,
  },
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
