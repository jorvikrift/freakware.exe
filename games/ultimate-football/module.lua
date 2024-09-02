local module = {}

local fuckery = loadstring(game:HttpGet("https://raw.githubusercontent.com/jorvikrift/freakware.exe/main/util/mainmodule.lua"))()

local Players = fuckery.getservice(game:GetService("Players")) :: Players
local WS = fuckery.getservice(game:GetService("Workspace")) :: Workspace

local LocalPlayer = Players.LocalPlayer
local ParkGame = WS:FindFirstChild("MiniGames") or WS:WaitForChild("MiniGames")
local GameplayGame = WS:FindFirstChild("Games") or WS:WaitForChild("Games")

local Character = LocalPlayer or LocalPlayer.CharacterAdded:Wait()
LocalPlayer.CharacterAdded:Connect(function(chr)
  Character = chr
end)

function module.getplrgame()
  local HRP = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart")
  if HRP.Anchored == true then -- haha funny check to make sure they arent just on a spot and they are actually fucking playing (what a fucking retarded check :skull:)
    return
  end
  
  local found = ParkGame:FindFirstChild(LocalPlayer.Name,true) or GameplayGame:FindFirstChild(LocalPlayer.Name,true)
  if not found then
    return
  end
  return found.Parent.Parent.Parent, found.Parent.Parent.Parent.Name
end

return module
