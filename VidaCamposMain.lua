local p = game.Players.LocalPlayer
local g = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
g.Name = "RegeneradorAgressivo"

local b = Instance.new("TextButton", g)
b.Size = UDim2.new(0, 250, 0, 40)
b.Position = UDim2.new(0.5, -125, 0.85, 0)
b.Text = "Ativar Regeneração Agressiva"
b.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
b.TextColor3 = Color3.fromRGB(255, 255, 255)
b.Font = Enum.Font.Fantasy
b.TextSize = 18
b.Active = true
b.Draggable = true

local ativo = false

b.MouseButton1Click:Connect(function()
	ativo = not ativo
	if ativo then
		b.Text = "Desativar Regeneração"
		b.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		b.TextColor3 = Color3.fromRGB(0, 0, 0)

		game:GetService("RunService").RenderStepped:Connect(function()
			if not ativo then return end
			local c = p.Character or p.CharacterAdded:Wait()
			for _, obj in pairs(c:GetDescendants()) do
				if obj:IsA("NumberValue") or obj:IsA("IntValue") or obj:IsA("FloatValue") then
					if obj.Value < 100000 then
						obj.Value = 100000
					end
				end
			end
		end)
	else
		b.Text = "Ativar Regeneração Agressiva"
		b.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		b.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)
