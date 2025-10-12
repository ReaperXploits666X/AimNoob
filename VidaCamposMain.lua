local p = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
gui.Name = "BotaoCuraToggle"

local botao = Instance.new("TextButton", gui)
botao.Size = UDim2.new(0, 250, 0, 40)
botao.Position = UDim2.new(0.5, -125, 0.85, 0)
botao.Text = "Ativar Cura Contínua"
botao.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
botao.TextColor3 = Color3.fromRGB(255, 255, 255)
botao.Font = Enum.Font.Fantasy
botao.TextSize = 18
botao.Active = true
botao.Draggable = true

local curando = false

local function iniciarCura()
	task.spawn(function()
		while curando do
			local char = p.Character
			if char then
				local h = char:FindFirstChildOfClass("Humanoid")
				if h and h.Health < h.MaxHealth then
					h.Health = math.min(h.Health + 5, h.MaxHealth)
				end
			end
			wait(1.5)
		end
	end)
end

botao.MouseButton1Click:Connect(function()
	curando = not curando

	if curando then
		botao.Text = "Cura Ativa"
		botao.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		iniciarCura()
	else
		botao.Text = "Ativar Cura Contínua"
		botao.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	end
end)

-- Garante que a cura continue após respawn
p.CharacterAdded:Connect(function()
	if curando then
		wait(1)
		iniciarCura()
	end
end)
