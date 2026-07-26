-- Jailbird Cheat - With Wall Check

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Jailbird Cheat",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by Grok",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "JailbirdConfig",
        FileName = "Settings"
    }
})

-- Settings
local AimbotEnabled = false
local AimbotMode = "Hold"
local AimKey = Enum.UserInputType.MouseButton2
local FOV = 140
local ShowFOV = false
local WallCheck = true   -- New

local ESPSettings = {
    Enabled = false,
    Boxes = false,
    CornerBoxes = false,
    Names = false,
    Health = false,
    Tracers = false,
    Distance = false,
    Color = Color3.fromRGB(255, 0, 0)
}

-- Functions
local function isEnemy(player)
    if not player.Team then return true end
    return player.Team ~= LocalPlayer.Team
end

local function isAlive(player)
    local char = player.Character
    if not char then return false end
    local hum = char:FindFirstChild("Humanoid")
    return hum and hum.Health > 0
end

-- Wall Check Function
local function canSee(target)
    if not WallCheck then return true end
    if not target.Character or not target.Character:FindFirstChild("Head") then return false end
    
    local origin = Camera.CFrame.Position
    local direction = (target.Character.Head.Position - origin)
    local ray = Ray.new(origin, direction)
    local hit, _ = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character, target.Character})
    
    return not hit
end

local function getBestTarget()
    local closest = nil
    local shortestDist = math.huge
    local screenCenter = Camera.ViewportSize / 2
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and isEnemy(player) and isAlive(player) and canSee(player) then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                    if dist < FOV and dist < shortestDist then
                        shortestDist = dist
                        closest = player
                    end
                end
            end
        end
    end
    return closest
end

-- Aimbot Loop
RunService.RenderStepped:Connect(function()
    if AimbotEnabled then
        local target = getBestTarget()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

-- Input Handling
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == AimKey then
        if AimbotMode == "Hold" then
            AimbotEnabled = true
        elseif AimbotMode == "Toggle" then
            AimbotEnabled = not AimbotEnabled
            Rayfield:Notify({
                Title = "Aimbot",
                Content = AimbotEnabled and "Enabled" or "Disabled",
                Duration = 1.5
            })
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == AimKey and AimbotMode == "Hold" then
        AimbotEnabled = false
    end
end)

-- FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.Color = Color3.new(0, 0, 0)
fovCircle.Transparency = 0.7
fovCircle.Filled = false

RunService.RenderStepped:Connect(function()
    fovCircle.Position = Camera.ViewportSize / 2
    fovCircle.Radius = FOV
    fovCircle.Visible = ShowFOV
end)

-- ESP System
local ESP = {}

local function createESP(player)
    if ESP[player] then return end
    
    local data = {
        Box = Drawing.new("Square"),
        Name = Drawing.new("Text"),
        Health = Drawing.new("Text"),
        Tracer = Drawing.new("Line"),
        Distance = Drawing.new("Text"),
        TL1 = Drawing.new("Line"), TL2 = Drawing.new("Line"),
        TR1 = Drawing.new("Line"), TR2 = Drawing.new("Line"),
        BL1 = Drawing.new("Line"), BL2 = Drawing.new("Line"),
        BR1 = Drawing.new("Line"), BR2 = Drawing.new("Line")
    }
    
    data.Box.Thickness = 2
    data.Box.Filled = false
    data.Box.Color = ESPSettings.Color
    
    data.Name.Size = 14
    data.Name.Center = true
    data.Name.Outline = true
    data.Name.Color = Color3.new(1, 1, 1)
    
    data.Health.Size = 13
    data.Health.Center = true
    data.Health.Outline = true
    data.Health.Color = Color3.new(0, 1, 0)
    
    data.Tracer.Thickness = 1
    data.Tracer.Color = ESPSettings.Color
    
    data.Distance.Size = 12
    data.Distance.Center = true
    data.Distance.Outline = true
    data.Distance.Color = Color3.new(1, 1, 1)
    
    for _, line in pairs({data.TL1, data.TL2, data.TR1, data.TR2, data.BL1, data.BL2, data.BR1, data.BR2}) do
        line.Thickness = 2
        line.Color = ESPSettings.Color
    end
    
    ESP[player] = data
end

local function removeESP(player)
    if ESP[player] then
        for _, drawing in pairs(ESP[player]) do
            drawing:Remove()
        end
        ESP[player] = nil
    end
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1.2)
        createESP(player)
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)

-- ESP Update
RunService.RenderStepped:Connect(function()
    for player, data in pairs(ESP) do
        if not ESPSettings.Enabled or not player.Character or not isAlive(player) or not isEnemy(player) then
            data.Box.Visible = false
            data.Name.Visible = false
            data.Health.Visible = false
            data.Tracer.Visible = false
            data.Distance.Visible = false
            data.TL1.Visible = false; data.TL2.Visible = false
            data.TR1.Visible = false; data.TR2.Visible = false
            data.BL1.Visible = false; data.BL2.Visible = false
            data.BR1.Visible = false; data.BR2.Visible = false
            continue
        end
        
        local root = player.Character:FindFirstChild("HumanoidRootPart") or player.Character:FindFirstChild("Torso")
        local head = player.Character:FindFirstChild("Head")
        local humanoid = player.Character:FindFirstChild("Humanoid")
        
        if root and head and humanoid then
            local vector, onScreen = Camera:WorldToViewportPoint(root.Position)
            
            if onScreen then
                local top = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1.5, 0))
                local bottom = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 2.5, 0))
                
                local size = Vector2.new(math.clamp(2000 / vector.Z, 10, 300), bottom.Y - top.Y)
                local pos = Vector2.new(vector.X - size.X / 2, top.Y)
                local cl = 12
                
                if ESPSettings.Boxes then
                    data.Box.Size = size
                    data.Box.Position = pos
                    data.Box.Visible = true
                else
                    data.Box.Visible = false
                end
                
                if ESPSettings.CornerBoxes then
                    data.TL1.From = pos
                    data.TL1.To = Vector2.new(pos.X, pos.Y + cl)
                    data.TL2.From = pos
                    data.TL2.To = Vector2.new(pos.X + cl, pos.Y)
                    
                    data.TR1.From = Vector2.new(pos.X + size.X, pos.Y)
                    data.TR1.To = Vector2.new(pos.X + size.X, pos.Y + cl)
                    data.TR2.From = Vector2.new(pos.X + size.X, pos.Y)
                    data.TR2.To = Vector2.new(pos.X + size.X - cl, pos.Y)
                    
                    data.BL1.From = Vector2.new(pos.X, pos.Y + size.Y)
                    data.BL1.To = Vector2.new(pos.X, pos.Y + size.Y - cl)
                    data.BL2.From = Vector2.new(pos.X, pos.Y + size.Y)
                    data.BL2.To = Vector2.new(pos.X + cl, pos.Y + size.Y)
                    
                    data.BR1.From = Vector2.new(pos.X + size.X, pos.Y + size.Y)
                    data.BR1.To = Vector2.new(pos.X + size.X, pos.Y + size.Y - cl)
                    data.BR2.From = Vector2.new(pos.X + size.X, pos.Y + size.Y)
                    data.BR2.To = Vector2.new(pos.X + size.X - cl, pos.Y + size.Y)
                    
                    data.TL1.Visible = true; data.TL2.Visible = true
                    data.TR1.Visible = true; data.TR2.Visible = true
                    data.BL1.Visible = true; data.BL2.Visible = true
                    data.BR1.Visible = true; data.BR2.Visible = true
                else
                    data.TL1.Visible = false; data.TL2.Visible = false
                    data.TR1.Visible = false; data.TR2.Visible = false
                    data.BL1.Visible = false; data.BL2.Visible = false
                    data.BR1.Visible = false; data.BR2.Visible = false
                end
                
                if ESPSettings.Names then
                    data.Name.Text = player.Name
                    data.Name.Position = Vector2.new(vector.X, top.Y - 18)
                    data.Name.Visible = true
                else
                    data.Name.Visible = false
                end
                
                if ESPSettings.Health then
                    data.Health.Text = math.floor(humanoid.Health) .. " HP"
                    data.Health.Position = Vector2.new(vector.X, bottom.Y + 5)
                    data.Health.Visible = true
                else
                    data.Health.Visible = false
                end
                
                if ESPSettings.Tracers then
                    data.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    data.Tracer.To = Vector2.new(vector.X, vector.Y)
                    data.Tracer.Visible = true
                else
                    data.Tracer.Visible = false
                end
                
                if ESPSettings.Distance then
                    local dist = (root.Position - Camera.CFrame.Position).Magnitude
                    data.Distance.Text = math.floor(dist) .. "m"
                    data.Distance.Position = Vector2.new(vector.X, bottom.Y + 20)
                    data.Distance.Visible = true
                else
                    data.Distance.Visible = false
                end
            else
                data.Box.Visible = false
                data.Name.Visible = false
                data.Health.Visible = false
                data.Tracer.Visible = false
                data.Distance.Visible = false
                data.TL1.Visible = false; data.TL2.Visible = false
                data.TR1.Visible = false; data.TR2.Visible = false
                data.BL1.Visible = false; data.BL2.Visible = false
                data.BR1.Visible = false; data.BR2.Visible = false
            end
        else
            data.Box.Visible = false
            data.Name.Visible = false
            data.Health.Visible = false
            data.Tracer.Visible = false
            data.Distance.Visible = false
            data.TL1.Visible = false; data.TL2.Visible = false
            data.TR1.Visible = false; data.TR2.Visible = false
            data.BL1.Visible = false; data.BL2.Visible = false
            data.BR1.Visible = false; data.BR2.Visible = false
        end
    end
end)

-- ==================== UI ====================
local CombatTab = Window:CreateTab("Combat")

CombatTab:CreateDropdown({
    Name = "Aim Key",
    Options = {"MouseButton1", "MouseButton2"},
    CurrentOption = {"MouseButton2"},
    Flag = "AimKey",
    Callback = function(Option)
        if Option[1] == "MouseButton1" then
            AimKey = Enum.UserInputType.MouseButton1
        else
            AimKey = Enum.UserInputType.MouseButton2
        end
    end
})

CombatTab:CreateDropdown({
    Name = "Aimbot Mode",
    Options = {"Hold", "Toggle"},
    CurrentOption = {"Hold"},
    Flag = "AimbotMode",
    Callback = function(Option)
        AimbotMode = Option[1]
        AimbotEnabled = false
    end
})

CombatTab:CreateToggle({
    Name = "Aimbot Enabled",
    CurrentValue = false,
    Flag = "Aimbot",
    Callback = function(Value)
        AimbotEnabled = Value
    end
})

CombatTab:CreateToggle({
    Name = "Wall Check",
    CurrentValue = true,
    Flag = "WallCheck",
    Callback = function(Value)
        WallCheck = Value
    end
})

CombatTab:CreateSlider({
    Name = "FOV",
    Range = {50, 400},
    Increment = 10,
    CurrentValue = 140,
    Flag = "FOV",
    Callback = function(Value)
        FOV = Value
    end
})

CombatTab:CreateSection("FOV Presets")

CombatTab:CreateButton({
    Name = "Small FOV (80)",
    Callback = function()
        FOV = 80
        Rayfield:Notify({Title = "FOV", Content = "Set to Small (80)", Duration = 2})
    end
})

CombatTab:CreateButton({
    Name = "Medium FOV (140)",
    Callback = function()
        FOV = 140
        Rayfield:Notify({Title = "FOV", Content = "Set to Medium (140)", Duration = 2})
    end
})

CombatTab:CreateButton({
    Name = "Large FOV (220)",
    Callback = function()
        FOV = 220
        Rayfield:Notify({Title = "FOV", Content = "Set to Large (220)", Duration = 2})
    end
})

CombatTab:CreateButton({
    Name = "Max FOV (350)",
    Callback = function()
        FOV = 350
        Rayfield:Notify({Title = "FOV", Content = "Set to Max (350)", Duration = 2})
    end
})

local VisualsTab = Window:CreateTab("Visuals")

VisualsTab:CreateToggle({
    Name = "Show FOV Circle",
    CurrentValue = false,
    Flag = "ShowFOV",
    Callback = function(Value)
        ShowFOV = Value
    end
})

VisualsTab:CreateToggle({
    Name = "ESP Enabled",
    CurrentValue = false,
    Flag = "ESPEnabled",
    Callback = function(Value)
        ESPSettings.Enabled = Value
    end
})

VisualsTab:CreateToggle({
    Name = "Normal Boxes",
    CurrentValue = false,
    Flag = "Boxes",
    Callback = function(Value)
        ESPSettings.Boxes = Value
    end
})

VisualsTab:CreateToggle({
    Name = "Corner Boxes",
    CurrentValue = false,
    Flag = "CornerBoxes",
    Callback = function(Value)
        ESPSettings.CornerBoxes = Value
    end
})

VisualsTab:CreateToggle({
    Name = "Names",
    CurrentValue = false,
    Flag = "Names",
    Callback = function(Value)
        ESPSettings.Names = Value
    end
})

VisualsTab:CreateToggle({
    Name = "Health",
    CurrentValue = false,
    Flag = "Health",
    Callback = function(Value)
        ESPSettings.Health = Value
    end
})

VisualsTab:CreateToggle({
    Name = "Tracers",
    CurrentValue = false,
    Flag = "Tracers",
    Callback = function(Value)
        ESPSettings.Tracers = Value
    end
})

VisualsTab:CreateToggle({
    Name = "Distance",
    CurrentValue = false,
    Flag = "Distance",
    Callback = function(Value)
        ESPSettings.Distance = Value
    end
})

Rayfield:Notify({
    Title = "Jailbird Cheat",
    Content = "Loaded with Wall Check",
    Duration = 5
})

print("Jailbird Cheat Loaded | Wall Check Added")
