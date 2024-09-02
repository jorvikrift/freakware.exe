local module = {}

local fuckery = loadstring(game:HttpGet("https://raw.githubusercontent.com/jorvikrift/freakware.exe/main/util/mainmodule.lua"))()

local Players = fuckery.getservice(game:GetService("Players")) :: Players
local WS = fuckery.getservice(game:GetService("Workspace")) :: Workspace

local LocalPlayer = Players.LocalPlayer
local ParkGame = WS:FindFirstChild("MiniGames") or WS:WaitForChild("MiniGames")
local GameplayGame = WS:FindFirstChild("Games") or WS:WaitForChild("Games")

function module.getplrgame()
  local found = ParkGame:FindFirstChild(LocalPlayer.Name,true) or GameplayGame:FindFirstChild(LocalPlayer.Name,true)
  if not found then
    return
  end
  return found.Parent.Parent.Parent, found.Parent.Parent.Parent.Name
end

return module
