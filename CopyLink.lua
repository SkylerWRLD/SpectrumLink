local SpectrumUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("Spectrum")
local PremiumSection = SpectrumUI:WaitForChild("Main"):WaitForChild("Sections"):WaitForChild("PremiumSection")

PremiumSection:WaitForChild("Bottom"):WaitForChild("Link"):WaitForChild("Button").MouseButton1Click:Connect(function()
	setclipboard("https://spectrumhub.site/purchase")
	PremiumSection.Bottom.Link.Button.Label.TextScaled = true
	PremiumSection.Bottom.Link.Button.Label.Text = "Copied Purchase Link"
	wait(2)
	PremiumSection.Bottom.Link.Button.Label.TextScaled = false
	PremiumSection.Bottom.Link.Button.Label.Text = "Copy Purchase Link"
	LinkButtonLabel.TextSize = 20
end)
