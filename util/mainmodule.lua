local module = {}

function module.getservice(ting: Instance)
  local clonerefs = cloneref or function(...) return ... end
  return clonerefs(ting)
end

function module.uiclick(ting: Instance)
  local signals = {
    "Activated",
    "MouseButton1Down",
    "MouseButton1Up",
    "MouseButton2Up",
    "MouseButton1Click",
    "MouseButton2Down", --i forget if theres any more signals :(
  }
  for _, signal in ipairs(signals) do
    firesignal(ting[signal])
  end
end

function module.keypress(enum: Enum.KeyCode, time: number)
  if not time then
    time = 0
  end
  local vim = module.getservice(game:GetService('VirtualInputManager')) -- better fucking pray ur executor is level 2+ >:)
  vim:SendKeyEvent(true, key, false, nil)
	task.wait(time)
	vim:SendKeyEvent(false, key, false, nil)
end

return module
