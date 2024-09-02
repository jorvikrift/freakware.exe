local module = {}

local fuckery = loadstring(game:HttpGet("https://raw.githubusercontent.com/jorvikrift/freakware.exe/main/util/mainmodule.lua"))()

local Players = fuckery.getservice(game:GetService("Players")) :: Players
local WS = fuckery.getservice(game:GetService("Workspace")) :: Workspace

local LocalPlayer = Players.LocalPlayer
local ParkGame = WS:FindFirstChild("MiniGames") or WS:WaitForChild("MiniGames")
local GameplayGame = WS:FindFirstChild("Games") or WS:WaitForChild("Games")

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
LocalPlayer.CharacterAdded:Connect(function(chr)
  if not chr then
      chr = LocalPlayer.CharacterAppearanceLoaded:Wait()
  end
  Character = chr
end)

function module.getplrgame()
  local HRP = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart")
  if HRP.Anchored == true and #ParkGame:GetChildren() > 0 then -- haha funny check to make sure they arent just on a spot and they are actually fucking playing (what a fucking retarded check :skull:)
    return
  end
  
  local found = ParkGame:FindFirstChild(LocalPlayer.Name,true) or GameplayGame:FindFirstChild(LocalPlayer.Name,true)
  if not found then
    return
  end
  return found.Parent.Parent.Parent, found.Parent.Parent.Parent.Name
end

function module.findplayerwithball()
  local gamee = module.getplrgame()
  if not gamee then
    return
  end
  local plrsingame = gamee.Replicated.Hitboxes
  local plrwithball
  for _, playerHitbox in ipairs(plrsingame:GetChildren()) do
    local plr = Players[playerHitbox.Name]
    if not plr or plr == LocalPlayer then
      continue
    end
    local chr = plr.Character
    if not chr then
      continue
    end
    local hasFb = chr:FindFirstChild("FootballCircle",true)
    if hasFb then
      plrwithball = plr
      break
    end
  end
  return plrwithball
end

function module.findlineofscrim()
  local gamee = module.getplrgame()
  if not gamee then
    return
  end
  
  return gamee.Replicated.ScrimmageLine.ScrimmageWall
end

function module.getendzones()
  local gamee = module.getplrgame()
  if not gamee then
    return
  end

  return gamee.Local.Endzones.NorthEndzone, gamee.Local.Endzones.SouthEndzone
end

function module.getplayerhitbox()
  local gamee = module.getplrgame()
  if not gamee then
    return
  end
  
  return gamee.Replicated.Hitboxes[LocalPlayer.Name]
end

return module
