local SpectrumUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("Spectrum")
local PremiumSection = SpectrumUI:WaitForChild("Main"):WaitForChild("Sections"):WaitForChild("PremiumSection")

PremiumSection:WaitForChild("Bottom"):WaitForChild("Link"):WaitForChild("Button").MouseButton1Click:Connect(function()
	setclipboard("https://spectrumhub.site/purchase")
	PremiumSection:WaitForChild("Bottom"):WaitForChild("Link"):WaitForChild("Button"):WaitForChild("Label").TextSize = 20
	PremiumSection:WaitForChild("Bottom"):WaitForChild("Link"):WaitForChild("Button"):WaitForChild("Label").Text = "Copied Link"
	wait(2)
	PremiumSection:WaitForChild("Bottom"):WaitForChild("Link"):WaitForChild("Button"):WaitForChild("Label").TextSize = 20
	PremiumSection:WaitForChild("Bottom"):WaitForChild("Link"):WaitForChild("Button"):WaitForChild("Label").Text = "Copy Purchase Link"
end)
