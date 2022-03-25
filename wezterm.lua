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

local SHELL = "bash"
local mykeys = {
    {key="C", mods=mainKey, action="Copy"},
    {key="V", mods=mainKey, action="Paste"},
    {key="t", mods=mainKey, action=wezterm.action{SpawnCommandInNewTab={ args={SHELL} }}},
    {key="]", mods=mainKey, action=wezterm.action{ActivateTabRelative=1}},
    {key="[", mods=mainKey, action=wezterm.action{ActivateTabRelative=-1}},
    {key="w", mods=mainKey, action=wezterm.action{CloseCurrentTab={confirm=true}}},
}

for i = 1, 8 do
  table.insert(mykeys, {
    key=tostring(i),
    mods=mainKey,
    action=wezterm.action{ActivateTab=i-1},
  })
end

return {
  keys = mykeys,
  -- color_scheme = "Monokai Remastered",
  color_scheme = "Solarized Dark Higher Contrast",
  font = wezterm.font("Consolas"),
  font_size = 20.0,
}
