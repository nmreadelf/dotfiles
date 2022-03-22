local wezterm = require 'wezterm';
local mykeys = {
    {key="C", mods="ALT", action="Copy"},
    {key="V", mods="ALT", action="Paste"},
    {key="t", mods="ALT", action=wezterm.action{SpawnCommandInNewTab={ args={"bash"} }}},
}

for i = 1, 8 do
  table.insert(mykeys, {
    key=tostring(i),
    mods="ALT",
    action=wezterm.action{ActivateTab=i-1},
  })
end

return {
  keys = mykeys,
}

