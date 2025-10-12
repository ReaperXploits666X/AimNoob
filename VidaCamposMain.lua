local p = game.Players.LocalPlayer

local function criarCoroaContador()
	local char = p.Character or p.CharacterAdded:Wait()
	local head = char:WaitForChild("Head")

	-- Billboard GUI visível para todos
	local gui = Instance.new("BillboardGui")
	gui.Name = "CoroaContadorGlobal"
	gui.Size = UDim2.new(0, 100, 0, 50)
	gui.StudsOffset = Vector3.new(0, 3.5, 0)
	gui.AlwaysOnTop = true
	gui.Parent = head

	-- Ícone da coroa
	local coroa = Instance.new("ImageLabel", gui)
	coroa.Size = UDim2.new(0, 40, 1, 0)
	coroa.Position = UDim2.new(0, 0, 0, 0)
	coroa.BackgroundTransparency = 1
	coroa.Image = "rbxassetid://7483871524" -- Ícone de coroa dourada

	-- Texto do contador
	local contador = Instance.new("TextLabel", gui)
	contador.Size = UDim2.new(0, 60, 1, 0)
	contador.Position = UDim2.new(0, 40, 0, 0)
	contador.BackgroundTransparency = 1
	contador.TextColor3 = Color3.fromRGB(255, 215, 0)
	contador.Font = Enum.Font.Fantasy
	contador.TextSize = 24
	contador.Text = "0"

	local kills = 0
	local mortos = {}

	-- Detecta mortes e atualiza contador
	game:GetService("RunService").Heartbeat:Connect(function()
		for _, jogador in pairs(game.Players:GetPlayers()) do
			if jogador ~= p and not mortos[jogador] then
				local char = jogador.Character
				if char then
					local h = char:FindFirstChildOfClass("Humanoid")
					if h and h.Health <= 0 then
						mortos[jogador] = true
						kills += 1
						contador.Text = tostring(kills)
					end
				end
			end
		end
	end)
end

-- Ativa ao entrar no jogo
p.CharacterAdded:Connect(function()
	wait(1)
	criarCoroaContador()
end)

-- Ativa se já estiver com personagem carregado
if p.Character then
	criarCoroaContador()
end
