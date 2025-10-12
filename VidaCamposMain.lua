local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()

local g = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
g.Name = "RegeneradorUniversal"

local b = Instance.new("TextButton", g)
b.Size = UDim2.new(0, 250, 0, 40)
b.Position = UDim2.new(0.5, -125, 0.85, 0)
b.Text = "Regenerar Tudo"
b.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
b.TextColor3 = Color3.fromRGB(255, 255, 255)
b.Font = Enum.Font.Fantasy
b.TextSize = 18
b.Active = true
b.Draggable = true

b.MouseButton1Click:Connect(function()
	for _, obj in pairs(c:GetDescendants()) do
		if obj:IsA("NumberValue") or obj:IsA("IntValue") or obj:IsA("FloatValue") then
			if obj.Value < 100000 then
				obj.Value = 100000 -- tenta restaurar qualquer valor de vida
			end
		end
	end
	b.Text = "Regenerado!"
	wait(1)
	b.Text = "Regenerar Tudo"
end)
