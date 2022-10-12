local SpectrumUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("Spectrum")
local SideBarFrame = SpectrumUI:WaitForChild("SideBar")
local SectionsFrame = SpectrumUI:WaitForChild("Sections")

for i, v in pairs(SideBarFrame.Container:GetChildren()) do
	if v:IsA("Frame") then
		v.Frame.TextButton.MouseButton1Click:Connect(function()
			for x, y in pairs(SectionsFrame:GetChildren()) do
				if y:IsA("Frame") then
					if v.Frame.TextLabel.Text ~= y.Name then
						y.Visible = false
						SectionsFrame:FindFirstChild(v.Frame.TextLabel.Text).Visible = true
					end
				end
			end
		end)
	end
end
