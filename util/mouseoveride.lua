if getgenv().cursoralreadyfuckingthere then
    return
end

getgenv().cursoralreadyfuckingthere = true

local fuckery = loadstring(game:HttpGet("https://raw.githubusercontent.com/jorvikrift/freakware.exe/main/util/mainmodule.lua"))()

local CG = fuckery.getservice(game:GetService("CoreGui")) :: CoreGui
local UIS = fuckery.getservice(game:GetService("UserInputService")) :: UserInputService
local PS = fuckery.getservice(game:GetService("Players")) :: Players
local RS = fuckery.getservice(game:GetService("RunService")) :: RunService

UIS.MouseIconEnabled = false

local LP = PS.LocalPlayer
local M = LP:GetMouse()

local SG = Instance.new("ScreenGui")
SG.Parent = CG
SG.Name = "thefuckingmouse"
SG.DisplayOrder = 1000
SG.IgnoreGuiInset = true

local IL = Instance.new("ImageLabel")
IL.Parent = SG
IL.Name = "ok, i fucking lied. THIS is the fucking mouse.."
IL.Image = "rbxassetid://442141180"
IL.Size = UDim2.new(0,55,0,55)
IL.ImageColor3 = Color3.fromRGB(170, 85, 235)
IL.BackgroundTransparency = 1
IL.BorderSizePixel = 0
IL.AnchorPoint = Vector2.new(0.5,0,0.5)

RS.RenderStepped:Connect(function()
    IL.Position = UDim2.fromOffset(M.X, M.Y)
end)
