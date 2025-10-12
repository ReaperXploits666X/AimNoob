local p = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
gui.Name = "BotaoMatarTodos"

local botao = Instance.new("TextButton", gui)
botao.Size = UDim2.new(0, 250, 0, 40)
botao.Position = UDim2.new(0.5, -125, 0.85, 0)
botao.Text = "Matar Todos"
botao.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
botao.TextColor3 = Color3.fromRGB(255, 255, 255)
botao.Font = Enum.Font.Fantasy
botao.TextSize = 18
botao.Active = true
botao.Draggable = true

local mortes = 0

botao.MouseButton1Click:Connect(function()
	mortes = 0
	for _, jogador in pairs(game.Players:GetPlayers()) do
		if jogador ~= p then
			local char = jogador.Character
			if char then
				local h = char:FindFirstChildOfClass("Humanoid")
				if h then
					h.Health = 0
					mortes += 1
				end
			end
		end
	end
	botao.Text = "Mortes: " .. mortes
	wait(2)
	botao.Text = "Matar Todos"
end)
