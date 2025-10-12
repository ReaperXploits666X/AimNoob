local p = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
gui.Name = "BotaoCuraInstantanea"

local botao = Instance.new("TextButton", gui)
botao.Size = UDim2.new(0, 250, 0, 40)
botao.Position = UDim2.new(0.5, -125, 0.85, 0)
botao.Text = "Cura Instantânea"
botao.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
botao.TextColor3 = Color3.fromRGB(255, 255, 255)
botao.Font = Enum.Font.Fantasy
botao.TextSize = 18
botao.Active = true
botao.Draggable = true

botao.MouseButton1Click:Connect(function()
	local c = p.Character or p.CharacterAdded:Wait()

	-- Cura explosiva em lote (20 threads simultâneas)
	for i = 1, 20 do
		task.spawn(function()
			for _, obj in pairs(c:GetDescendants()) do
				if obj:IsA("NumberValue") or obj:IsA("IntValue") or obj:IsA("FloatValue") then
					obj.Value = 999999
				end
			end
		end)
	end

	-- Feedback visual
	botao.Text = "Curado!"
	botao.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	wait(1.5)
	botao.Text = "Cura Instantânea"
	botao.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
end)
