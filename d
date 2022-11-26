wait(1.2)
game.StarterGui:SetCore("SendNotification", {
Title = "rblxscripts.net"; -- the title 
Text = "Visit the website for 1,300+ Scripts"; -- what the text says 
Icon = "rbxassetid://11671602544"; -- the image if u want. 
Duration = 120; -- how long the notification should in secounds
})

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()

local window = library:Window("Phantom Forces")

window:Label("rblxscripts.net", Color3.fromRGB(127, 143, 166))


window:Button("Small Fov AIMBOT", function()
 getgenv().AIMBOT_SETTINGS = {
smoothness = 8,
FOV = 80,
VisibleCheck = true,
}

-- services
local players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- variables
local client = players.LocalPlayer
local shared = getrenv().shared
local camera = workspace.CurrentCamera
local mouseLocation = UserInputService.GetMouseLocation
local WorldToViewportPoint = camera.WorldToViewportPoint

-- modules
local replicationObject = shared.require("ReplicationObject")
local replicationInterface = shared.require("ReplicationInterface")

-- functions
local function isAlive(entry)
return replicationObject.isAlive(entry)
end

local function isVisible(p, ...)
if not getgenv().AIMBOT_SETTINGS.VisibleCheck then
return true
end

return #camera:GetPartsObscuringTarget({ p }, { camera, client.Character, workspace.Ignore, ... }) == 0
end

local function get_closest(fov: number)
local targetPos: Vector3 = nil
local magnitude: number = fov or math.huge
for _, player in pairs(players:GetPlayers()) do
if player == client or player.Team == client.Team then
continue
end

local entry = replicationInterface.getEntry(player)
local character = entry and replicationObject.getThirdPersonObject(entry)

if character and isAlive(entry) then
local body_parts = character:getCharacterHash()

local screen_pos, on_screen = WorldToViewportPoint(camera, body_parts.head.Position)
local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
local new_magnitude = (screen_pos_2D - mouseLocation(UserInputService)).Magnitude
if
on_screen
and new_magnitude < magnitude
and isVisible(body_parts.head.Position, body_parts.torso.Parent)
then
magnitude = new_magnitude
targetPos = body_parts.head.Position
end
end
end
return targetPos
end
local mouse = client:GetMouse()
local function aimAt(pos, smooth)
local targetPos = camera:WorldToScreenPoint(pos)
local mousePos = camera:WorldToScreenPoint(mouse.Hit.p)
mousemoverel((targetPos.X - mousePos.X) / smooth, (targetPos.Y - mousePos.Y) / smooth)
end
local circle = Drawing.new("Circle")
circle.Thickness = 2
circle.NumSides = 50
circle.Radius = 350
circle.Filled = false
circle.Transparency = 0.75
circle.Color = Color3.new(1, 0.5, 0)
circle.Visible = true

RunService.RenderStepped:Connect(function()
if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
local _pos = get_closest(getgenv().AIMBOT_SETTINGS.FOV)
if _pos then
aimAt(_pos, getgenv().AIMBOT_SETTINGS.smoothness)
end
end--rblxscripts.net
if circle.__OBJECT_EXISTS then
circle.Position = mouseLocation(UserInputService)
circle.Radius = getgenv().AIMBOT_SETTINGS.FOV
end
end)
end)


window:Button("Default Fov AIMBOT", function()
   getgenv().AIMBOT_SETTINGS = {
smoothness = 2,
FOV = 250,
VisibleCheck = true,
}

-- services
local players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- variables
local client = players.LocalPlayer
local shared = getrenv().shared
local camera = workspace.CurrentCamera
local mouseLocation = UserInputService.GetMouseLocation
local WorldToViewportPoint = camera.WorldToViewportPoint

-- modules
local replicationObject = shared.require("ReplicationObject")
local replicationInterface = shared.require("ReplicationInterface")

-- functions
local function isAlive(entry)
return replicationObject.isAlive(entry)
end

local function isVisible(p, ...)
if not getgenv().AIMBOT_SETTINGS.VisibleCheck then
return true
end

return #camera:GetPartsObscuringTarget({ p }, { camera, client.Character, workspace.Ignore, ... }) == 0
end

local function get_closest(fov: number)
local targetPos: Vector3 = nil
local magnitude: number = fov or math.huge
for _, player in pairs(players:GetPlayers()) do
if player == client or player.Team == client.Team then
continue
end

local entry = replicationInterface.getEntry(player)
local character = entry and replicationObject.getThirdPersonObject(entry)

if character and isAlive(entry) then
local body_parts = character:getCharacterHash()

local screen_pos, on_screen = WorldToViewportPoint(camera, body_parts.head.Position)
local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
local new_magnitude = (screen_pos_2D - mouseLocation(UserInputService)).Magnitude
if
on_screen
and new_magnitude < magnitude
and isVisible(body_parts.head.Position, body_parts.torso.Parent)
then
magnitude = new_magnitude
targetPos = body_parts.head.Position
end
end
end
return targetPos
end
local mouse = client:GetMouse()
local function aimAt(pos, smooth)
local targetPos = camera:WorldToScreenPoint(pos)
local mousePos = camera:WorldToScreenPoint(mouse.Hit.p)
mousemoverel((targetPos.X - mousePos.X) / smooth, (targetPos.Y - mousePos.Y) / smooth)
end
local circle = Drawing.new("Circle")
circle.Thickness = 2
circle.NumSides = 50
circle.Radius = 350
circle.Filled = false
circle.Transparency = 0.75
circle.Color = Color3.new(1, 0.5, 0)
circle.Visible = true

RunService.RenderStepped:Connect(function()
if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
local _pos = get_closest(getgenv().AIMBOT_SETTINGS.FOV)
if _pos then
aimAt(_pos, getgenv().AIMBOT_SETTINGS.smoothness)
end
end
if circle.__OBJECT_EXISTS then
circle.Position = mouseLocation(UserInputService)
circle.Radius = getgenv().AIMBOT_SETTINGS.FOV
end
end)
end)


window:Button("Highligh/Outline ESP", function()
   -- Settings --



local settings = {

   

   fillcolor = Color3.fromRGB(255, 255, 255);

   filltransparency = .75;

   

   outlinecolor = Color3.fromRGB(255, 255, 255);

   outlinetransparency = 0;

   

}



-- Script --



local plr = game:service'Players'.LocalPlayer

local highlights = Instance.new('Folder', game:service'CoreGui')



local function addhighlight(object)

   local highlight = Instance.new('Highlight', highlights)

   highlight.Adornee = object

   

   highlight.FillColor = settings.fillcolor

   highlight.FillTransparency = settings.filltransparency

   

   highlight.OutlineColor = settings.outlinecolor

   highlight.OutlineTransparency = settings.outlinetransparency

   

   highlight.Adornee.Changed:Connect(function()

       if not highlight.Adornee or not highlight.Adornee.Parent then

           highlight:Destroy()    

       end

   end)

   

   return highlight

end



local function addtoplayer(object)

   if object:IsA'Model' and object.Name == 'Player' and object.Parent.Name ~= tostring(plr.TeamColor) then

       addhighlight(object)

   end

end



for i,v in pairs(workspace.Players:GetDescendants()) do

   addtoplayer(v)

end



workspace.Players.DescendantAdded:Connect(function(v)

   addtoplayer(v)

end)
end)

window:Button("unnamed ESP", function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'),true))()
end)


window:Label("Open/Close GUI = P", Color3.fromRGB(127, 143, 166))
library:Keybind("P")

