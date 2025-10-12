local p = game.Players.LocalPlayer

-- Interface do botão
local gui = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
gui.Name = "BotaoUltraTurbo"

local botao = Instance.new("TextButton", gui)
botao.Size = UDim2.new(0, 250, 0, 40)
botao.Position = UDim2.new(0.5, -125, 0.85, 0)
botao.Text = "Ultra Regeneração"
botao.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
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
		botao.Text = "Desativar Regeneração"
		botao.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

		conexao = game:GetService("RunService").RenderStepped:Connect(function()
			local c = p.Character
			if c then
				for _, obj in pairs(c:GetDescendants()) do
					if obj:IsA("NumberValue") or obj:IsA("IntValue") or obj:IsA("FloatValue") then
						obj.Value = 100000 -- sem checagem, força direto
					end
				end
			end
		end)

	else
		botao.Text = "Ultra Regeneração"
		botao.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		if conexao then conexao:Disconnect() end
	end
end)
