-- Cliente: StarterGui/MorphGui (LocalScript dentro de uma ScreenGui)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local morphEvent = ReplicatedStorage:WaitForChild("MorphRequest")

-- cria UI simples via script (ou você pode fazer no Studio)
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "MorphGui"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 110)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundTransparency = 0.3

local textbox = Instance.new("TextBox", frame)
textbox.PlaceholderText = "Digite o username (ex: peso)"
textbox.Size = UDim2.new(1, -20, 0, 40)
textbox.Position = UDim2.new(0, 10, 0, 10)
textbox.ClearTextOnFocus = false

local morphBtn = Instance.new("TextButton", frame)
morphBtn.Text = "Morph"
morphBtn.Size = UDim2.new(0.5, -15, 0, 40)
morphBtn.Position = UDim2.new(0, 10, 0, 60)

local revertBtn = Instance.new("TextButton", frame)
revertBtn.Text = "Reverter"
revertBtn.Size = UDim2.new(0.5, -15, 0, 40)
revertBtn.Position = UDim2.new(0.5, 5, 0, 60)

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 18)
status.Position = UDim2.new(0, 10, 0, 86)
status.TextScaled = true
status.BackgroundTransparency = 1
status.Text = ""

morphBtn.MouseButton1Click:Connect(function()
    local name = textbox.Text
    morphEvent:FireServer(name)
end)

revertBtn.MouseButton1Click:Connect(function()
    morphEvent:FireServer("revert")
end)

-- recebe resposta do servidor (usamos o mesmo RemoteEvent para feedback; o servidor chama FireClient)
morphEvent.OnClientEvent:Connect(function(ok, message)
    status.Text = message or (ok and "OK" or "Erro")
    -- remove a mensagem depois de 4s
    delay(4, function() if status and status.Parent then status.Text = "" end end)
end)
