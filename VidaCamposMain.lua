local p = game.Players.LocalPlayer
local g = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
local b = Instance.new("TextButton", g)
g.Name = "ILMOD"
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
local loopRodando = false

local function regenerar()
	while ativo do
		local c = p.Character or p.CharacterAdded:Wait()
		local h = c:FindFirstChildOfClass("Humanoid")
		if h then
			if h.Health < h.MaxHealth then
				h.Health = math.min(h.Health + 100000, h.MaxHealth)
			end
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
		if not loopRodando then
			loopRodando = true
			p.CharacterAdded:Connect(function()
				if ativo then regenerar() end
			end)
			regenerar()
		end
	else
		b.Text = "Ativar Regeneração"
		b.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		b.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)
