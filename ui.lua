local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Mouse = game.Players.LocalPlayer:GetMouse()

local Blacklist = {Enum.KeyCode.Unknown, Enum.KeyCode.CapsLock, Enum.KeyCode.Escape, Enum.KeyCode.Tab, Enum.KeyCode.Return, Enum.KeyCode.Backspace, Enum.KeyCode.Space, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D}

if CoreGui:FindFirstChild("Shaman") then
    CoreGui.Shaman:Destroy()
    CoreGui.Tooltips:Destroy()
end

local function CheckTable(table)
    local i = 0
    for _,v in pairs(table) do
        i = i + 1
    end
    return i
end

local TabSelected = nil
local EditOpened = false
local ColorElements = {}

task.spawn(function()
while true do
if EditOpened and CheckTable(ColorElements) > 0 then
local hue = tick() % 7 / 7
local color = Color3.fromHSV(hue, 1, 1)

for frame, v in pairs(ColorElements) do
    if v.Enabled then
        if frame.ClassName == "Frame" then
        frame.BackgroundColor3 = color
        else
        frame.ImageColor3 = color
        end
    end
end
end
task.wait()
end
end)

local library = {
    Flags = {}
}

local request = syn and syn.request or http and http.request or http_request or request or httprequest
local getcustomasset = getcustomasset or getsynasset
local isfolder = isfolder or syn_isfolder or is_folder
local makefolder = makefolder or make_folder or createfolder or create_folder

if not isfolder("Shaman") then
local download = Instance.new("ScreenGui")
download.Name = "Download"
download.Enabled = true
download.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
download.Parent = CoreGui

local dMain = Instance.new("Frame")
dMain.Name = "DMain"
dMain.AnchorPoint = Vector2.new(0.5, 0.5)
dMain.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
dMain.Position = UDim2.new(0.5, 0, 0.486, 0)
dMain.Size = UDim2.new(0, 285, 0, 77)
dMain.Parent = download

local dUICorner = Instance.new("UICorner")
dUICorner.Name = "DUICorner"
dUICorner.CornerRadius = UDim.new(0, 5)
dUICorner.Parent = dMain

local dUIStroke = Instance.new("UIStroke")
dUIStroke.Name = "DUIStroke"
dUIStroke.Color = Color3.fromRGB(45, 45, 45)
dUIStroke.Parent = dMain

local dTopbar = Instance.new("Frame")
dTopbar.Name = "DTopbar"
dTopbar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
dTopbar.Size = UDim2.new(0, 285, 0, 31)
dTopbar.Parent = dMain

local dUICorner1 = Instance.new("UICorner")
dUICorner1.Name = "DUICorner"
dUICorner1.CornerRadius = UDim.new(0, 5)
dUICorner1.Parent = dTopbar

local dFix = Instance.new("Frame")
dFix.Name = "DFix"
dFix.AnchorPoint = Vector2.new(0.5, 1)
dFix.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
dFix.BorderSizePixel = 0
dFix.Position = UDim2.new(0.5, 0, 1.02, 0)
dFix.Size = UDim2.new(0, 284, 0, 1)
dFix.ZIndex = 2
dFix.Parent = dTopbar

local dTitleText = Instance.new("TextLabel")
dTitleText.Name = "DTitleText"
dTitleText.Font = Enum.Font.GothamBold
dTitleText.Text = "Downloading Assets"
dTitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
dTitleText.TextSize = 12
dTitleText.BackgroundColor3 = Color3.fromRGB(237, 237, 237)
dTitleText.BackgroundTransparency = 1
dTitleText.Position = UDim2.new(0.00132, 0, 0, 0)
dTitleText.Size = UDim2.new(0, 284, 0, 30)
dTitleText.ZIndex = 2
dTitleText.Parent = dTopbar

local dText = Instance.new("TextLabel")
dText.Name = "DText"
dText.Font = Enum.Font.GothamBold
dText.Text = "Loading..."
dText.TextColor3 = Color3.fromRGB(237, 237, 237)
dText.TextSize = 11
dText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dText.BackgroundTransparency = 1
dText.Position = UDim2.new(0.00132, 0, 0.39, 0)
dText.Size = UDim2.new(0, 284, 0, 46)
dText.Parent = dMain
    
makefolder("Shaman")
    
local Circle = request({Url = "https://raw.githubusercontent.com/Rain-Design/Icons/main/Circle.png", Method = "GET"})
writefile("Shaman/Circle.png", Circle.Body)
dText.Text = "Downloaded: Circle.png"
    
local ColorDropper = request({Url = "https://raw.githubusercontent.com/Rain-Design/Icons/main/ColorDropper.png", Method = "GET"})
writefile("Shaman/ColorDropper.png", ColorDropper.Body)
dText.Text = "Downloaded: ColorDropper.png"

local Close = request({Url = "https://raw.githubusercontent.com/Rain-Design/Icons/main/Close.png", Method = "GET"})
writefile("Shaman/Close.png", Close.Body)
dText.Text = "Downloaded: Close.png"

local CollapseArrow = request({Url = "https://raw.githubusercontent.com/Rain-Design/Icons/main/CollapseArrow.png", Method = "GET"})
writefile("Shaman/CollapseArrow.png", CollapseArrow.Body)
dText.Text = "Downloaded: CollapseArrow.png"
    
local RadioButton = request({Url = "https://raw.githubusercontent.com/Rain-Design/Icons/main/RadioButton.png", Method = "GET"})
writefile("Shaman/RadioButton.png", RadioButton.Body)
dText.Text = "Downloaded: RadioButton.png"
    
local RadioOuter = request({Url = "https://raw.githubusercontent.com/Rain-Design/Icons/main/RadioOuter.png", Method = "GET"})
writefile("Shaman/RadioOuter.png", RadioOuter.Body)
dText.Text = "Downloaded: RadioOuter.png"
    
local RadioInner = request({Url = "https://raw.githubusercontent.com/Rain-Design/Icons/main/RadioInner.png", Method = "GET"})
writefile("Shaman/RadioInner.png", RadioInner.Body)
dText.Text = "Downloaded: RadioInner.png"

download:Destroy()
end

function library:GetXY(GuiObject)
	local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
	local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
	return Px/Max, Py/May
end

function library:Window(Info)
Info.Text = Info.Text or "Shaman"
Info.BackgroundImage = Info.BackgroundImage or nil -- NEW: Background Image Support

local window = {}

local shamanScreenGui = Instance.new("ScreenGui")
shamanScreenGui.Name = "Shaman"
shamanScreenGui.Parent = CoreGui

local tooltipScreenGui = Instance.new("ScreenGui")
tooltipScreenGui.Name = "Tooltips"
tooltipScreenGui.Parent = CoreGui

local function Tooltip(text)
local tooltip = Instance.new("Frame")
tooltip.Name = "Tooltip"
tooltip.AnchorPoint = Vector2.new(0.5, 0)
tooltip.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
tooltip.BackgroundTransparency = 0.2
tooltip.Visible = false
tooltip.Position = UDim2.new(0.352, 0, 0.0741, 0)
tooltip.Size = UDim2.new(0, 100, 0, 19)
tooltip.ZIndex = 5
tooltip.Parent = tooltipScreenGui

local newuICorner = Instance.new("UICorner")
newuICorner.Name = "UICorner"
newuICorner.CornerRadius = UDim.new(0, 3)
newuICorner.Parent = tooltip

local newuIStroke = Instance.new("UIStroke")
newuIStroke.Name = "UIStroke"
newuIStroke.Color = Color3.fromRGB(255, 255, 255)
newuIStroke.Transparency = 0.7
newuIStroke.Parent = tooltip

local tooltipText = Instance.new("TextLabel")
tooltipText.Name = "TooltipText"
tooltipText.Font = Enum.Font.GothamBold
tooltipText.Text = text
tooltipText.TextColor3 = Color3.fromRGB(230, 230, 230)
tooltipText.TextSize = 11
tooltipText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tooltipText.BackgroundTransparency = 1
tooltipText.Size = UDim2.new(0, 100, 0, 19)
tooltipText.Parent = tooltip
tooltipText.ZIndex = 6

local TextBounds = tooltipText.TextBounds

tooltip.Size = UDim2.new(0, TextBounds.X + 10, 0, 19)
tooltipText.Size = UDim2.new(0, TextBounds.X + 10, 0, 19)

return tooltip
end

local function AddTooltip(element, text)
    local Tooltip = Tooltip(text)
    local Hovered = false
    
    local function Update()
    local MousePos = UserInputService:GetMouseLocation()
    local Viewport = workspace.CurrentCamera.ViewportSize
    
    Tooltip.Position = UDim2.new(MousePos.X / Viewport.X, 0, MousePos.Y / Viewport.Y, 0) + UDim2.new(0,0,0,-43)
    end

    element.MouseEnter:Connect(function()
        Hovered = true
        task.wait(.5)
        if Hovered then
        Tooltip.Visible = true
        end
    end)
    
    element.MouseLeave:Connect(function()
        Hovered = false
        Tooltip.Visible = false
    end)
    
    element.MouseMoved:Connect(function()
        Update()
    end)
end

-- MAIN FRAME (GLASS BASE)
local main = Instance.new("Frame")
main.Name = "Main"
main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
main.BackgroundTransparency = 0.15
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Position = UDim2.new(0.361, 0, 0.308, 0)
main.Size = UDim2.new(0, 450, 0, 321)
main.Parent = shamanScreenGui

-- ADD BACKGROUND IMAGE
if Info.BackgroundImage then
    local bgImage = Instance.new("ImageLabel")
    bgImage.Name = "BackgroundImage"
    bgImage.Image = Info.BackgroundImage
    bgImage.ScaleType = Enum.ScaleType.Crop
    bgImage.Size = UDim2.new(1, 0, 1, 0)
    bgImage.BackgroundTransparency = 1
    bgImage.ZIndex = 0
    bgImage.Parent = main
end

-- GLASS GRADIENT REFLECTION
local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
})
mainGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.85),
    NumberSequenceKeypoint.new(0.5, 1),
    NumberSequenceKeypoint.new(1, 0.9)
})
mainGradient.Rotation = 45
mainGradient.Parent = main

-- GLASS EDGE STROKE
local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(255, 255, 255)
mainStroke.Transparency = 0.7
mainStroke.Thickness = 1
mainStroke.Parent = main

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.CornerRadius = UDim.new(0, 8)
uICorner.Parent = main

-- TOPBAR
local topbar = Instance.new("Frame")
topbar.Name = "Topbar"
topbar.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
topbar.BackgroundTransparency = 0.3
topbar.Size = UDim2.new(0, 450, 0, 31)
topbar.Parent = main
topbar.ZIndex = 2

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

topbar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        		
        input.Changed:Connect(function()
        	if input.UserInputState == Enum.UserInputState.End then
        		dragging = false
        	end
        end)
    end
end)

topbar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local uICorner1 = Instance.new("UICorner")
uICorner1.Name = "UICorner"
uICorner1.CornerRadius = UDim.new(0, 8)
uICorner1.Parent = topbar

local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
frame.BackgroundTransparency = 0.5
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0, 0, 0.625, 0)
frame.Size = UDim2.new(0, 450, 0, 11)
frame.Parent = topbar

local frame1 = Instance.new("Frame")
frame1.Name = "Frame"
frame1.AnchorPoint = Vector2.new(0.5, 1)
frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame1.BackgroundTransparency = 0.7
frame1.BorderSizePixel = 0
frame1.Position = UDim2.new(0.5, 0, 1, 0)
frame1.Size = UDim2.new(0, 450, 0, 1)
frame1.ZIndex = 2
frame1.Parent = frame

local uIGradient = Instance.new("UIGradient")
uIGradient.Name = "UIGradient"
uIGradient.Color = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 180, 255)),
  ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 167, 194)),
})
uIGradient.Enabled = false
uIGradient.Parent = frame1

local textLabel = Instance.new("TextLabel")
textLabel.Name = "TextLabel"
textLabel.Font = Enum.Font.GothamBold
textLabel.Text = Info.Text
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 12
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.BackgroundColor3 = Color3.fromRGB(237, 237, 237)
textLabel.BackgroundTransparency = 1
textLabel.Position = UDim2.new(0.015, 0, 0, 0)
textLabel.Size = UDim2.new(0, 51, 0, 30)
textLabel.ZIndex = 2
textLabel.Parent = topbar

local closeButton = Instance.new("ImageButton")
closeButton.Name = "CloseButton"
closeButton.Image = getcustomasset("Shaman/Close.png")
closeButton.ImageColor3 = Color3.fromRGB(237, 237, 237)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundTransparency = 1
closeButton.Position = UDim2.new(0.947, 0, 0.194, 0)
closeButton.Size = UDim2.new(0, 17, 0, 17)
closeButton.ZIndex = 2
closeButton.Parent = topbar

closeButton.MouseButton1Click:Once(function()
    shamanScreenGui:Destroy()
    tooltipScreenGui:Destroy()
end)

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(255, 100, 100)}):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(217, 217, 217)}):Play()
end)

local minimizeButton = Instance.new("ImageButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Image = "rbxassetid://10664064072"
minimizeButton.ImageColor3 = Color3.fromRGB(237, 237, 237)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundTransparency = 1
minimizeButton.Position = UDim2.new(0.893, 0, 0.194, 0)
minimizeButton.Size = UDim2.new(0, 17, 0, 17)
minimizeButton.ZIndex = 2
minimizeButton.Parent = topbar

minimizeButton.MouseEnter:Connect(function()
    TweenService:Create(minimizeButton, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(255, 200, 100)}):Play()
end)

minimizeButton.MouseLeave:Connect(function()
    TweenService:Create(minimizeButton, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(217, 217, 217)}):Play()
end)

local Opened = true

minimizeButton.MouseButton1Click:Connect(function()
    Opened = not Opened
    
    topbar.Frame.Visible = Opened
    task.spawn(function()
    if Opened then
        task.wait(.15)
    end
    for _,v in pairs(main:GetChildren()) do
        if v.Name == "TabContainer" then
            v.Visible = Opened
        end
    end
    for _,v in pairs(main:GetChildren()) do
       if v.Name == "LeftContainer" or v.Name == "RightContainer" and v.Visible then
           v.Size = Opened and UDim2.new(0, 168,0, 287) or UDim2.new(0, 168,0, 0)
       end
    end
    end)
    
    TweenService:Create(main, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Opened and UDim2.new(0, 450,0, 321) or UDim2.new(0, 450,0, 30)}):Play()
end)

local editButton = Instance.new("ImageButton")
editButton.Name = "EditButton"
editButton.Image = getcustomasset("Shaman/ColorDropper.png")
editButton.ImageColor3 = Color3.fromRGB(237, 237, 237)
editButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
editButton.BackgroundTransparency = 1
editButton.Position = UDim2.new(0.841, 0, 0.226, 0)
editButton.Size = UDim2.new(0, 15, 0, 15)
editButton.ZIndex = 2
editButton.Parent = topbar

local uiGradient = Instance.new("UIGradient")
uiGradient.Name = "UIGradient"
uiGradient.Enabled = false
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),
    ColorSequenceKeypoint.new(0.2,Color3.fromRGB(255,255,0)),
    ColorSequenceKeypoint.new(0.4,Color3.fromRGB(0,255,0)),
    ColorSequenceKeypoint.new(0.6,Color3.fromRGB(0,255,255)),
    ColorSequenceKeypoint.new(0.8,Color3.fromRGB(0,0,255)),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,255)),
}
uiGradient.Parent = editButton

task.spawn(function()
    while task.wait() do 
    if uiGradient.Enabled then
	local loop = tick() % 2 / 2
	colors = {}
	for i = 1, 7 + 1, 1 do
		z = Color3.fromHSV(loop - ((i - 1)/7), 1, 1)
		if loop - ((i - 1) / 7) < 0 then
			z = Color3.fromHSV((loop - ((i - 1) / 7)) + 1, 1, 1)
		end
		local d = ColorSequenceKeypoint.new((i - 1) / 7, z)
		table.insert(colors, #colors + 1, d)
	end
	uiGradient.Color = ColorSequence.new(colors)
end
end
end)

editButton.MouseEnter:Connect(function()
    if not EditOpened then
        uiGradient.Enabled = true
    end
end)

editButton.MouseLeave:Connect(function()
    if not EditOpened then
        uiGradient.Enabled = false
    end
end)

editButton.MouseButton1Click:Connect(function()
    EditOpened = not EditOpened
    
    uiGradient.Enabled = EditOpened and true or false
    
    if not EditOpened then
        for frame, v in pairs(ColorElements) do
            if v.Enabled then
                if frame.ClassName == "Frame" then
                TweenService:Create(frame, TweenInfo.new(.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(80, 180, 255)}):Play()
                else
                TweenService:Create(frame, TweenInfo.new(.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(80, 180, 255)}):Play()
                end
            end
        end
    else
        for _,v in pairs(ColorElements) do
            if v.Type ~= "Toggle" then
                v.Enabled = true
            end
        end
    end
end)

-- TAB CONTAINER (SIDEBAR)
local tabContainer = Instance.new("Frame")
tabContainer.Name = "TabContainer"
tabContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
tabContainer.BackgroundTransparency = 0.4
tabContainer.Position = UDim2.new(0, 0, 0.0935, 0)
tabContainer.Size = UDim2.new(0, 114, 0, 291)
tabContainer.Parent = main

local uICorner2 = Instance.new("UICorner")
uICorner2.Name = "UICorner"
uICorner2.CornerRadius = UDim.new(0, 6)
uICorner2.Parent = tabContainer

local tabStroke = Instance.new("UIStroke")
tabStroke.Color = Color3.fromRGB(255, 255, 255)
tabStroke.Transparency = 0.8
tabStroke.Parent = tabContainer

local fix = Instance.new("Frame")
fix.Name = "Fix"
fix.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
fix.BackgroundTransparency = 0.5
fix.BorderSizePixel = 0
fix.Position = UDim2.new(0.895, 0, 0, 0)
fix.Size = UDim2.new(0, 11, 0, 285)
fix.Parent = tabContainer

local fix1 = Instance.new("Frame")
fix1.Name = "Fix"
fix1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
fix1.BackgroundTransparency = 0.5
fix1.BorderSizePixel = 0
fix1.Position = UDim2.new(0, 0, -0.00351, 0)
fix1.Size = UDim2.new(0, 11, 0, 79)
fix1.Parent = tabContainer

local scrollingContainer = Instance.new("ScrollingFrame")
scrollingContainer.Name = "ScrollingContainer"
scrollingContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingContainer.CanvasSize = UDim2.new()
scrollingContainer.ScrollBarImageColor3 = Color3.fromRGB(80, 180, 255)
scrollingContainer.ScrollBarThickness = 2
scrollingContainer.Active = true
scrollingContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollingContainer.BackgroundTransparency = 1
scrollingContainer.BorderSizePixel = 0
scrollingContainer.Size = UDim2.new(0, 114, 0, 285)
scrollingContainer.ZIndex = 2
scrollingContainer.Parent = tabContainer

function window:Tab(Info)
Info.Text = Info.Text or "Tab"

local tab = {}

local tabButton = Instance.new("Frame")
tabButton.Name = "TabButton"
tabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tabButton.BackgroundTransparency = 1
tabButton.Size = UDim2.new(0, 113, 0, 27)
tabButton.Parent = scrollingContainer

local tabFrame = Instance.new("Frame")
tabFrame.Name = "TabFrame"
tabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tabFrame.BackgroundTransparency = 0.8
tabFrame.BorderSizePixel = 0
tabFrame.Position = UDim2.new(0.067, -5, 0.013, 3)
tabFrame.Size = UDim2.new(0, 107, 0, 23)
tabFrame.ZIndex = 2
tabFrame.Parent = tabButton

tabFrame.MouseEnter:Connect(function()
    if TabSelected ~= tabFrame or TabSelected == nil then
        TweenService:Create(tabFrame, TweenInfo.new(.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = .7}):Play()
    end
end)

tabFrame.MouseLeave:Connect(function()
    if TabSelected ~= tabFrame or TabSelected == nil then
        TweenService:Create(tabFrame, TweenInfo.new(.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = .8}):Play()
    end
end)

local tabTextButton = Instance.new("TextButton")
tabTextButton.Name = "TabTextButton"
tabTextButton.Font = Enum.Font.SourceSans
tabTextButton.Text = ""
tabTextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
tabTextButton.TextSize = 14
tabTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tabTextButton.BackgroundTransparency = 1
tabTextButton.Size = UDim2.new(0, 107, 0, 23)
tabTextButton.Parent = tabFrame

local uICorner3 = Instance.new("UICorner")
uICorner3.Name = "UICorner"
uICorner3.CornerRadius = UDim.new(0, 4)
uICorner3.Parent = tabFrame

local textLabel1 = Instance.new("TextLabel")
textLabel1.Name = "TextLabel"
textLabel1.Font = Enum.Font.GothamBold
textLabel1.Text = Info.Text
textLabel1.TextColor3 = Color3.fromRGB(237, 237, 237)
textLabel1.TextSize = 11
textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel1.BackgroundTransparency = 1
textLabel1.Size = UDim2.new(0, 108, 0, 23)
textLabel1.ZIndex = 2
textLabel1.Parent = tabFrame

local uIStroke = Instance.new("UIStroke")
uIStroke.Name = "UIStroke"
uIStroke.Color = Color3.fromRGB(255, 255, 255)
uIStroke.Transparency = 0.7
uIStroke.Parent = tabFrame

local selected = Instance.new("Frame")
selected.Name = "Selected"
selected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
selected.BackgroundTransparency = 0.1
selected.Visible = false
selected.BorderSizePixel = 0
selected.Position = UDim2.new(0.067, -5, 0.013, 3)
selected.Size = UDim2.new(0, 108, 0, 23)
selected.Parent = tabButton

local uICorner4 = Instance.new("UICorner")
uICorner4.Name = "UICorner"
uICorner4.CornerRadius = UDim.new(0, 3)
uICorner4.Parent = selected

local uIGradient1 = Instance.new("UIGradient")
uIGradient1.Name = "UIGradient"
uIGradient1.Parent = selected
uIGradient1.Color = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 180, 255)),
  ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25)),
})
uIGradient1.Transparency = NumberSequence.new({
  NumberSequenceKeypoint.new(0, 0.5),
  NumberSequenceKeypoint.new(0.688, 0.725),
  NumberSequenceKeypoint.new(1, 0.506),
})

-- LEFT CONTAINER
local leftContainer = Instance.new("ScrollingFrame")
leftContainer.Name = "LeftContainer"
leftContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
leftContainer.CanvasSize = UDim2.new()
leftContainer.ScrollBarThickness = 0
leftContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
leftContainer.BackgroundTransparency = 0.5
leftContainer.BorderSizePixel = 0
leftContainer.Position = UDim2.new(0.253, 0, 0.0935, 0)
leftContainer.Selectable = false
leftContainer.Size = UDim2.new(0, 168, 0, 287)
leftContainer.Parent = main
leftContainer.Visible = false

local leftCorner = Instance.new("UICorner")
leftCorner.CornerRadius = UDim.new(0, 6)
leftCorner.Parent = leftContainer

local leftStroke = Instance.new("UIStroke")
leftStroke.Color = Color3.fromRGB(255, 255, 255)
leftStroke.Transparency = 0.85
leftStroke.Parent = leftContainer

local uIListLayout2 = Instance.new("UIListLayout")
uIListLayout2.Name = "UIListLayout"
uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
uIListLayout2.Parent = leftContainer

local uIPadding2 = Instance.new("UIPadding")
uIPadding2.Name = "UIPadding"
uIPadding2.PaddingLeft = UDim.new(0, 4)
uIPadding2.PaddingTop = UDim.new(0, 3)
uIPadding2.Parent = leftContainer

-- RIGHT CONTAINER
local rightContainer = Instance.new("ScrollingFrame")
rightContainer.Name = "RightContainer"
rightContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
rightContainer.CanvasSize = UDim2.new()
rightContainer.ScrollBarThickness = 0
rightContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
rightContainer.BackgroundTransparency = 0.5
rightContainer.BorderSizePixel = 0
rightContainer.Position = UDim2.new(0.627, 0, 0.0935, 0)
rightContainer.Selectable = false
rightContainer.Size = UDim2.new(0, 168, 0, 287)
rightContainer.Parent = main
rightContainer.Visible = false

local rightCorner = Instance.new("UICorner")
rightCorner.CornerRadius = UDim.new(0, 6)
rightCorner.Parent = rightContainer

local rightStroke = Instance.new("UIStroke")
rightStroke.Color = Color3.fromRGB(255, 255, 255)
rightStroke.Transparency = 0.85
rightStroke.Parent = rightContainer

local uIListLayout3 = Instance.new("UIListLayout")
uIListLayout3.Name = "UIListLayout"
uIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
uIListLayout3.Parent = rightContainer

local uIPadding3 = Instance.new("UIPadding")
uIPadding3.Name = "UIPadding"
uIPadding3.PaddingLeft = UDim.new(0, 2)
uIPadding3.PaddingTop = UDim.new(0, 3)
uIPadding3.Parent = rightContainer

function tab:Section(Info)
Info.Text = Info.Text or "Section"
Info.Side = Info.Side or "Left"

local SizeY = 23

local sectiontable = {}

local Side
    
if Info.Side == "Left" then
    Side = leftContainer
    else
    Side = rightContainer
end
    
local section = Instance.new("Frame")
section.Name = "Section"
section.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
section.BackgroundTransparency = 1
section.Size = UDim2.new(0, 162, 0, 27)
section.Parent = Side

local Closed = Instance.new("BoolValue", section)
Closed.Value = false

local sectionFrame = Instance.new("Frame")
sectionFrame.Name = "SectionFrame"
sectionFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
sectionFrame.BackgroundTransparency = 0.4
sectionFrame.ClipsDescendants = true
sectionFrame.Size = UDim2.new(0, 162, 0, 23)
sectionFrame.Parent = section

-- GLASS STROKE FOR SECTION
local sectionGlassStroke = Instance.new("UIStroke")
sectionGlassStroke.Color = Color3.fromRGB(255, 255, 255)
sectionGlassStroke.Transparency = 0.8
sectionGlassStroke.Thickness = 1
sectionGlassStroke.Parent = sectionFrame

sectionFrame.ChildAdded:Connect(function(v)
    if v.ClassName == "Frame" then
        if v.Name == "Slider" then
        SizeY = SizeY + 40
        else
        SizeY = SizeY + 27
        end
    end
end)

local uIStroke3 = Instance.new("UIStroke")
uIStroke3.Name = "UIStroke"
uIStroke3.Color = Color3.fromRGB(255, 255, 255)
uIStroke3.Transparency = 0.85
uIStroke3.Parent = sectionFrame

local uICorner7 = Instance.new("UICorner")
uICorner7.Name = "UICorner"
uICorner7.CornerRadius = UDim.new(0, 5)
uICorner7.Parent = sectionFrame

local uIListLayout1 = Instance.new("UIListLayout")
uIListLayout1.Name = "UIListLayout"
uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
uIListLayout1.Parent = sectionFrame

local uIPadding1 = Instance.new("UIPadding")
uIPadding1.Name = "UIPadding"
uIPadding1.PaddingTop = UDim.new(0, 23)
uIPadding1.Parent = sectionFrame

local sectionName = Instance.new("TextLabel")
sectionName.Name = "SectionName"
sectionName.Font = Enum.Font.GothamBold
sectionName.Text = Info.Text
sectionName.TextColor3 = Color3.fromRGB(230, 230, 230)
sectionName.TextSize = 11
sectionName.TextXAlignment = Enum.TextXAlignment.Left
sectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sectionName.BackgroundTransparency = 1
sectionName.Position = UDim2.new(0.0488, 0, 0, 0)
sectionName.Size = UDim2.new(0, 128, 0, 23)
sectionName.Parent = section

local sectionButton = Instance.new("TextButton")
sectionButton.Name = "SectionButton"
sectionButton.Font = Enum.Font.SourceSans
sectionButton.Text = ""
sectionButton.TextColor3 = Color3.fromRGB(0, 0, 0)
sectionButton.TextSize = 14
sectionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sectionButton.BackgroundTransparency = 1
sectionButton.Size = UDim2.new(0, 162, 0, 23)
sectionButton.ZIndex = 2
sectionButton.Parent = section

local sectionIcon = Instance.new("ImageButton")
sectionIcon.Name = "SectionButton"
sectionIcon.Image = "rbxassetid://10664195729"
sectionIcon.ImageColor3 = Color3.fromRGB(217, 217, 217)
sectionIcon.AnchorPoint = Vector2.new(1, 0)
sectionIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sectionIcon.BackgroundTransparency = 1
sectionIcon.Position = UDim2.new(1, -5, 0, 5)
sectionIcon.Size = UDim2.new(0, 13, 0, 13)
sectionIcon.ZIndex = 1
sectionIcon.Parent = section

sectionButton.MouseButton1Click:Connect(function()
    Closed.Value = not Closed.Value
    
    TweenService:Create(section, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Closed.Value and UDim2.new(0, 162, 0, SizeY + 4) or UDim2.new(0, 162, 0, 27)}):Play()
    TweenService:Create(sectionFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Closed.Value and UDim2.new(0, 162, 0, SizeY) or UDim2.new(0, 162, 0, 23)}):Play()
    TweenService:Create(sectionIcon, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {ImageColor3 = Closed.Value and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(217, 217, 217)}):Play()
    TweenService:Create(sectionIcon, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Rotation = Closed.Value and 45 or 0}):Play()
end)

function sectiontable:Label(Info)
Info.Text = Info.Text or "Label"
Info.Color = Info.Color or Color3.fromRGB(217, 217, 217)
Info.Tooltip = Info.Tooltip or ""

local insidelabel = {}

local label = Instance.new("Frame")
label.Name = "Label"
label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.Size = UDim2.new(0, 162, 0, 27)
label.Parent = sectionFrame

if Info.Tooltip ~= "" then
    AddTooltip(label, Info.Tooltip)
end

local labelText = Instance.new("TextLabel")
labelText.Name = "LabelText"
labelText.Font = Enum.Font.GothamBold
labelText.TextColor3 = Info.Color
labelText.Text = Info.Text
labelText.TextSize = 11
labelText.TextXAlignment = Enum.TextXAlignment.Left
labelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
labelText.BackgroundTransparency = 1
labelText.Position = UDim2.new(0.0488, 0, 0, 0)
labelText.Size = UDim2.new(0, 156, 0, 27)
labelText.Parent = label

function insidelabel:Set(SetInfo)
SetInfo.Text = SetInfo.Text or labelText.Text
SetInfo.Color = SetInfo.Color or labelText.TextColor3

labelText.Text = SetInfo.Text
labelText.TextColor3 = SetInfo.Color
end

return insidelabel
end

function sectiontable:Keybind(Info)
Info.Text = Info.Text or "Keybind"
Info.Default = Info.Default or Enum.KeyCode.F4
Info.Callback = Info.Callback or function() end
Info.Tooltip = Info.Tooltip or ""

local PressKey = Info.Default

local keybind = Instance.new("Frame")
keybind.Name = "Keybind"
keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keybind.BackgroundTransparency = 1
keybind.Size = UDim2.new(0, 162, 0, 27)
keybind.Parent = sectionFrame

if Info.Tooltip ~= "" then
    AddTooltip(keybind, Info.Tooltip)
end

local keybindText = Instance.new("TextLabel")
keybindText.Name = "KeybindText"
keybindText.Font = Enum.Font.GothamBold
keybindText.Text = Info.Text
keybindText.TextColor3 = Color3.fromRGB(217, 217, 217)
keybindText.TextSize = 11
keybindText.TextXAlignment = Enum.TextXAlignment.Left
keybindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keybindText.BackgroundTransparency = 1
keybindText.Position = UDim2.new(0.0488, 0, 0, 0)
keybindText.Size = UDim2.new(0, 156, 0, 27)
keybindText.Parent = keybind

local keybindFrame = Instance.new("Frame")
keybindFrame.Name = "KeybindFrame"
keybindFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
keybindFrame.BackgroundTransparency = 0.3
keybindFrame.AnchorPoint = Vector2.new(1, 0)
keybindFrame.BorderSizePixel = 0
keybindFrame.Position = UDim2.new(0, 158, 0.222, 0)
keybindFrame.Size = UDim2.new(0, 30, 0, 15)
keybindFrame.Parent = keybind

local keybindUICorner = Instance.new("UICorner")
keybindUICorner.Name = "KeybindUICorner"
keybindUICorner.CornerRadius = UDim.new(0, 3)
keybindUICorner.Parent = keybindFrame

local keybindStroke = Instance.new("UIStroke")
keybindStroke.Color = Color3.fromRGB(255, 255, 255)
keybindStroke.Transparency = 0.8
keybindStroke.Parent = keybindFrame

local keybindFrameText = Instance.new("TextLabel")
keybindFrameText.Name = "KeybindFrameText"
keybindFrameText.Font = Enum.Font.GothamBold
keybindFrameText.Text = PressKey.Name
keybindFrameText.TextColor3 = Color3.fromRGB(217, 217, 217)
keybindFrameText.TextSize = 11
keybindFrameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keybindFrameText.BackgroundTransparency = 1
keybindFrameText.Size = UDim2.new(1, 0, 0, 15)
keybindFrameText.Parent = keybindFrame

local keybindButton = Instance.new("TextButton")
keybindButton.Name = "KeybindButton"
keybindButton.Font = Enum.Font.SourceSans
keybindButton.Text = ""
keybindButton.TextColor3 = Color3.fromRGB(0, 0, 0)
keybindButton.TextSize = 14
keybindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keybindButton.BackgroundTransparency = 1
keybindButton.Size = UDim2.new(1, 0, 0, 15)
keybindButton.Parent = keybindFrame

local TextBounds = keybindFrameText.TextBounds

keybindFrame.Size = UDim2.new(0, TextBounds.X + 10, 0, 15)

keybindFrameText:GetPropertyChangedSignal("Text"):Connect(function()
    TextBounds = keybindFrameText.TextBounds
    keybindFrame.Size = UDim2.new(0, TextBounds.X + 10, 0, 15)
end)

local KeybindConnection
local Changing = false

keybindButton.MouseButton1Click:Connect(function()
    if KeybindConnection then KeybindConnection:Disconnect() end
    Changing = true
    keybindFrameText.Text = "..."
    KeybindConnection = UserInputService.InputBegan:Connect(function(Key, gameProcessed)
        if not table.find(Blacklist, Key.KeyCode) and not gameProcessed then
            KeybindConnection:Disconnect()
            keybindFrameText.Text = Key.KeyCode.Name
            PressKey = Key.KeyCode
            task.wait(.1)
            Changing = false
        end
    end)
end)

UserInputService.InputBegan:Connect(function(Key, gameProcessed)
    if not Changing and Key.KeyCode == PressKey and not gameProcessed then
        task.spawn(function()
            pcall(Info.Callback)
        end)
    end
end)

end

function sectiontable:Button(Info)
Info.Text = Info.Text or "Button"
Info.Callback = Info.Callback or function() end
Info.Tooltip = Info.Tooltip or ""

local buttontable = {}
    
local button = Instance.new("Frame")
button.Name = "Button"
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundTransparency = 1
button.Size = UDim2.new(0, 162, 0, 27)
button.Parent = sectionFrame

if Info.Tooltip ~= "" then
    AddTooltip(button, Info.Tooltip)
end

local buttonText = Instance.new("TextLabel")
buttonText.Name = "ButtonText"
buttonText.Font = Enum.Font.GothamBold
buttonText.Text = Info.Text
buttonText.TextColor3 = Color3.fromRGB(217, 217, 217)
buttonText.TextSize = 11
buttonText.TextXAlignment = Enum.TextXAlignment.Left
buttonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonText.BackgroundTransparency = 1
buttonText.Position = UDim2.new(0.0488, 0, 0, 0)
buttonText.Size = UDim2.new(0, 156, 0, 27)
buttonText.Parent = button

local textButton = Instance.new("TextButton")
textButton.Name = "TextButton"
textButton.Font = Enum.Font.SourceSans
textButton.Text = ""
textButton.TextColor3 = Color3.fromRGB(0, 0, 0)
textButton.TextSize = 14
textButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textButton.BackgroundTransparency = 1
textButton.Size = UDim2.new(0, 162, 0, 27)
textButton.Parent = button

textButton.MouseButton1Click:Connect(function()
    task.spawn(function()
        pcall(Info.Callback)
    end)
end)
end

function sectiontable:Input(Info)
Info.Placeholder = Info.Placeholder or "Input"
Info.Flag = Info.Flag or nil
Info.Callback = Info.Callback or function() end
Info.Tooltip = Info.Tooltip or ""

local input = Instance.new("Frame")
input.Name = "Input"
input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
input.BackgroundTransparency = 1
input.Size = UDim2.new(0, 162, 0, 27)
input.Parent = sectionFrame

if Info.Tooltip ~= "" then
    AddTooltip(input, Info.Tooltip)
end

local inputFrame = Instance.new("Frame")
inputFrame.Name = "InputFrame"
inputFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inputFrame.BackgroundTransparency = 1
inputFrame.Size = UDim2.new(0, 162, 0, 27)
inputFrame.Parent = input

local inputOuter = Instance.new("Frame")
inputOuter.Name = "InputOuter"
inputOuter.AnchorPoint = Vector2.new(0.5, 0.5)
inputOuter.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
inputOuter.BackgroundTransparency = 0.3
inputOuter.BorderSizePixel = 0
inputOuter.ClipsDescendants = true
inputOuter.Position = UDim2.new(0.5, 0, 0.5, 0)
inputOuter.Size = UDim2.new(0, 154, 0, 21)
inputOuter.Parent = inputFrame

local inputUICorner = Instance.new("UICorner")
inputUICorner.Name = "InputUICorner"
inputUICorner.CornerRadius = UDim.new(0, 3)
inputUICorner.Parent = inputOuter

local inputUIStroke = Instance.new("UIStroke")
inputUIStroke.Name = "InputUIStroke"
inputUIStroke.Color = Color3.fromRGB(255, 255, 255)
inputUIStroke.Transparency = 0.8
inputUIStroke.Parent = inputOuter

local inputTextBox = Instance.new("TextBox")
inputTextBox.Name = "InputTextBox"
inputTextBox.CursorPosition = -1
inputTextBox.Font = Enum.Font.GothamBold
inputTextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
inputTextBox.PlaceholderText = Info.Placeholder
inputTextBox.Text = ""
inputTextBox.TextColor3 = Color3.fromRGB(237, 237, 237)
inputTextBox.TextSize = 11
inputTextBox.TextXAlignment = Enum.TextXAlignment.Left
inputTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inputTextBox.BackgroundTransparency = 1
inputTextBox.Position = UDim2.new(0.0253, 0, 0, 0)
inputTextBox.Size = UDim2.new(0, 150, 0, 21)
inputTextBox.Parent = inputOuter

inputTextBox.FocusLost:Connect(function()
    task.spawn(function()
        pcall(Info.Callback, inputTextBox.Text)
        if Info.Flag ~= nil then
		    library.Flags[Info.Flag] = inputTextBox.Text
		end
    end)
end)
end

function sectiontable:Toggle(Info)
Info.Text = Info.Text or "Toggle"
Info.Flag = Info.Flag or nil
Info.Default = Info.Default or false
Info.Callback = Info.Callback or function() end
Info.Tooltip = Info.Tooltip or ""

if Info.Flag ~= nil then
    library.Flags[Info.Flag] = false
end

local insidetoggle = {}

local Toggled = false

local toggle = Instance.new("Frame")
toggle.Name = "Toggle"
toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggle.BackgroundTransparency = 1
toggle.Size = UDim2.new(0, 162, 0, 27)
toggle.Parent = sectionFrame

if Info.Tooltip ~= "" then
    AddTooltip(toggle, Info.Tooltip)
end

local toggleText = Instance.new("TextLabel")
toggleText.Name = "ToggleText"
toggleText.Font = Enum.Font.GothamBold
toggleText.Text = Info.Text
toggleText.TextColor3 = Color3.fromRGB(217, 217, 217)
toggleText.TextSize = 11
toggleText.TextXAlignment = Enum.TextXAlignment.Left
toggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleText.BackgroundTransparency = 1
toggleText.Position = UDim2.new(0.0488, 0, 0, 0)
toggleText.Size = UDim2.new(0, 156, 0, 27)
toggleText.Parent = toggle

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Font = Enum.Font.SourceSans
toggleButton.Text = ""
toggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
toggleButton.TextSize = 14
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundTransparency = 1
toggleButton.Size = UDim2.new(0, 162, 0, 27)
toggleButton.Parent = toggle

local toggleFrame = Instance.new("Frame")
toggleFrame.Name = "ToggleFrame"
toggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
toggleFrame.BackgroundTransparency = 0.2
toggleFrame.BorderSizePixel = 0
toggleFrame.Position = UDim2.new(0.783, 0, 0.222, 0)
toggleFrame.Size = UDim2.new(0, 30, 0, 15)
toggleFrame.Parent = toggle

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(255, 255, 255)
toggleStroke.Transparency = 0.8
toggleStroke.Parent = toggleFrame

ColorElements[toggleFrame] = {Type = "Toggle", Enabled = false}

local toggleUICorner = Instance.new("UICorner")
toggleUICorner.Name = "ToggleUICorner"
toggleUICorner.CornerRadius = UDim.new(0, 100)
toggleUICorner.Parent = toggleFrame

local circleIcon = Instance.new("ImageLabel")
circleIcon.Name = "CheckIcon"
circleIcon.Image = getcustomasset("Shaman/Circle.png")
circleIcon.ImageColor3 = Color3.fromRGB(217, 217, 217)
circleIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
circleIcon.BackgroundTransparency = 1
circleIcon.Position = UDim2.new(0, 1, 0.067, 0)
circleIcon.Size = UDim2.new(0, 13, 0, 13)
circleIcon.Parent = toggleFrame

function insidetoggle:Set(bool)
    Toggled = bool
    if Info.Flag ~= nil then
        library.Flags[Info.Flag] = Toggled
    end
    ColorElements[toggleFrame].Enabled = Toggled
    
    TweenService:Create(circleIcon, TweenInfo.new(.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Position = Toggled and UDim2.new(0, 16,0.067, 0) or UDim2.new(0, 1,0.067, 0)}):Play()
    if not Toggled then
        TweenService:Create(toggleFrame, TweenInfo.new(.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(40, 40, 45)}):Play()
    elseif Toggled and not EditOpened then
        TweenService:Create(toggleFrame, TweenInfo.new(.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(80, 180, 255)}):Play()
    end
    pcall(Info.Callback, Toggled)
end

if Info.Default then
    task.spawn(function()
        insidetoggle:Set(true)
    end)
end

toggleButton.MouseButton1Click:Connect(function()
    Toggled = not Toggled
    insidetoggle:Set(Toggled)
end)

return insidetoggle
end

function sectiontable:Slider(Info)
Info.Text = Info.Text or "Slider"
Info.Default = Info.Default or 50
Info.Minimum = Info.Minimum or 1
Info.Flag = Info.Flag or nil
Info.Maximum = Info.Maximum or 100
Info.Postfix = Info.Postfix or ""
Info.Callback = Info.Callback or function() end
Info.Tooltip = Info.Tooltip or ""

if Info.Minimum > Info.Maximum then
local ValueBefore = Info.Minimum
Info.Minimum, Info.Maximum = Info.Maximum, ValueBefore
end

Info.Default = math.clamp(Info.Default, Info.Minimum, Info.Maximum)
local DefaultScale = (Info.Default - Info.Minimum) / (Info.Maximum - Info.Minimum)

local slider = Instance.new("Frame")
slider.Name = "Slider"
slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
slider.BackgroundTransparency = 1
slider.Position = UDim2.new(0, 0, 0.825, 0)
slider.Size = UDim2.new(0, 162, 0, 40)
slider.Parent = sectionFrame

if Info.Tooltip ~= "" then
    AddTooltip(slider, Info.Tooltip)
end

local sliderText = Instance.new("TextLabel")
sliderText.Name = "SliderText"
sliderText.Font = Enum.Font.GothamBold
sliderText.Text = Info.Text
sliderText.TextColor3 = Color3.fromRGB(217, 217, 217)
sliderText.TextSize = 11
sliderText.TextXAlignment = Enum.TextXAlignment.Left
sliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderText.BackgroundTransparency = 1
sliderText.Position = UDim2.new(0.0488, 0, 0, 0)
sliderText.Size = UDim2.new(0, 156, 0, 27)
sliderText.Parent = slider

local outerSlider = Instance.new("Frame")
outerSlider.Name = "OuterSlider"
outerSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
outerSlider.BackgroundTransparency = 0.2
outerSlider.BorderSizePixel = 0
outerSlider.Position = UDim2.new(0.049, -1, 0.664, 0)
outerSlider.Size = UDim2.new(0, 149, 0, 4)
outerSlider.Parent = slider

local sliderCorner = Instance.new("UICorner")
sliderCorner.Name = "SliderCorner"
sliderCorner.CornerRadius = UDim.new(0, 100)
sliderCorner.Parent = outerSlider

local innerSlider = Instance.new("Frame")
innerSlider.Name = "InnerSlider"
innerSlider.BackgroundColor3 = Color3.fromRGB(80, 180, 255)
innerSlider.BorderSizePixel = 0
innerSlider.Size = UDim2.new(DefaultScale, 0, 0, 4)
innerSlider.ZIndex = 2
innerSlider.Parent = outerSlider

ColorElements[innerSlider] = {Type = "Slider", Enabled = false}

local innerSliderCorner = Instance.new("UICorner")
innerSliderCorner.Name = "InnerSliderCorner"
innerSliderCorner.CornerRadius = UDim.new(0, 100)
innerSliderCorner.Parent = innerSlider

local sliderValueText = Instance.new("TextLabel")
sliderValueText.Name = "SliderValueText"
sliderValueText.Font = Enum.Font.GothamBold
sliderValueText.Text = tostring(Info.Default)..Info.Postfix
sliderValueText.TextColor3 = Color3.fromRGB(217, 217, 217)
sliderValueText.TextSize = 11
sliderValueText.TextXAlignment = Enum.TextXAlignment.Right
sliderValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderValueText.BackgroundTransparency = 1
sliderValueText.Position = UDim2.new(0.0488, 0, 0, 0)
sliderValueText.Size = UDim2.new(0, 149, 0, 27)
sliderValueText.Parent = slider

local sliderButton = Instance.new("TextButton")
sliderButton.Name = "SliderButton"
sliderButton.Font = Enum.Font.SourceSans
sliderButton.Text = ""
sliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
sliderButton.TextSize = 14
sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderButton.BackgroundTransparency = 1
sliderButton.Position = UDim2.new(0.049, 0, 0.664, 0)
sliderButton.Size = UDim2.new(0, 149, 0, 4)
sliderButton.Parent = slider

task.spawn(function()
    pcall(Info.Callback, Info.Default)
    if Info.Flag ~= nil then
        library.Flags[Info.Flag] = Info.Default
    end
end)

local MinSize = 0
local MaxSize = 1

local SizeFromScale = (MinSize +  (MaxSize - MinSize)) * DefaultScale
SizeFromScale = SizeFromScale - (SizeFromScale % 2)

sliderButton.MouseButton1Down:Connect(function()
	local MouseMove, MouseKill
	MouseMove = Mouse.Move:Connect(function()
		local Px = library:GetXY(outerSlider)
		local SizeFromScale = (MinSize +  (MaxSize - MinSize)) * Px
		local Value = math.floor(Info.Minimum + ((Info.Maximum - Info.Minimum) * Px))
		SizeFromScale = SizeFromScale - (SizeFromScale % 2)
		TweenService:Create(innerSlider, TweenInfo.new(0.1), {Size = UDim2.new(Px,0,0,4)}):Play()
		if Info.Flag ~= nil then
		    library.Flags[Info.Flag] = Value
		end
		sliderValueText.Text = tostring(Value)..Info.Postfix
		task.spawn(function()
		    pcall(Info.Callback, Value)
		end)
	end)
	MouseKill = UserInputService.InputEnded:Connect(function(UserInput)
		if UserInput.UserInputType == Enum.UserInputType.MouseButton1 then
			MouseMove:Disconnect()
			MouseKill:Disconnect()
		end
	end)
end)
end

function sectiontable:Dropdown(Info)
Info.Text = Info.Text or "Dropdown"
Info.List = Info.List or {}
Info.Flag = Info.Flag or nil
Info.Callback = Info.Callback or function() end
Info.Tooltip = Info.Tooltip or ""
Info.Default = Info.Default or nil

local DropdownYSize = 27

if Info.Default ~= nil then
    task.spawn(function()
        pcall(Info.Callback, Info.Default)
    end)
    if Info.Flag ~= nil then
        library.Flags[Info.Flag] = Info.Default
	end
end

local insidedropdown = {}

local dropdown = Instance.new("Frame")
dropdown.Name = "Dropdown"
dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdown.BackgroundTransparency = 1
dropdown.Position = UDim2.new(0, 0, 0.638, 0)
dropdown.Size = UDim2.new(0, 162, 0, 27)
dropdown.Parent = sectionFrame
dropdown.ClipsDescendants = true

if Info.Tooltip ~= "" then
    AddTooltip(dropdown, Info.Tooltip)
end

local dropdownText = Instance.new("TextLabel")
dropdownText.Name = "DropdownText"
dropdownText.Font = Enum.Font.GothamBold
dropdownText.Text = Info.Text
dropdownText.TextColor3 = Color3.fromRGB(217, 217, 217)
dropdownText.TextSize = 11
dropdownText.TextXAlignment = Enum.TextXAlignment.Left
dropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdownText.BackgroundTransparency = 1
dropdownText.Position = UDim2.new(0.0488, 0, 0, 0)
dropdownText.Size = UDim2.new(0, 156, 0, 27)
dropdownText.Parent = dropdown

local dropdownIcon = Instance.new("ImageLabel")
dropdownIcon.Name = "DropdownIcon"
dropdownIcon.Image = getcustomasset("Shaman/CollapseArrow.png")
dropdownIcon.ImageColor3 = Color3.fromRGB(191, 191, 191)
dropdownIcon.AnchorPoint = Vector2.new(1, 0)
dropdownIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdownIcon.BackgroundTransparency = 1
dropdownIcon.Rotation = -90
dropdownIcon.Position = UDim2.new(0, 155, 0, 7)
dropdownIcon.Size = UDim2.new(0, 13, 0, 13)
dropdownIcon.ZIndex = 2
dropdownIcon.Parent = dropdown

local dropdownButton = Instance.new("TextButton")
dropdownButton.Name = "DropdownButton"
dropdownButton.Font = Enum.Font.SourceSans
dropdownButton.Text = ""
dropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
dropdownButton.TextSize = 14
dropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdownButton.BackgroundTransparency = 1
dropdownButton.Size = UDim2.new(0, 162, 0, 27)
dropdownButton.Parent = dropdown

local dropdownContainer = Instance.new("Frame")
dropdownContainer.Name = "DropdownContainer"
dropdownContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
dropdownContainer.BackgroundTransparency = 0.4
dropdownContainer.BorderSizePixel = 0
dropdownContainer.Size = UDim2.new(0, 162, 0, 27)
dropdownContainer.Parent = dropdown
dropdownContainer.Visible = true

local dropdownuIListLayout = Instance.new("UIListLayout")
dropdownuIListLayout.Name = "UIListLayout"
dropdownuIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
dropdownuIListLayout.Parent = dropdownContainer

local dropdownuIPadding = Instance.new("UIPadding")
dropdownuIPadding.Name = "UIPadding"
dropdownuIPadding.PaddingTop = UDim.new(0, 27)
dropdownuIPadding.Parent = dropdownContainer

local DropdownOpened = false

function insidedropdown:Add(text)
DropdownYSize = DropdownYSize + 27

local dropdownContainerButton = Instance.new("Frame")
dropdownContainerButton.Name = "DropdownContainerButton"
dropdownContainerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdownContainerButton.BackgroundTrans
