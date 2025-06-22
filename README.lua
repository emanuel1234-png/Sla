local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function createESP(player)
    if player == LocalPlayer then return end
    player.CharacterAdded:Connect(function(character)
        local head = character:WaitForChild("Head", 5)
        if head and not head:FindFirstChild("NameEsp") then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NameEsp"
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 100, 0, 40)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true

            local nameLabel = Instance.new("TextLabel", billboard)
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.Text = player.Name
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextColor3 = Color3.new(1, 0, 0) -- Cor vermelha
            nameLabel.TextStrokeTransparency = 0
            nameLabel.Font = Enum.Font.SourceSansBold
            nameLabel.TextScaled = true

            billboard.Parent = head
        end
    end)
end

-- Aplica o ESP para todos os jogadores atuais
for _, player in pairs(Players:GetPlayers()) do
    createESP(player)
end

-- Aplica o ESP para novos jogadores
Players.PlayerAdded:Connect(function(player)
    createESP(player)
end)
