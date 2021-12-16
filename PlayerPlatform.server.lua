--[[ Services ]]--
local StarterPlayer = game:GetService("StarterPlayer")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--[[ Variables ]]--
local starterPlayerScripts = StarterPlayer:FindFirstChild("StarterPlayerScripts")

if not starterPlayerScripts then
	starterPlayerScripts = Instance.new("StarterPlayerScripts", StarterPlayer)
end

local event = Instance.new("RemoteEvent", ReplicatedStorage)
event.Name = "PlayerPlatform"

local client = script.Parent.Platform
client.Parent = starterPlayerScripts
client.Disabled = false

--[[ Server Event ]] --
local eventConnection = event.OnServerEvent:Connect(function(player, platformType)
	player:SetAttribute("Platform","Desktop")
	
	if not platformType then return end
	
	player:SetAttribute("Platform", platformType)
end)
