--[[
	Client Sided PIZZA! script maed by Dev
]]--

local Player = game:GetService("Players").LocalPlayer
local Pizza = Instance.new("Tool")
local Handle = Instance.new("Part")
local Mesh = Instance.new("SpecialMesh")
local DrinkSound = Instance.new("Sound")
local OpenSound = Instance.new("Sound")

-- Scripting/Giving properties <:money:1084566236563787806>

Pizza.Name = "Pizza !"
Pizza.ToolTip = "OMEGAD, PIZZA?!?!"
Pizza.TextureId = "http://www.roblox.com/asset/?id=22595979"
Pizza.Parent = Player.Backpack
Pizza.RequiresHandle = true
Pizza.CanBeDropped = false

Handle.Name = "Handle"
Handle.Size = Vector3.new(1, 0.8, 4)
Handle.Parent = Pizza
Handle.BrickColor = BrickColor.new("Dark stone grey")
Handle.Material = Enum.Material.Plastic
Handle.Reflectance = 0.4

Mesh.Name = "Mesh"
Mesh.MeshId = "http://www.roblox.com/asset/?id=172282788"
Mesh.Parent = Handle
Mesh.TextureId = "http://www.roblox.com/asset/?id=172282768"
Mesh.MeshType = Enum.MeshType.FileMesh
Mesh.Scale = Vector3.new(1,1,1)
Mesh.VertexColor = Vector3.new(1,1,1)

DrinkSound.Name = "DrinkSound"
OpenSound.Name = "OpenSound"
DrinkSound.Parent = Handle
OpenSound.Parent = Handle
DrinkSound.SoundId = "http://www.roblox.com/asset/?id=22593942"
OpenSound.SoundId = "http://www.roblox.com/asset/?id=22593428"

-- Scriptinz (REAL)

local Tool = Pizza;
enabled = true;
function onActivated()
	if not enabled  then
		return;
	end
	enabled = false;
	Tool.GripForward = Vector3.new(.995, -.0995, -8);
	Tool.GripPos = Vector3.new(-1.5, -0.9, 0.5);
	Tool.GripRight = Vector3.new(-1, 0, 0);
	Tool.GripUp = Vector3.new(0, 1, 0);
	Tool.Handle.DrinkSound:Play();
	wait(.8);
	local h = Tool.Parent:FindFirstChild("Humanoid");
	if (h ~= nil) then
		if (h.MaxHealth > h.Health + 1.6) then
			h.Health = h.Health + 1.6
		else	
			h.Health = h.MaxHealth
		end
	end
	Tool.GripForward = Vector3.new(0, 0, -1);
	Tool.GripPos = Vector3.new(0, 0, 0.5);
	Tool.GripRight = Vector3.new(1, 0, 0);
	Tool.GripUp = Vector3.new(0,1,0);
	enabled = true;
end
function onEquipped()
	Tool.Handle.OpenSound:play();
end
Tool.Activated:connect(onActivated);
Tool.Equipped:connect(onEquipped);