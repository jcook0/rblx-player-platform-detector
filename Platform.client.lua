local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lp = game.Players.LocalPlayer
local event = ReplicatedStorage:WaitForChild("PlayerPlatform", 20)

local function getPlatform()
	if GuiService:IsTenFootInterface() then
		return "Console"
	elseif UserInputService.TouchEnabled and not UserInputService.MouseEnabled then
		return "Mobile"
	else
		return "Desktop"
	end
end

local platform = getPlatform()

event:FireServer(platform)

script:Destroy()
