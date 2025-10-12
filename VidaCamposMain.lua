local p = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
gui.Name = "PainelDoDono"

-- Função de regeneração turbo
local function regenerar()
	local c = p.Character
	if c then
		for _, obj in pairs(c:GetDescendants()) do
			if obj:IsA("NumberValue") or obj:IsA("IntValue") or obj:IsA("FloatValue") then
				obj.Value = 100000
			end
		end
	end
end

-- Botão 1: Regeneração turbo
local b1 = Instance.new("TextButton", gui)
b1.Size = UDim2.new(0, 250, 0, 40)
b1.Position = UDim2.new(0.5, -125, 0.75, 0)
b1.Text = "Regenerar Turbo"
b1.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
b1.TextColor3 = Color3.fromRGB(255, 255, 255)
b1.Font = Enum.Font.Fantasy
b1.TextSize = 18
b1.Draggable = true

local ativo1 = false
local conexao1 = nil

b1.MouseButton1Click:Connect(function()
	ativo1 = not ativo1
	if ativo1 then
		b1.Text = "Desativar Regeneração"
		b1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		conexao1 = game:GetService("RunService").RenderStepped:Connect(regenerar)
	else
		b1.Text = "Regenerar Turbo"
		b1.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		if conexao1 then conexao1:Disconnect() end
	end
end)

-- Botão 2: Interceptar dano
local b2 = Instance.new("TextButton", gui)
b2.Size = UDim2.new(0, 250, 0, 40)
b2.Position = UDim2.new(0.5, -125, 0.82, 0)
b2.Text = "Interceptar Dano"
b2.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
b2.TextColor3 = Color3.fromRGB(255, 255, 255)
b2.Font = Enum.Font.Fantasy
b2.TextSize = 18
b2.Draggable = true

b2.MouseButton1Click:Connect(function()
	local replication = game:GetService("ReplicatedStorage"):FindFirstChild("Replication")
	if replication and replication:IsA("RemoteEvent") then
		replication.OnClientEvent:Connect(function(...)
			print("Interceptado: Replication bloqueado")
		end)
	end
	b2.Text = "Dano Interceptado"
	b2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
end)

-- Botão 3: Rastrear eventos
local b3 = Instance.new("TextButton", gui)
b3.Size = UDim2.new(0, 250, 0, 40)
b3.Position = UDim2.new(0.5, -125, 0.89, 0)
b3.Text = "Rastrear Eventos"
b3.BackgroundColor3 = Color3.fromRGB(85, 0, 255)
b3.TextColor3 = Color3.fromRGB(255, 255, 255)
b3.Font = Enum.Font.Fantasy
b3.TextSize = 18
b3.Draggable = true

b3.MouseButton1Click:Connect(function()
	for _, obj in pairs(game:GetDescendants()) do
		if obj:IsA("RemoteEvent") then
			obj.OnClientEvent:Connect(function()
				print("Evento detectado: " .. obj:GetFullName())
			end)
		elseif obj:IsA("RemoteFunction") then
			obj.OnClientInvoke = function()
				print("Função detectada: " .. obj:GetFullName())
			end
		end
	end
	b3.Text = "Eventos Monitorando"
	b3.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
end)
