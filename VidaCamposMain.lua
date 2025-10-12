local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()

-- Interface do botão
local gui = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
gui.Name = "BotaoBlindado"

local botao = Instance.new("TextButton", gui)
botao.Size = UDim2.new(0, 250, 0, 40)
botao.Position = UDim2.new(0.5, -125, 0.85, 0)
botao.Text = "Modo Imortal"
botao.BackgroundColor3 = Color3.fromRGB(0, 170, 255) -- azul
botao.TextColor3 = Color3.fromRGB(255, 255, 255)
botao.Font = Enum.Font.Fantasy
botao.TextSize = 18
botao.Active = true
botao.Draggable = true

local ativo = false
local conexao = nil

botao.MouseButton1Click:Connect(function()
	ativo = not ativo
	if ativo then
		botao.Text = "Desativar Imortalidade"
		botao.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

		-- Regeneração turbo
		conexao = game:GetService("RunService").RenderStepped:Connect(function()
			local c = p.Character
			if c then
				for _, obj in pairs(c:GetDescendants()) do
					if obj:IsA("NumberValue") or obj:IsA("IntValue") or obj:IsA("FloatValue") then
						if obj.Value < 100000 then
							obj.Value = 100000
						end
					end
				end
			end
		end)

		-- Interceptação do evento de dano
		local replication = game:GetService("ReplicatedStorage"):FindFirstChild("Replication")
		if replication and replication:IsA("RemoteEvent") then
			replication.OnClientEvent:Connect(function(...)
				print("Interceptado: Replication bloqueado")
			end)
		end

	else
		botao.Text = "Modo Imortal"
		botao.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		if conexao then conexao:Disconnect() end
	end
end)
