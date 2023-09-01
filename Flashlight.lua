--[[
	Client Sided Flashlight script maed by Dev
]]--

local Player = game:GetService("Players").LocalPlayer
local Flashlight = Instance.new("Tool")
local Handle = Instance.new("Part")
local Mesh = Instance.new("SpecialMesh")
local SpotLight = Instance.new("SpotLight")
local Sound = Instance.new("Sound")
local equip = Instance.new("Sound")

-- Scripting/Giving properties :money:

Flashlight.Name = "Flashlight"
Flashlight.ToolTip = "u need dat light when dark!"
Flashlight.Parent = Player.Backpack
Flashlight.RequiresHandle = true
Flashlight.CanBeDropped = false

Handle.Name = "Handle"
Handle.Size = Vector3.new(0.4, 0.6, 2.4)
Handle.Parent = Flashlight
Handle.BrickColor = BrickColor.new("Dark stone grey")
Handle.Material = Enum.Material.Plastic
Handle.Reflectance = 0.4

SpotLight.Name = "SpotLight"
SpotLight.Parent = Handle
SpotLight.Angle = 90
SpotLight.Brightness = 3
SpotLight.Color = Color3.new(1,1,1)
SpotLight.Face = Enum.NormalId.Front

Mesh.Name = "Mesh"
Mesh.MeshId = "http://www.roblox.com/asset/?id=115955313"
Mesh.Parent = Handle
Mesh.TextureId = "http://www.roblox.com/asset?id=115984370"
Mesh.MeshType = Enum.MeshType.FileMesh
Mesh.Scale = Vector3.new(0.7,0.7,0.7)
Mesh.VertexColor = Vector3.new(1,1,1)

Sound.Name = "Sound"
equip.Name = "equip"
Sound.Parent = Handle
equip.Parent = Handle
Sound.SoundId = "rbxassetid://198914875"
equip.SoundId = "rbxassetid://4458750140"

-- Scriptinz (REAL)

Flashlight.Activated:Connect(function()
	if Flashlight.Handle.SpotLight.Enabled == true then
		Flashlight.Handle.SpotLight.Enabled = false
		Flashlight.Handle.Sound:Play()
	else
		Flashlight.Handle.SpotLight.Enabled = true
		Flashlight.Handle.Sound:Play()
	end
end)

Flashlight.Equipped:Connect(function()
	Flashlight.Handle.SpotLight.Enabled = false
	Flashlight.Handle.equip:Play()
end)

Flashlight.Unequipped:Connect(function()
	Flashlight.Handle.equip:Play()
end)
