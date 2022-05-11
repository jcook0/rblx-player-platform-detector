local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local camera = workspace:WaitForChild("CurrentCamera")
local event = ReplicatedStorage:WaitForChild("PlayerPlatform", 20)

local function getPlatform()
	if GuiService:IsTenFootInterface() then
		return "Console"
	elseif UserInputService.TouchEnabled and not UserInputService.MouseEnabled then
        	local DeviceSize = camera.ViewportSize
		if DeviceSize.Y > 600 then
			return "Tablet"
		else
			return "Phone"
		end
	else
		return "Desktop"
	end
end

local platform = getPlatform()
event:FireServer(platform)
