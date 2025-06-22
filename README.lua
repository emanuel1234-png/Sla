-- Script de velocidade 500%
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function setSpeed(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 80 -- 500% da velocidade padrão (16 x 5)
end

if LocalPlayer.Character then
    setSpeed(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(setSpeed)
