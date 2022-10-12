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
	SpectrumUI.Name = "Spectrum"
	
	MainFrame.Size = UDim2.new(0, 550, 0, 350)
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainFrame.Name = "Main"
	
	TopBarFrame.Size = UDim2.new(1, 0, 0, 30)
	TopBarFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TopBarFrame.ZIndex = 2
	TopBarFrame.Name = "TopBar"
	
	SideBarFrame.Size = UDim2.new(0, 140, 0, 319)
	SideBarFrame.Position = UDim2.new(0, 0, 0.543, 0)
	SideBarFrame.AnchorPoint = Vector2.new(0, 0.5)
	SideBarFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SideBarFrame.ZIndex = 2
	SideBarFrame.Name = "SideBar"
	
	TopBarFillFrame.Size = UDim2.new(1, 0, 0, 11)
	TopBarFillFrame.Position = UDim2.new(0.5, 0, 1, 0)
	TopBarFillFrame.AnchorPoint = Vector2.new(0.5, 1)
	TopBarFillFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TopBarFillFrame.BorderSizePixel = 0
	TopBarFillFrame.Name = "Fill"
	
	TopBarLineFrame.Size = UDim2.new(1, 0, 0, 1)
	TopBarLineFrame.Position = UDim2.new(0.5, 0, 1, 0)
	TopBarLineFrame.AnchorPoint = Vector2.new(0.5, 1)
	TopBarLineFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TopBarLineFrame.BorderSizePixel = 0
	TopBarLineFrame.ZIndex = 2
	TopBarLineFrame.Name = "Line"
	
	SideBarFixFrameOne.Size = UDim2.new(0, 11, 0, 79)
	SideBarFixFrameOne.Position = UDim2.new(0, 0, -0.004, 0)
	SideBarFixFrameOne.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SideBarFixFrameOne.BorderSizePixel = 0
	SideBarFixFrameOne.Name = "Fix"
	
	SideBarFixFrameTwo.Size = UDim2.new(0, 11, 1, 0)
	SideBarFixFrameTwo.Position = UDim2.new(1, 0, 0.5, 0)
	SideBarFixFrameTwo.AnchorPoint = Vector2.new(1, 0.5)
	SideBarFixFrameTwo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SideBarFixFrameTwo.BorderSizePixel = 0
	SideBarFixFrameTwo.Name = "Fix"
	
	SideBarLineFrame.Size = UDim2.new(0, 1, 1, 0)
	SideBarLineFrame.Position = UDim2.new(1, 0, 0.501, 0)
	SideBarLineFrame.AnchorPoint = Vector2.new(1, 0.5)
	SideBarLineFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	SideBarLineFrame.BorderSizePixel = 0
	SideBarLineFrame.ZIndex = 2
	SideBarLineFrame.Name = "Line"
	
	SectionsFrame.Size = UDim2.new(0, 410, 0, 320)
	SectionsFrame.Position = UDim2.new(1, 0, 1, 0)
	SectionsFrame.AnchorPoint = Vector2.new(1, 1)
	SectionsFrame.BackgroundTransparency = 1
	SectionsFrame.Name = "Sections"
	
	SectionPattern.Size = UDim2.new(1, 0, 1, 0)
	SectionPattern.Position = UDim2.new(0.5, 0, 0.5, 0)
	SectionPattern.AnchorPoint = Vector2.new(0.5, 0.5)
	SectionPattern.BackgroundTransparency = 1
	SectionPattern.ScaleType = Enum.ScaleType.Tile
	SectionPattern.TileSize = UDim2.new(0, 250, 0, 250)
	SectionPattern.ImageTransparency = 0.6
	SectionPattern.Image = "rbxassetid://2151741365"
	SectionPattern.Name = "Pattern"
	
	SideBarContainer.Size = UDim2.new(1, 0, 1, 0)
	SideBarContainer.BackgroundTransparency = 1
	SideBarContainer.Name = "Container"

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
	TopBarCloseButton.Name = "Close"
	
	TopBarMinimizeButton.Size = UDim2.new(0, 17, 0, 17)
	TopBarMinimizeButton.Position = UDim2.new(0.92, 0, 0.194, 0)
	TopBarMinimizeButton.ZIndex = 2
	TopBarMinimizeButton.Image = "rbxassetid://10664064072"
	TopBarMinimizeButton.BackgroundTransparency = 1
	TopBarMinimizeButton.Name = "Minimize"
	
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
	TopBarTitleLabel.Name = "Title"
	
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
			local DetailsContainerFrame = Instance.new("Frame", DetailsFrame)
			local BottomFrameList = Instance.new("UIListLayout", BottomFrame)
			local DetailsContainerList = Instance.new("UIListLayout", DetailsContainerFrame)
			local PremiumPadding = Instance.new("UIPadding", PremiumFrame)
			local LinkCorner = Instance.new("UICorner", LinkFrame)
			local PriceCorner = Instance.new("UICorner", PriceFrame)
			local TitleCorner = Instance.new("UICorner", TitleFrame)
			local DetailsCorner = Instance.new("UICorner", DetailsFrame)
			local StatusCorner = Instance.new("UICorner", StatusFrame)
			local LinkStroke = Instance.new("UIStroke", LinkFrame)
			local PriceStroke = Instance.new("UIStroke", PriceFrame)
			local TitleStroke = Instance.new("UIStroke", TitleFrame)
			local DetailsStroke = Instance.new("UIStroke", DetailsFrame)
			local StatusStroke = Instance.new("UIStroke", StatusFrame)
			local LinkPattern = Instance.new("ImageLabel", LinkFrame)
			local PricePattern = Instance.new("ImageLabel", PriceFrame)
			local TitlePattern = Instance.new("ImageLabel", TitleFrame)
			local DetailsPattern = Instance.new("ImageLabel", DetailsFrame)
			local StatusPattern = Instance.new("ImageLabel", StatusFrame)
			local LinkPatternCorner = Instance.new("UICorner", LinkPattern)
			local PricePatternCorner = Instance.new("UICorner", PricePattern)
			local TitlePatternCorner = Instance.new("UICorner", TitlePattern)
			local DetailsPatternCorner = Instance.new("UICorner", DetailsPattern)
			local StatusPatternCorner = Instance.new("UICorner", StatusPattern)
			local LinkButton = Instance.new("TextButton", LinkFrame)
			local PremiumTitleLabel = Instance.new("TextLabel", TitleFrame)
			local DetailsTitleLabel = Instance.new("TextLabel", DetailsContainerFrame)
			local DetailsLabelOne = Instance.new("TextLabel", DetailsContainerFrame)
			local DetailsLabelTwo = Instance.new("TextLabel", DetailsContainerFrame)
			local DetailsLabelThree = Instance.new("TextLabel", DetailsContainerFrame)
			local DetailsLabelFour = Instance.new("TextLabel", DetailsContainerFrame)
			local StatusDetailsLabel = Instance.new("TextLabel", StatusFrame)
			local PremiumStatusLabel = Instance.new("TextLabel", StatusFrame)
			local PriceLabel = Instance.new("TextLabel", PriceFrame)
			local LinkButtonLabel = Instance.new("TextLabel", LinkButton)
			
			PremiumList.HorizontalAlignment = Enum.HorizontalAlignment.Center
			PremiumList.VerticalAlignment = Enum.VerticalAlignment.Center
			PremiumList.Padding = UDim.new(0.018, 0)
			PremiumList.SortOrder = Enum.SortOrder.LayoutOrder
			BottomFrameList.SortOrder = Enum.SortOrder.LayoutOrder
			BottomFrameList.Padding = UDim.new(0.015, 0)
			BottomFrameList.FillDirection = Enum.FillDirection.Horizontal
			BottomFrameList.HorizontalAlignment = Enum.HorizontalAlignment.Center
			DetailsContainerList.HorizontalAlignment = Enum.HorizontalAlignment.Center
			DetailsContainerList.VerticalAlignment = Enum.VerticalAlignment.Center
			DetailsContainerList.Padding = UDim.new(0.1, 0)
			DetailsContainerList.SortOrder = Enum.SortOrder.LayoutOrder

			PremiumFrame.Size = UDim2.new(1, 0, 1, 0)
			PremiumFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			PremiumFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			PremiumFrame.BackgroundTransparency = 1
			PremiumFrame.Name = "Premium"
			
			TitleFrame.Size = UDim2.new(0, 400, 0, 35)
			TitleFrame.AnchorPoint = Vector2.new(0.5, 0)
			TitleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			TitleFrame.ZIndex = 3
			TitleFrame.LayoutOrder = 1
			TitleFrame.Name = "Title"
			
			DetailsFrame.Size = UDim2.new(0, 400, 0, 135)
			DetailsFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			DetailsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			DetailsFrame.ZIndex = 3
			DetailsFrame.LayoutOrder = 2
			DetailsFrame.Name = "Details"
			
			StatusFrame.Size = UDim2.new(0, 400, 0, 88)
			StatusFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			StatusFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			StatusFrame.ZIndex = 3
			StatusFrame.LayoutOrder = 3
			StatusFrame.Name = "Status"
			
			BottomFrame.Size = UDim2.new(0, 410, 0, 40)
			BottomFrame.BackgroundTransparency = 1
			BottomFrame.Name = "Bottom"
			BottomFrame.LayoutOrder = 4
			
			LinkFrame.Size = UDim2.new(0, 197, 0, 35)
			LinkFrame.AnchorPoint = Vector2.new(0.5, 1)
			LinkFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			LinkFrame.ZIndex = 3
			LinkFrame.LayoutOrder = 2
			LinkFrame.Name = "Link"
			
			PriceFrame.Size = UDim2.new(0, 197, 0, 35)
			PriceFrame.AnchorPoint = Vector2.new(0.5, 1)
			PriceFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			PriceFrame.ZIndex = 3
			PriceFrame.LayoutOrder = 1
			PriceFrame.Name = "Price"
			
			LinkPattern.Size = UDim2.new(1, 0, 1, 0)
			LinkPattern.Position = UDim2.new(0.5, 0, 0.5, 0)
			LinkPattern.AnchorPoint = Vector2.new(0.5, 0.5)
			LinkPattern.BackgroundTransparency = 1
			LinkPattern.ScaleType = Enum.ScaleType.Tile
			LinkPattern.TileSize = UDim2.new(0, 250, 0, 250)
			LinkPattern.ImageTransparency = 0.6
			LinkPattern.Image = "rbxassetid://2151741365"
			LinkPattern.ZIndex = 3
			LinkPattern.Name = "Pattern"
			
			PricePattern.Size = UDim2.new(1, 0, 1, 0)
			PricePattern.Position = UDim2.new(0.5, 0, 0.5, 0)
			PricePattern.AnchorPoint = Vector2.new(0.5, 0.5)
			PricePattern.BackgroundTransparency = 1
			PricePattern.ScaleType = Enum.ScaleType.Tile
			PricePattern.TileSize = UDim2.new(0, 250, 0, 250)
			PricePattern.ImageTransparency = 0.6
			PricePattern.Image = "rbxassetid://2151741365"
			PricePattern.ZIndex = 3
			PricePattern.Name = "Pattern"
			
			TitlePattern.Size = UDim2.new(1, 0, 1, 0)
			TitlePattern.Position = UDim2.new(0.5, 0, 0.5, 0)
			TitlePattern.AnchorPoint = Vector2.new(0.5, 0.5)
			TitlePattern.BackgroundTransparency = 1
			TitlePattern.ScaleType = Enum.ScaleType.Tile
			TitlePattern.TileSize = UDim2.new(0, 250, 0, 250)
			TitlePattern.ImageTransparency = 0.6
			TitlePattern.Image = "rbxassetid://2151741365"
			TitlePattern.ZIndex = 3
			TitlePattern.Name = "Pattern"
			
			DetailsPattern.Size = UDim2.new(1, 0, 1, 0)
			DetailsPattern.Position = UDim2.new(0.5, 0, 0.5, 0)
			DetailsPattern.AnchorPoint = Vector2.new(0.5, 0.5)
			DetailsPattern.BackgroundTransparency = 1
			DetailsPattern.ScaleType = Enum.ScaleType.Tile
			DetailsPattern.TileSize = UDim2.new(0, 250, 0, 250)
			DetailsPattern.ImageTransparency = 0.6
			DetailsPattern.Image = "rbxassetid://2151741365"
			DetailsPattern.ZIndex = 3
			DetailsPattern.Name = "Pattern"
			
			StatusPattern.Size = UDim2.new(1, 0, 1, 0)
			StatusPattern.Position = UDim2.new(0.5, 0, 0.5, 0)
			StatusPattern.AnchorPoint = Vector2.new(0.5, 0.5)
			StatusPattern.BackgroundTransparency = 1
			StatusPattern.ScaleType = Enum.ScaleType.Tile
			StatusPattern.TileSize = UDim2.new(0, 250, 0, 250)
			StatusPattern.ImageTransparency = 0.6
			StatusPattern.Image = "rbxassetid://2151741365"
			StatusPattern.ZIndex = 3
			StatusPattern.Name = "Pattern"
			
			DetailsContainerFrame.Size = UDim2.new(1, 0, 1, 0)
			DetailsContainerFrame.BackgroundTransparency = 1
			
			PremiumTitleLabel.Size = UDim2.new(1, 0, 1, 0)
			PremiumTitleLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			PremiumTitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			PremiumTitleLabel.BackgroundTransparency = 1
			PremiumTitleLabel.Font = Enum.Font.GothamBold
			PremiumTitleLabel.Text = "Spectrum Premium"
			PremiumTitleLabel.TextSize = 20
			PremiumTitleLabel.ZIndex = 4
			PremiumTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			PremiumTitleLabel.Name = "Label"
			
			DetailsTitleLabel.Size = UDim2.new(1, 0, 0.1, 0)
			DetailsTitleLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			DetailsTitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			DetailsTitleLabel.BackgroundTransparency = 1
			DetailsTitleLabel.Font = Enum.Font.GothamBold
			DetailsTitleLabel.Text = "- Premium Benefits -"
			DetailsTitleLabel.TextSize = 18
			DetailsTitleLabel.ZIndex = 4
			DetailsTitleLabel.LayoutOrder = 1
			DetailsTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			DetailsTitleLabel.Name = "Title"
			
			DetailsLabelOne.Size = UDim2.new(1, 0, 0.1, 0)
			DetailsLabelOne.Position = UDim2.new(0.5, 0, 0.5, 0)
			DetailsLabelOne.AnchorPoint = Vector2.new(0.5, 0.5)
			DetailsLabelOne.BackgroundTransparency = 1
			DetailsLabelOne.Font = Enum.Font.GothamBold
			DetailsLabelOne.Text = "• Access To All Paid Script Features"
			DetailsLabelOne.TextSize = 18
			DetailsLabelOne.ZIndex = 4
			DetailsLabelOne.LayoutOrder = 2
			DetailsLabelOne.TextColor3 = Color3.fromRGB(255, 255, 255)
			DetailsLabelOne.Name = "LabelOne"
			
			DetailsLabelTwo.Size = UDim2.new(1, 0, 0.1, 0)
			DetailsLabelTwo.Position = UDim2.new(0.5, 0, 0.5, 0)
			DetailsLabelTwo.AnchorPoint = Vector2.new(0.5, 0.5)
			DetailsLabelTwo.BackgroundTransparency = 1
			DetailsLabelTwo.Font = Enum.Font.GothamBold
			DetailsLabelTwo.Text = "• Early Access To New Scripts/Features"
			DetailsLabelTwo.TextSize = 18
			DetailsLabelTwo.ZIndex = 4
			DetailsLabelTwo.LayoutOrder = 3
			DetailsLabelTwo.TextColor3 = Color3.fromRGB(255, 255, 255)
			DetailsLabelTwo.Name = "LabelTwo"
			
			DetailsLabelThree.Size = UDim2.new(1, 0, 0.1, 0)
			DetailsLabelThree.Position = UDim2.new(0.5, 0, 0.5, 0)
			DetailsLabelThree.AnchorPoint = Vector2.new(0.5, 0.5)
			DetailsLabelThree.BackgroundTransparency = 1
			DetailsLabelThree.Font = Enum.Font.GothamBold
			DetailsLabelThree.Text = "• Access To All Scripts"
			DetailsLabelThree.TextSize = 18
			DetailsLabelThree.ZIndex = 4
			DetailsLabelThree.LayoutOrder = 4
			DetailsLabelThree.TextColor3 = Color3.fromRGB(255, 255, 255)
			DetailsLabelThree.Name = "LabelThree"
			
			DetailsLabelFour.Size = UDim2.new(1, 0, 0.1, 0)
			DetailsLabelFour.Position = UDim2.new(0.5, 0, 0.5, 0)
			DetailsLabelFour.AnchorPoint = Vector2.new(0.5, 0.5)
			DetailsLabelFour.BackgroundTransparency = 1
			DetailsLabelFour.Font = Enum.Font.GothamBold
			DetailsLabelFour.Text = "• Special Discord Role"
			DetailsLabelFour.TextSize = 18
			DetailsLabelFour.ZIndex = 4
			DetailsLabelFour.LayoutOrder = 5
			DetailsLabelFour.TextColor3 = Color3.fromRGB(255, 255, 255)
			DetailsLabelFour.Name = "LabelFour"
			
			PremiumStatusLabel.Size = UDim2.new(1, 0, 0.25, 0)
			PremiumStatusLabel.Position = UDim2.new(0, 0, 0.08, 0)
			PremiumStatusLabel.AnchorPoint = Vector2.new(0, 0)
			PremiumStatusLabel.BackgroundTransparency = 1
			PremiumStatusLabel.Font = Enum.Font.GothamBold
			PremiumStatusLabel.Text = "You Don't Own Premium"
			PremiumStatusLabel.TextSize = 20
			PremiumStatusLabel.ZIndex = 4
			PremiumStatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
			PremiumStatusLabel.Name = "PremiumStatus"
			
			StatusDetailsLabel.Size = UDim2.new(1, 0, 0.5, 0)
			StatusDetailsLabel.Position = UDim2.new(0.5, 0, 0.65, 0)
			StatusDetailsLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			StatusDetailsLabel.BackgroundTransparency = 1
			StatusDetailsLabel.Font = Enum.Font.GothamBold
			StatusDetailsLabel.Text = "Upgrade From Guest To Premium To Unlock The Premium Benefits!"
			StatusDetailsLabel.TextScaled = true
			StatusDetailsLabel.ZIndex = 4
			StatusDetailsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			StatusDetailsLabel.Name = "Details"
			
			LinkButton.Size = UDim2.new(1, 0, 1, 0)
			LinkButton.BackgroundTransparency = 1
			LinkButton.ZIndex = 4
			LinkButton.Name = "Button"
			
			PriceLabel.Size = UDim2.new(0.855, 0, 1, 0)
			PriceLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			PriceLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			PriceLabel.BackgroundTransparency = 1
			PriceLabel.Font = Enum.Font.GothamBold
			PriceLabel.Text = "Price: 5$"
			PriceLabel.TextSize = 20
			PriceLabel.ZIndex = 4
			PriceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			PriceLabel.Name = "Label"
			
			LinkButtonLabel.Size = UDim2.new(0.855, 0, 1, 0)
			LinkButtonLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			LinkButtonLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			LinkButtonLabel.BackgroundTransparency = 1
			LinkButtonLabel.Font = Enum.Font.GothamBold
			LinkButtonLabel.Text = "Copy Purchase Link"
			LinkButtonLabel.TextSize = 20
			LinkButtonLabel.ZIndex = 4
			LinkButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			LinkButtonLabel.Name = "Label"
			
			LinkCorner.CornerRadius = UDim.new(0, 3)
			PriceCorner.CornerRadius = UDim.new(0, 3)
			TitleCorner.CornerRadius = UDim.new(0, 3)
			DetailsCorner.CornerRadius = UDim.new(0, 3)
			StatusCorner.CornerRadius = UDim.new(0, 3)
			LinkPatternCorner.CornerRadius = UDim.new(0, 3)
			PricePatternCorner.CornerRadius = UDim.new(0, 3)
			TitlePatternCorner.CornerRadius = UDim.new(0, 3)
			DetailsPatternCorner.CornerRadius = UDim.new(0, 3)
			StatusPatternCorner.CornerRadius = UDim.new(0, 3)
			
			LinkStroke.Color = Color3.fromRGB(60, 60, 60)
			PriceStroke.Color = Color3.fromRGB(60, 60, 60)
			TitleStroke.Color = Color3.fromRGB(60, 60, 60)
			DetailsStroke.Color = Color3.fromRGB(60, 60, 60)
			StatusStroke.Color = Color3.fromRGB(60, 60, 60)
			
			PremiumPadding.PaddingTop = UDim.new(0.015, 0)
		end
		
		function Section:CreateSection(Info)
			local SectionTable = {}
			
			local SectionFrame = Instance.new("Frame", SectionsFrame)
			local SectionContainer = Instance.new("ScrollingFrame", SectionFrame)
			
			SectionFrame.Size = UDim2.new(1, 0, 1, 0)
			SectionFrame.BackgroundTransparency = 1
			SectionFrame.Name = Info.Name
			SectionFrame.Visible = false
			
			SectionContainer.Size = UDim2.new(1, 0, 1, 0)
			SectionContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
			SectionContainer.AnchorPoint = Vector2.new(0.5, 0.5)
			SectionContainer.BackgroundTransparency = 1
			SectionContainer.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
			SectionContainer.BottomImage = "rbxassetid://10321579711"
			SectionContainer.MidImage = "rbxassetid://10321579711"
			SectionContainer.TopImage = "rbxassetid://10321579711"
			SectionContainer.ScrollBarImageColor3 = Color3.fromRGB(35, 35, 35)
			SectionContainer.ScrollBarThickness = 8
			SectionContainer.ZIndex = 2
		end
		
		return Section
	end
	
	for i, v in pairs(SideBarContainer:GetChildren()) do
		if v:IsA("Frame") then
			v.Frame.TextButton.MouseButton1Click:Connect(function()
				for x, y in pairs(SectionsFrame:GetChildren()) do
					if y.Name ~= v.Name then
						y.Visible = false
					else
						y.Visible = true
					end
				end
			end)
		end
	end
	
	return Tab
end

--test

return Library
