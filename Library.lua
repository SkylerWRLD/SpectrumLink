local Library = {}

--// Services \\--

local InputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

--// Variables \\--

local DragToggle = nil
local DragSpeed = 0.25
local DragStart = nil
local StartPosition = nil
local PlayerMouse = game.Players.LocalPlayer:GetMouse()

--// Functions \\--

function RenameUIObjects(UI)
	for i, v in pairs(UI:GetDescendants()) do
		if v:IsA("UICorner") then
			v.Name = "Corner"
		elseif v:IsA("UIStroke") then
			v.Name = "Stroke"
		elseif v:IsA("UIListLayout") then
			v.Name = "List"
		elseif v:IsA("UIPadding") then
			v.Name = "Padding"
		end
	end
end

--// Main \\--

function Library:CreateHub()
	local Tab = {}
	
	local SpectrumUI = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame", SpectrumUI)
	local TopBarFrame = Instance.new("Frame", MainFrame)
	local SideBarFrame = Instance.new("Frame", MainFrame)
	local TopBarFillFrame = Instance.new("Frame", TopBarFrame)
	local SectionsFrame = Instance.new("Frame", MainFrame)
	local TopBarLineFrame  = Instance.new("Frame", TopBarFillFrame)
	local SideBarFixFrameOne = Instance.new("Frame", SideBarFrame)
	local SideBarFixFrameTwo = Instance.new("Frame", SideBarFrame)
	local SideBarLineFrame = Instance.new("Frame", SideBarFrame)
	local SideBarContainer = Instance.new("Frame", SideBarFrame)
	local MainCorner = Instance.new("UICorner", MainFrame)
	local TopBarCorner = Instance.new("UICorner", TopBarFrame)
	local SideBarCorner = Instance.new("UICorner", SideBarFrame)
	local MainStroke = Instance.new("UIStroke", MainFrame)
	local TopBarCloseButton = Instance.new("ImageButton", TopBarFrame)
	local TopBarMinimizeButton = Instance.new("ImageButton", TopBarFrame)
	local TopBarTitleLabel = Instance.new("TextLabel", TopBarFrame)
	local SideBarContainerList = Instance.new("UIListLayout", SideBarContainer)
	local SideBarContainerPadding = Instance.new("UIPadding", SideBarContainer)
	local SectionPattern = Instance.new("ImageLabel", SectionsFrame)
	
	SpectrumUI.Parent = game.Players.LocalPlayer.PlayerGui
	SpectrumUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
	
	MainFrame.Size = UDim2.new(0, 550, 0, 350)
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	
	TopBarFrame.Size = UDim2.new(1, 0, 0, 30)
	TopBarFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TopBarFrame.ZIndex = 2
	
	SideBarFrame.Size = UDim2.new(0, 140, 0, 319)
	SideBarFrame.Position = UDim2.new(0, 0, 0.543, 0)
	SideBarFrame.AnchorPoint = Vector2.new(0, 0.5)
	SideBarFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SideBarFrame.ZIndex = 2
	
	TopBarFillFrame.Size = UDim2.new(1, 0, 0, 11)
	TopBarFillFrame.Position = UDim2.new(0.5, 0, 1, 0)
	TopBarFillFrame.AnchorPoint = Vector2.new(0.5, 1)
	TopBarFillFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TopBarFillFrame.BorderSizePixel = 0
	
	TopBarLineFrame.Size = UDim2.new(1, 0, 0, 1)
	TopBarLineFrame.Position = UDim2.new(0.5, 0, 1, 0)
	TopBarLineFrame.AnchorPoint = Vector2.new(0.5, 1)
	TopBarLineFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TopBarLineFrame.BorderSizePixel = 0
	TopBarLineFrame.ZIndex = 2
	
	SideBarFixFrameOne.Size = UDim2.new(0, 11, 0, 79)
	SideBarFixFrameOne.Position = UDim2.new(0, 0, -0.004, 0)
	SideBarFixFrameOne.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SideBarFixFrameOne.BorderSizePixel = 0
	
	SideBarFixFrameTwo.Size = UDim2.new(0, 11, 1, 0)
	SideBarFixFrameTwo.Position = UDim2.new(1, 0, 0.5, 0)
	SideBarFixFrameTwo.AnchorPoint = Vector2.new(1, 0.5)
	SideBarFixFrameTwo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SideBarFixFrameTwo.BorderSizePixel = 0
	
	SideBarLineFrame.Size = UDim2.new(0, 1, 1, 0)
	SideBarLineFrame.Position = UDim2.new(1, 0, 0.501, 0)
	SideBarLineFrame.AnchorPoint = Vector2.new(1, 0.5)
	SideBarLineFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	SideBarLineFrame.BorderSizePixel = 0
	SideBarLineFrame.ZIndex = 2
	
	SectionsFrame.Size = UDim2.new(0, 410, 0, 320)
	SectionsFrame.Position = UDim2.new(1, 0, 1, 0)
	SectionsFrame.AnchorPoint = Vector2.new(1, 1)
	SectionsFrame.BackgroundTransparency = 1
	
	SectionPattern.Size = UDim2.new(1, 0, 1, 0)
	SectionPattern.Position = UDim2.new(0.5, 0, 0.5, 0)
	SectionPattern.AnchorPoint = Vector2.new(0.5, 0.5)
	SectionPattern.BackgroundTransparency = 1
	SectionPattern.ScaleType = Enum.ScaleType.Tile
	SectionPattern.TileSize = UDim2.new(0, 250, 0, 250)
	SectionPattern.ImageTransparency = 0.6
	SectionPattern.Image = "rbxassetid://2151741365"
	
	SideBarContainer.Size = UDim2.new(1, 0, 1, 0)
	SideBarContainer.BackgroundTransparency = 1

	MainStroke.Color = Color3.fromRGB(60, 60, 60)
	
	SideBarContainerList.HorizontalAlignment = Enum.HorizontalAlignment.Center
	SideBarContainerList.SortOrder = Enum.SortOrder.Name
	SideBarContainerPadding.PaddingTop = UDim.new(0, 2)
	
	MainCorner.CornerRadius = UDim.new(0, 6)
	TopBarCorner.CornerRadius = UDim.new(0, 5)
	SideBarCorner.CornerRadius = UDim.new(0, 5)
	
	TopBarCloseButton.Size = UDim2.new(0, 17, 0, 17)
	TopBarCloseButton.Position = UDim2.new(0.96, 0, 0.194, 0)
	TopBarCloseButton.ZIndex = 2
	TopBarCloseButton.Image = "rbxassetid://11230089155"
	TopBarCloseButton.BackgroundTransparency = 1
	
	TopBarMinimizeButton.Size = UDim2.new(0, 17, 0, 17)
	TopBarMinimizeButton.Position = UDim2.new(0.92, 0, 0.194, 0)
	TopBarMinimizeButton.ZIndex = 2
	TopBarMinimizeButton.Image = "rbxassetid://10664064072"
	TopBarMinimizeButton.BackgroundTransparency = 1
	
	TopBarTitleLabel.Size = UDim2.new(0, 130, 0, 35)
	TopBarTitleLabel.Position = UDim2.new(0.015, 0, 0.5, 0)
	TopBarTitleLabel.AnchorPoint = Vector2.new(0, 0.5)
	TopBarTitleLabel.BackgroundTransparency = 1
	TopBarTitleLabel.Font = Enum.Font.GothamBold
	TopBarTitleLabel.Text = "Spectrum Hub | V1.0"
	TopBarTitleLabel.TextSize = 12
	TopBarTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	TopBarTitleLabel.ZIndex = 2
	TopBarTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	
	local function UpdateInput(Input)
		local Delta = Input.Position - DragStart
		local Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		TweenService:Create(MainFrame, TweenInfo.new(DragSpeed), {Position = Position}):Play()
	end

	MainFrame.InputBegan:Connect(function(Input)
		if (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) then 
			DragToggle = true
			DragStart = Input.Position
			StartPosition = MainFrame.Position

			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					DragToggle = false
				end
			end)
		end
	end)

	InputService.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
			if DragToggle then
				UpdateInput(Input)
			end
		end
	end)
	
	function Tab:CreateTab(Info)
		local Section = {}
		local Tab = Instance.new("Frame", SideBarContainer)
		local TabFrame = Instance.new("Frame", Tab)
		local TabButton = Instance.new("TextButton", TabFrame)
		local Pattern = Instance.new("ImageLabel", TabFrame)
		local Label = Instance.new("TextLabel", TabFrame)
		local Corner = Instance.new("UICorner", TabFrame)
		local PatternCorner = Instance.new("UICorner", Pattern)
		local Stroke = Instance.new("UIStroke", TabFrame)
		
		Tab.Size = UDim2.new(0.93, 0, 0, 27)
		Tab.BackgroundTransparency = 1
		Tab.ZIndex = 3
		Tab.Name = Info.Name
		
		TabFrame.Size = UDim2.new(1, 0, 0, 23)
		TabFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TabFrame.BackgroundTransparency = 0.96
		TabFrame.ZIndex = 3
		
		TabButton.Size = UDim2.new(1, 0, 1, 0)
		TabButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabButton.AnchorPoint = Vector2.new(0.5, 0.5)
		TabButton.BackgroundTransparency = 1
		TabButton.Text = ""
		TabButton.ZIndex = 3
		
		Pattern.Size = UDim2.new(1, 0, 1, 0)
		Pattern.Position = UDim2.new(0.5, 0, 0.5, 0)
		Pattern.AnchorPoint = Vector2.new(0.5, 0.5)
		Pattern.BackgroundTransparency = 1
		Pattern.ImageColor3 = Color3.fromRGB(0, 0, 0)
		Pattern.ScaleType = Enum.ScaleType.Tile
		Pattern.TileSize = UDim2.new(0, 30, 0, 30)
		Pattern.ImageTransparency = 0.7
		Pattern.Image = "rbxassetid://300134974"
		Pattern.ZIndex = 3
		
		Label.Size = UDim2.new(0, 109, 0, 23)
		Label.Position = UDim2.new(0.5, 0, 0.5, 0)
		Label.AnchorPoint = Vector2.new(0.5, 0.5)
		Label.BackgroundTransparency = 1
		Label.Font = Enum.Font.GothamBold
		Label.Text = Info.Text
		Label.TextSize = 12
		Label.ZIndex = 4
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)

		Corner.CornerRadius = UDim.new(0, 3)
		PatternCorner.CornerRadius = UDim.new(0, 3)
		Stroke.Color = Color3.fromRGB(70, 70, 70)
		
		function Section:CreatePremium()
			local PremiumFrame = Instance.new("Frame", SectionsFrame)
			local BottomFrame = Instance.new("Frame", PremiumFrame)
			local DetailsFrame = Instance.new("Frame", PremiumFrame)
			local StatusFrame = Instance.new("Frame", PremiumFrame)
			local TitleFrame = Instance.new("Frame", PremiumFrame)
			local PremiumList = Instance.new("UIListLayout", PremiumFrame)
			local LinkFrame = Instance.new("Frame", BottomFrame)
			local PriceFrame = Instance.new("Frame", BottomFrame)
			local BottomFrameList = Instance.new("UIListLayout", BottomFrame)
			local PremiumPadding = Instance.new("UIPadding", PremiumFrame)
			local LinkCorner = Instance.new("UICorner", LinkFrame)
			local PriceCorner = Instance.new("UICorner", PriceFrame)
			local LinkStroke = Instance.new("UIStroke", LinkFrame)
			local PriceStroke = Instance.new("UIStroke", PriceFrame)
			local LinkPattern = Instance.new("ImageLabel", LinkFrame)
			local PricePattern = Instance.new("ImageLabel", PriceFrame)
			local LinkPatternCorner = Instance.new("UICorner", LinkPattern)
			local PricePatternCorner = Instance.new("UICorner", PricePattern)
			
			PremiumFrame.Size = UDim2.new(1, 0, 1, 0)
			PremiumFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			PremiumFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			PremiumFrame.BackgroundTransparency = 1
			
			BottomFrame.Size = UDim2.new(0, 410, 0, 40)
			BottomFrame.BackgroundTransparency = 1
			
			LinkFrame.Size = UDim2.new(0, 197, 0, 35)
			LinkFrame.AnchorPoint = Vector2.new(0.5, 1)
			LinkFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			LinkFrame.ZIndex = 3
			
			PriceFrame.Size = UDim2.new(0, 197, 0, 35)
			PriceFrame.AnchorPoint = Vector2.new(0.5, 1)
			PriceFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			PriceFrame.ZIndex = 3
			
			LinkPattern.Size = UDim2.new(1, 0, 1, 0)
			LinkPattern.Position = UDim2.new(0.5, 0, 0.5, 0)
			LinkPattern.AnchorPoint = Vector2.new(0.5, 0.5)
			LinkPattern.BackgroundTransparency = 1
			LinkPattern.ScaleType = Enum.ScaleType.Tile
			LinkPattern.TileSize = UDim2.new(0, 250, 0, 250)
			LinkPattern.ImageTransparency = 0.6
			LinkPattern.Image = "rbxassetid://2151741365"
			LinkPattern.ZIndex = 3
			
			PricePattern.Size = UDim2.new(1, 0, 1, 0)
			PricePattern.Position = UDim2.new(0.5, 0, 0.5, 0)
			PricePattern.AnchorPoint = Vector2.new(0.5, 0.5)
			PricePattern.BackgroundTransparency = 1
			PricePattern.ScaleType = Enum.ScaleType.Tile
			PricePattern.TileSize = UDim2.new(0, 250, 0, 250)
			PricePattern.ImageTransparency = 0.6
			PricePattern.Image = "rbxassetid://2151741365"
			PricePattern.ZIndex = 3
			
			BottomFrameList.Padding = UDim.new(0.015, 0)
			BottomFrameList.FillDirection = Enum.FillDirection.Horizontal
			BottomFrameList.HorizontalAlignment = Enum.HorizontalAlignment.Center
			
			LinkCorner.CornerRadius = UDim.new(0, 3)
			PriceCorner.CornerRadius = UDim.new(0, 3)
			LinkPatternCorner.CornerRadius = UDim.new(0, 3)
			PricePatternCorner.CornerRadius = UDim.new(0, 3)
			
			LinkStroke.Color = Color3.fromRGB(60, 60, 60)
			PriceStroke.Color = Color3.fromRGB(60, 60, 60)
			
			PremiumPadding.PaddingTop = UDim.new(0.015, 0)
		end
		
		function Section:CreateSection(Info)
			local SectionTable = {}
		end
		
		return Section
	end
	
	return Tab
end

return Library
