local p = game.Players.LocalPlayer
local g = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
local b = Instance.new("TextButton", g)
g.Name = "RegenerarVidaGUI"
b.Size = UDim2.new(0, 200, 0, 40)
b.Position = UDim2.new(0.5, -100, 0.85, 0)
b.Text = "Ativar Regeneração"
b.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
b.TextColor3 = Color3.fromRGB(255, 255, 255)
b.Font = Enum.Font.Fantasy
b.TextSize = 18
b.Active = true
b.Draggable = true

local ativo = false

local function loopRegeneracao()
	while ativo do
		local c = p.Character or p.CharacterAdded:Wait()
		local h = c:FindFirstChildOfClass("Humanoid")
		if h and h.Health < h.MaxHealth then
			h.Health = h.MaxHealth
		end
		wait(0.05) -- regeneração super rápida
	end
end

b.MouseButton1Click:Connect(function()
	ativo = not ativo
	if ativo then
		b.Text = "Desativar Regeneração"
		b.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		b.TextColor3 = Color3.fromRGB(0, 0, 0)
		p.CharacterAdded:Connect(function()
			if ativo then loopRegeneracao() end
		end)
		loopRegeneracao()
	else
		b.Text = "Ativar Regeneração"
		b.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		b.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)
