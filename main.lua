local lib = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local MainWindow = lib:CreateWindow({
   Name = "Orbit client | MvsSh",
   LoadingTitle = "Orbit | MvsSh",
   LoadingSubtitle = "Solara compatible exploits",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Orbit", 
      FileName = "source"
   },
   KeySystem = true,
   KeySettings = {
      Title = "Orbit Client",
      Subtitle = "Key System",
      Note = "Ask mont for the key if u get acces to the script",
      FileName = "Key",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"OrbitClient"}
   }
})
local BlatantTab = MainWindow:CreateTab("Blatant", 10653372143) 
local RenderTab = MainWindow:CreateTab("Render", 2790679413) 
local UtilityTab = MainWindow:CreateTab("Utility", 2790176032) 
local ScriptHubTab = MainWindow:CreateTab("Script Hub", 6022668955) 
local BlatantSection = BlatantTab:CreateSection("Blatant features")
local RenderSection = RenderTab:CreateSection("Render features")
local UtilitySection = UtilityTab:CreateSection("Utility features")
local ScriptHubSection = ScriptHubTab:CreateSection("Working scripts")

local function run(func) 
    func() 
end

local WalkspeedSlider = UtilityTab:CreateSlider({
   Name = "Walkspeed Changer",
   Range = {16, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "WalkSpeed",
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value 
   end,
})


local Zoom Unlocker = UtilityTab:CreateSlider({
   Name = "Zoom Unlocker",
   Range = {50, 1000},
   Increment = 1,
   Suffix = "Unlocker",
   CurrentValue = 50,
   Flag = "Zoom",
   Callback = function(Value)
      game.Players.LocalPlayer.CameraMaxZoomDistance = Value
   end,
})

local Zoom Unlocker = UtilityTab:CreateSlider({
   Name = "Fov Changer",
   Range = {50, 120},
   Increment = 1,
   Suffix = "Changer",
   CurrentValue = 50,
   Flag = "Fov",
   Callback = function(Value)
      game:GetService("Workspace").CurrentCamera.FieldOfView = Value
   end,
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local roles

local Esp = RenderTab:CreateToggle({
    Name = "Esp",
    CurrentValue = false,
    Flag = "Esp",
    Callback = function(Value)
        local function CreateHighlight()
            for i, v in pairs(Players:GetChildren()) do
                if v ~= LP and v.Character and not v.Character:FindFirstChild("Highlight") then
                    Instance.new("Highlight", v.Character)
                end
            end
        end
        local function UpdateHighlights()
            for _, v in pairs(Players:GetChildren()) do
                if v ~= LP and v.Character and v.Character:FindFirstChild("Highlight") then
                    local Highlight = v.Character:FindFirstChild("Highlight")
                    if v.Name == Sheriff and IsAlive(v) then
                        Highlight.FillColor = Color3.fromRGB(0, 0, 225)
                    elseif v.Name == Murder and IsAlive(v) then
                        Highlight.FillColor = Color3.fromRGB(225, 0, 0)
                    elseif v.Name == Hero and IsAlive(v) and not IsAlive(game.Players[Sheriff]) then
                        Highlight.FillColor = Color3.fromRGB(255, 250, 0)
                    else
                        Highlight.FillColor = Color3.fromRGB(0, 225, 0)
                    end
                end
            end
        end
        local function IsAlive(Player)
            for i, v in pairs(roles) do
                if Player.Name == i then
                    if not v.Killed and not v.Dead then
                        return true
                    else
                        return false
                    end
                end
            end
        end
        RunService.RenderStepped:connect(function()
            roles = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
            for i, v in pairs(roles) do
                if v.Role == "Murderer" then
                    Murder = i
                elseif v.Role == 'Sheriff' then
                    Sheriff = i
                elseif v.Role == 'Hero' then
                    Hero = i
                end
            end
            CreateHighlight()
            UpdateHighlights()
        end)
    end,
})
lib:Notify({
   Title = "Orbit client",
   Content = "[INFO]: Loaded orbit client BETA for solara",
   Duration = 3,
   Image = 6026568227
})
