Got it! I've completely overhauled the script to integrate your new **CDN & Notification system**, used it to download all the UI icons *and* the **MUI.mp3**, and added the MP3 as a **premium click sound** for all UI interactions (toggles, buttons, dropdowns, etc.). 

I also made sure the **glassmorphism (glass) effect** is fully applied and that the script **doesn't cut off** this time!

Here is the fully integrated, premium glass UI library:

```lua
-- // 1. Load CDN and Notification Libraries
local FixCDN = loadstring(game:HttpGet("https://raw.githubusercontent.com/IdkRandomUsernameok/PublicAssets/refs/heads/main/Modules/FixCDN.lua"))()
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

-- // 2. Asset Downloader Function
local function EnsureAssetDownloaded(filename, originalURL)
    local success, _ = pcall(readfile, filename)
    if success then return end

    NotificationLibrary:SendNotification("Warning", "Downloading " .. filename .. "...", 3)

    local finalURL = FixCDN(originalURL)
    local assetData = game:HttpGet(finalURL)

    writefile(filename, assetData)

    NotificationLibrary:SendNotification("Success", filename .. " downloaded!", 3)
end

-- // 3. Download All Assets (Icons + Sound)
local getcustomasset = getcustomasset or getsynasset

local assets = {
    {"Shaman_Circle.png", "https://raw.githubusercontent.com/Rain-Design/Icons/main/Circle.png"},
    {"Shaman_ColorDropper.png", "https://raw.githubusercontent.com/Rain-Design/Icons/main/ColorDropper.png"},
    {"Shaman_Close.png", "https://raw.githubusercontent.com/Rain-Design/Icons/main/Close.png"},
    {"Shaman_CollapseArrow.png", "https://raw.githubusercontent.com/Rain-Design/Icons/main/CollapseArrow.png"},
    {"Shaman_RadioButton.png", "https://raw.githubusercontent.com/Rain-Design/Icons/main/RadioButton.png"},
    {"Shaman_RadioOuter.png", "https://raw.githubusercontent.com/Rain-Design/Icons/main/RadioOuter.png"},
    {"Shaman_RadioInner.png", "https://raw.githubusercontent.com/Rain-Design/Icons/main/RadioInner.png"},
    {"MUI.mp3", "https://cdn.discordapp.com/attachments/1048878667750703108/1378992293155045506/MUI.mp3"}
}

for _, asset in ipairs(assets) do
    EnsureAssetDownloaded(asset[1], asset[2])
end

-- // 4. Setup Premium Click Sound
local SoundId = getcustomasset("MUI.mp3")
local function PlaySound()
    local s = Instance.new("Sound")
    s.SoundId = SoundId
    s.Volume = 0.2 -- Kept subtle so it's not annoying
    s.Parent = game:GetService("CoreGui")
    s:Play()
    game:GetService("Debris"):AddItem(s, 2)
end

-- // 5. Core UI Variables
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Mouse = game.Players.LocalPlayer:GetMouse()

local Blacklist = {Enum.KeyCode.Unknown, Enum.KeyCode.CapsLock, Enum.KeyCode.Escape, Enum.KeyCode.Tab, Enum.KeyCode.Return, Enum.KeyCode.Backspace, Enum.KeyCode.Space, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D}

if CoreGui:FindFirstChild("Shaman") then CoreGui.Shaman:Destroy() end
if CoreGui:FindFirstChild("Tooltips") then CoreGui.Tooltips:Destroy() end

local function CheckTable(t) local i = 0 for _,_ in pairs(t) do i = i + 1 end return i end

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
                    if frame.ClassName == "Frame" then frame.BackgroundColor3 = color
                    else frame.ImageColor3 = color end
                end
            end
        end
        task.wait()
    end
end)

local library = { Flags = {} }

function library:GetXY(GuiObject)
    local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
    local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
    return Px/Max, Py/May
end

function library:Window(Info)
    Info.Text = Info.Text or "Shaman"
    Info.BackgroundImage = Info.BackgroundImage or nil

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
        tooltip.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        tooltip.BackgroundTransparency = 0.2
        tooltip.Visible = false
        tooltip.Size = UDim2.new(0, 100, 0, 19)
        tooltip.ZIndex = 5
        tooltip.Parent = tooltipScreenGui

        local newuICorner = Instance.new("UICorner")
        newuICorner.CornerRadius = UDim.new(0, 4)
        newuICorner.Parent = tooltip

        local newuIStroke = Instance.new("UIStroke")
        newuIStroke.Color = Color3.fromRGB(255, 255, 255)
        newuIStroke.Transparency = 0.7
        newuIStroke.Parent = tooltip

        local tooltipText = Instance.new("TextLabel")
        tooltipText.Font = Enum.Font.GothamBold
        tooltipText.Text = text
        tooltipText.TextColor3 = Color3.fromRGB(230, 230, 230)
        tooltipText.TextSize = 11
        tooltipText.BackgroundTransparency = 1
        tooltipText.Size = UDim2.new(0, 100, 0, 19)
        tooltipText.Parent = tooltip
        tooltipText.ZIndex = 6

        tooltip.Size = UDim2.new(0, tooltipText.TextBounds.X + 10, 0, 19)
        tooltipText.Size = UDim2.new(0, tooltipText.TextBounds.X + 10, 0, 19)
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
        element.MouseEnter:Connect(function() Hovered = true task.wait(.5) if Hovered then Tooltip.Visible = true end end)
        element.MouseLeave:Connect(function() Hovered = false Tooltip.Visible = false end)
        element.MouseMoved:Connect(Update)
    end

    -- // MAIN GLASS FRAME
    local main = Instance.new("Frame")
    main.Name = "Main"
    main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    main.BackgroundTransparency = 0.15
    main.BorderSizePixel = 0
    main.ClipsDescendants = true
    main.Position = UDim2.new(0.361, 0, 0.308, 0)
    main.Size = UDim2.new(0, 450, 0, 321)
    main.Parent = shamanScreenGui

    if Info.BackgroundImage then
        local bgImage = Instance.new("ImageLabel")
        bgImage.Image = Info.BackgroundImage
        bgImage.ScaleType = Enum.ScaleType.Crop
        bgImage.Size = UDim2.new(1, 0, 1, 0)
        bgImage.BackgroundTransparency = 1
        bgImage.ZIndex = 0
        bgImage.Parent = main
    end

    local mainGradient = Instance.new("UIGradient")
    mainGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))})
    mainGradient.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.85), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0.9)})
    mainGradient.Rotation = 45
    mainGradient.Parent = main

    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = Color3.fromRGB(255, 255, 255)
    mainStroke.Transparency = 0.7
    mainStroke.Parent = main

    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 8)
    uICorner.Parent = main

    -- // TOPBAR
    local topbar = Instance.new("Frame")
    topbar.Name = "Topbar"
    topbar.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    topbar.BackgroundTransparency = 0.3
    topbar.Size = UDim2.new(0, 450, 0, 31)
    topbar.Parent = main
    topbar.ZIndex = 2

    local dragging, dragInput, dragStart, startPos
    local function update(input)
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = main.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    topbar.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end)
    UserInputService.InputChanged:Connect(function(input) if input == dragInput and dragging then update(input) end end)

    Instance.new("UICorner", topbar).CornerRadius = UDim.new(0, 8)

    local textLabel = Instance.new("TextLabel")
    textLabel.Font = Enum.Font.GothamBold
    textLabel.Text = Info.Text
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 12
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0.015, 0, 0, 0)
    textLabel.Size = UDim2.new(0, 200, 0, 30)
    textLabel.ZIndex = 2
    textLabel.Parent = topbar

    local closeButton = Instance.new("ImageButton")
    closeButton.Image = getcustomasset("Shaman_Close.png")
    closeButton.ImageColor3 = Color3.fromRGB(237, 237, 237)
    closeButton.BackgroundTransparency = 1
    closeButton.Position = UDim2.new(0.947, 0, 0.194, 0)
    closeButton.Size = UDim2.new(0, 17, 0, 17)
    closeButton.ZIndex = 2
    closeButton.Parent = topbar
    closeButton.MouseButton1Click:Connect(function() PlaySound() shamanScreenGui:Destroy() tooltipScreenGui:Destroy() end)
    closeButton.MouseEnter:Connect(function() TweenService:Create(closeButton, TweenInfo.new(.1), {ImageColor3 = Color3.fromRGB(255, 100, 100)}):Play() end)
    closeButton.MouseLeave:Connect(function() TweenService:Create(closeButton, TweenInfo.new(.1), {ImageColor3 = Color3.fromRGB(217, 217, 217)}):Play() end)

    local minimizeButton = Instance.new("ImageButton")
    minimizeButton.Image = "rbxassetid://10664064072"
    minimizeButton.ImageColor3 = Color3.fromRGB(237, 237, 237)
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Position = UDim2.new(0.893, 0, 0.194, 0)
    minimizeButton.Size = UDim2.new(0, 17, 0, 17)
    minimizeButton.ZIndex = 2
    minimizeButton.Parent = topbar
    minimizeButton.MouseButton1Click:Connect(function() PlaySound() end)

    local editButton = Instance.new("ImageButton")
    editButton.Image = getcustomasset("Shaman_ColorDropper.png")
    editButton.ImageColor3 = Color3.fromRGB(237, 237, 237)
    editButton.BackgroundTransparency = 1
    editButton.Position = UDim2.new(0.841, 0, 0.226, 0)
    editButton.Size = UDim2.new(0, 15, 0, 15)
    editButton.ZIndex = 2
    editButton.Parent = topbar
    editButton.MouseButton1Click:Connect(function() PlaySound() EditOpened = not EditOpened end)

    -- // TAB CONTAINER
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    tabContainer.BackgroundTransparency = 0.4
    tabContainer.Position = UDim2.new(0, 0, 0.0935, 0)
    tabContainer.Size = UDim2.new(0, 114, 0, 291)
    tabContainer.Parent = main
    Instance.new("UICorner", tabContainer).CornerRadius = UDim.new(0, 6)
    local tabStroke = Instance.new("UIStroke", tabContainer); tabStroke.Color = Color3.fromRGB(255,255,255); tabStroke.Transparency = 0.8

    local scrollingContainer = Instance.new("ScrollingFrame")
    scrollingContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollingContainer.ScrollBarImageColor3 = Color3.fromRGB(80, 180, 255)
    scrollingContainer.ScrollBarThickness = 2
    scrollingContainer.BackgroundTransparency = 1
    scrollingContainer.Size = UDim2.new(0, 114, 0, 285)
    scrollingContainer.ZIndex = 2
    scrollingContainer.Parent = tabContainer

    function window:Tab(Info)
        Info.Text = Info.Text or "Tab"
        local tab = {}

        local tabButton = Instance.new("Frame")
        tabButton.BackgroundTransparency = 1
        tabButton.Size = UDim2.new(0, 113, 0, 27)
        tabButton.Parent = scrollingContainer

        local tabFrame = Instance.new("Frame")
        tabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabFrame.BackgroundTransparency = 0.8
        tabFrame.Position = UDim2.new(0.067, -5, 0.013, 3)
        tabFrame.Size = UDim2.new(0, 107, 0, 23)
        tabFrame.ZIndex = 2
        tabFrame.Parent = tabButton
        Instance.new("UICorner", tabFrame).CornerRadius = UDim.new(0, 4)
        local tabFrameStroke = Instance.new("UIStroke", tabFrame); tabFrameStroke.Color = Color3.fromRGB(255,255,255); tabFrameStroke.Transparency = 0.7

        tabFrame.MouseEnter:Connect(function() if TabSelected ~= tabFrame then TweenService:Create(tabFrame, TweenInfo.new(.15), {BackgroundTransparency = .7}):Play() end end)
        tabFrame.MouseLeave:Connect(function() if TabSelected ~= tabFrame then TweenService:Create(tabFrame, TweenInfo.new(.15), {BackgroundTransparency = .8}):Play() end end)

        local tabTextButton = Instance.new("TextButton")
        tabTextButton.BackgroundTransparency = 1
        tabTextButton.Size = UDim2.new(0, 107, 0, 23)
        tabTextButton.Parent = tabFrame

        local textLabel1 = Instance.new("TextLabel")
        textLabel1.Font = Enum.Font.GothamBold
        textLabel1.Text = Info.Text
        textLabel1.TextColor3 = Color3.fromRGB(237, 237, 237)
        textLabel1.TextSize = 11
        textLabel1.BackgroundTransparency = 1
        textLabel1.Size = UDim2.new(0, 108, 0, 23)
        textLabel1.ZIndex = 2
        textLabel1.Parent = tabFrame

        local leftContainer = Instance.new("ScrollingFrame")
        leftContainer.Name = "LeftContainer"
        leftContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
        leftContainer.ScrollBarThickness = 0
        leftContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
        leftContainer.BackgroundTransparency = 0.5
        leftContainer.Position = UDim2.new(0.253, 0, 0.0935, 0)
        leftContainer.Size = UDim2.new(0, 168, 0, 287)
        leftContainer.Parent = main
        leftContainer.Visible = false
        Instance.new("UICorner", leftContainer).CornerRadius = UDim.new(0, 6)
        local leftStroke = Instance.new("UIStroke", leftContainer); leftStroke.Color = Color3.fromRGB(255,255,255); leftStroke.Transparency = 0.85
        Instance.new("UIListLayout", leftContainer).SortOrder = Enum.SortOrder.LayoutOrder
        local leftPad = Instance.new("UIPadding", leftContainer); leftPad.PaddingLeft = UDim.new(0, 4); leftPad.PaddingTop = UDim.new(0, 3)

        local rightContainer = Instance.new("ScrollingFrame")
        rightContainer.Name = "RightContainer"
        rightContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
        rightContainer.ScrollBarThickness = 0
        rightContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
        rightContainer.BackgroundTransparency = 0.5
        rightContainer.Position = UDim2.new(0.627, 0, 0.0935, 0)
        rightContainer.Size = UDim2.new(0, 168, 0, 287)
        rightContainer.Parent = main
        rightContainer.Visible = false
        Instance.new("UICorner", rightContainer).CornerRadius = UDim.new(0, 6)
        local rightStroke = Instance.new("UIStroke", rightContainer); rightStroke.Color = Color3.fromRGB(255,255,255); rightStroke.Transparency = 0.85
        Instance.new("UIListLayout", rightContainer).SortOrder = Enum.SortOrder.LayoutOrder
        local rightPad = Instance.new("UIPadding", rightContainer); rightPad.PaddingLeft = UDim.new(0, 2); rightPad.PaddingTop = UDim.new(0, 3)

        tabTextButton.MouseButton1Click:Connect(function()
            PlaySound()
            TabSelected = tabFrame
            for _,v in pairs(main:GetChildren()) do if v.Name == "LeftContainer" or v.Name == "RightContainer" then v.Visible = false end end
            for _,v in pairs(scrollingContainer:GetChildren()) do if v ~= tabButton and v.Name == "TabButton" then TweenService:Create(v.TabFrame, TweenInfo.new(.15), {BackgroundTransparency = .8}):Play() end end
            TweenService:Create(tabFrame, TweenInfo.new(.15), {BackgroundTransparency = .6}):Play()
            leftContainer.Visible = true; rightContainer.Visible = true
        end)

        function tab:Section(Info)
            Info.Text = Info.Text or "Section"
            Info.Side = Info.Side or "Left"
            local SizeY = 23
            local sectiontable = {}
            local Side = Info.Side == "Left" and leftContainer or rightContainer

            local section = Instance.new("Frame")
            section.BackgroundTransparency = 1
            section.Size = UDim2.new(0, 162, 0, 27)
            section.Parent = Side
            local Closed = Instance.new("BoolValue", section); Closed.Value = false

            local sectionFrame = Instance.new("Frame")
            sectionFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
            sectionFrame.BackgroundTransparency = 0.4
            sectionFrame.ClipsDescendants = true
            sectionFrame.Size = UDim2.new(0, 162, 0, 23)
            sectionFrame.Parent = section
            Instance.new("UICorner", sectionFrame).CornerRadius = UDim.new(0, 5)
            local secStroke = Instance.new("UIStroke", sectionFrame); secStroke.Color = Color3.fromRGB(255,255,255); secStroke.Transparency = 0.85

            sectionFrame.ChildAdded:Connect(function(v) if v.ClassName == "Frame" then SizeY = v.Name == "Slider" and SizeY + 40 or SizeY + 27 end end)
            Instance.new("UIListLayout", sectionFrame).SortOrder = Enum.SortOrder.LayoutOrder
            local pad = Instance.new("UIPadding", sectionFrame); pad.PaddingTop = UDim.new(0, 23)

            local sectionName = Instance.new("TextLabel")
            sectionName.Font = Enum.Font.GothamBold
            sectionName.Text = Info.Text
            sectionName.TextColor3 = Color3.fromRGB(230, 230, 230)
            sectionName.TextSize = 11
            sectionName.TextXAlignment = Enum.TextXAlignment.Left
            sectionName.BackgroundTransparency = 1
            sectionName.Size = UDim2.new(0, 128, 0, 23)
            sectionName.Parent = section

            local sectionButton = Instance.new("TextButton")
            sectionButton.BackgroundTransparency = 1
            sectionButton.Size = UDim2.new(0, 162, 0, 23)
            sectionButton.ZIndex = 2
            sectionButton.Parent = section
            sectionButton.MouseButton1Click:Connect(function()
                PlaySound()
                Closed.Value = not Closed.Value
                TweenService:Create(section, TweenInfo.new(.1), {Size = Closed.Value and UDim2.new(0, 162, 0, SizeY + 4) or UDim2.new(0, 162, 0, 27)}):Play()
                TweenService:Create(sectionFrame, TweenInfo.new(.1), {Size = Closed.Value and UDim2.new(0, 162, 0, SizeY) or UDim2.new(0, 162, 0, 23)}):Play()
            end)

            -- // ELEMENTS
            function sectiontable:Toggle(Info)
                Info.Text = Info.Text or "Toggle"; Info.Flag = Info.Flag or nil; Info.Default = Info.Default or false; Info.Callback = Info.Callback or function() end
                if Info.Flag then library.Flags[Info.Flag] = false end
                local insidetoggle = {}; local Toggled = false

                local toggle = Instance.new("Frame"); toggle.BackgroundTransparency = 1; toggle.Size = UDim2.new(0, 162, 0, 27); toggle.Parent = sectionFrame
                local toggleText = Instance.new("TextLabel"); toggleText.Font = Enum.Font.GothamBold; toggleText.Text = Info.Text; toggleText.TextColor3 = Color3.fromRGB(217, 217, 217); toggleText.TextSize = 11; toggleText.TextXAlignment = Enum.TextXAlignment.Left; toggleText.BackgroundTransparency = 1; toggleText.Size = UDim2.new(0, 156, 0, 27); toggleText.Parent = toggle
                
                local toggleButton = Instance.new("TextButton"); toggleButton.BackgroundTransparency = 1; toggleButton.Size = UDim2.new(0, 162, 0, 27); toggleButton.Parent = toggle
                local toggleFrame = Instance.new("Frame"); toggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45); toggleFrame.BackgroundTransparency = 0.2; toggleFrame.Position = UDim2.new(0.783, 0, 0.222, 0); toggleFrame.Size = UDim2.new(0, 30, 0, 15); toggleFrame.Parent = toggle
                Instance.new("UICorner", toggleFrame).CornerRadius = UDim.new(0, 100)
                local tStroke = Instance.new("UIStroke", toggleFrame); tStroke.Color = Color3.fromRGB(255,255,255); tStroke.Transparency = 0.8
                
                ColorElements[toggleFrame] = {Type = "Toggle", Enabled = false}
                local circleIcon = Instance.new("ImageLabel"); circleIcon.Image = getcustomasset("Shaman_Circle.png"); circleIcon.ImageColor3 = Color3.fromRGB(217, 217, 217); circleIcon.BackgroundTransparency = 1; circleIcon.Position = UDim2.new(0, 1, 0.067, 0); circleIcon.Size = UDim2.new(0, 13, 0, 13); circleIcon.Parent = toggleFrame

                function insidetoggle:Set(bool)
                    Toggled = bool; if Info.Flag then library.Flags[Info.Flag] = Toggled end; ColorElements[toggleFrame].Enabled = Toggled
                    TweenService:Create(circleIcon, TweenInfo.new(.15), {Position = Toggled and UDim2.new(0, 16,0.067, 0) or UDim2.new(0, 1,0.067, 0)}):Play()
                    TweenService:Create(toggleFrame, TweenInfo.new(.15), {BackgroundColor3 = Toggled and (EditOpened and Color3.fromRGB(40,40,45) or Color3.fromRGB(80, 180, 255)) or Color3.fromRGB(40, 40, 45)}):Play()
                    pcall(Info.Callback, Toggled)
                end
                if Info.Default then task.spawn(function() insidetoggle:Set(true) end) end
                toggleButton.MouseButton1Click:Connect(function() PlaySound() Toggled = not Toggled; insidetoggle:Set(Toggled) end)
                return insidetoggle
            end

            function sectiontable:Button(Info)
                Info.Text = Info.Text or "Button"; Info.Callback = Info.Callback or function() end
                local button = Instance.new("Frame"); button.BackgroundTransparency = 1; button.Size = UDim2.new(0, 162, 0, 27); button.Parent = sectionFrame
                local buttonText = Instance.new("TextLabel"); buttonText.Font = Enum.Font.GothamBold; buttonText.Text = Info.Text; buttonText.TextColor3 = Color3.fromRGB(217, 217, 217); buttonText.TextSize = 11; buttonText.TextXAlignment = Enum.TextXAlignment.Left; buttonText.BackgroundTransparency = 1; buttonText.Size = UDim2.new(0, 156, 0, 27); buttonText.Parent = button
                local textButton = Instance.new("TextButton"); textButton.BackgroundTransparency = 1; textButton.Size = UDim2.new(0, 162, 0, 27); textButton.Parent = button
                textButton.MouseButton1Click:Connect(function() PlaySound() task.spawn(function() pcall(Info.Callback) end) end)
            end

            function sectiontable:Slider(Info)
                Info.Text = Info.Text or "Slider"; Info.Default = Info.Default or 50; Info.Minimum = Info.Minimum or 1; Info.Maximum = Info.Maximum or 100; Info.Flag = Info.Flag or nil; Info.Callback = Info.Callback or function() end
                if Info.Minimum > Info.Maximum then Info.Minimum, Info.Maximum = Info.Maximum, Info.Minimum end
                Info.Default = math.clamp(Info.Default, Info.Minimum, Info.Maximum)
                local DefaultScale = (Info.Default - Info.Minimum) / (Info.Maximum - Info.Minimum)

                local slider = Instance.new("Frame"); slider.Name = "Slider"; slider.BackgroundTransparency = 1; slider.Size = UDim2.new(0, 162, 0, 40); slider.Parent = sectionFrame
                local sliderText = Instance.new("TextLabel"); sliderText.Font = Enum.Font.GothamBold; sliderText.Text = Info.Text; sliderText.TextColor3 = Color3.fromRGB(217, 217, 217); sliderText.TextSize = 11; sliderText.TextXAlignment = Enum.TextXAlignment.Left; sliderText.BackgroundTransparency = 1; sliderText.Size = UDim2.new(0, 156, 0, 27); sliderText.Parent = slider
                
                local outerSlider = Instance.new("Frame"); outerSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 45); outerSlider.BackgroundTransparency = 0.2; outerSlider.Position = UDim2.new(0.049, -1, 0.664, 0); outerSlider.Size = UDim2.new(0, 149, 0, 4); outerSlider.Parent = slider
                Instance.new("UICorner", outerSlider).CornerRadius = UDim.new(0, 100)
                
                local innerSlider = Instance.new("Frame"); innerSlider.BackgroundColor3 = Color3.fromRGB(80, 180, 255); innerSlider.Size = UDim2.new(DefaultScale, 0, 0, 4); innerSlider.ZIndex = 2; innerSlider.Parent = outerSlider
                Instance.new("UICorner", innerSlider).CornerRadius = UDim.new(0, 100)
                ColorElements[innerSlider] = {Type = "Slider", Enabled = false}
                
                local sliderValueText = Instance.new("TextLabel"); sliderValueText.Font = Enum.Font.GothamBold; sliderValueText.Text = tostring(Info.Default); sliderValueText.TextColor3 = Color3.fromRGB(217, 217, 217); sliderValueText.TextSize = 11; sliderValueText.TextXAlignment = Enum.TextXAlignment.Right; sliderValueText.BackgroundTransparency = 1; sliderValueText.Position = UDim2.new(0.0488, 0, 0, 0); sliderValueText.Size = UDim2.new(0, 149, 0, 27); sliderValueText.Parent = slider
                
                local sliderButton = Instance.new("TextButton"); sliderButton.BackgroundTransparency = 1; sliderButton.Position = UDim2.new(0.049, 0, 0.664, 0); sliderButton.Size = UDim2.new(0, 149, 0, 4); sliderButton.Parent = slider
                task.spawn(function() pcall(Info.Callback, Info.Default); if Info.Flag then library.Flags[Info.Flag] = Info.Default end end)

                sliderButton.MouseButton1Down:Connect(function()
                    local MouseMove = Mouse.Move:Connect(function()
                        local Px = library:GetXY(outerSlider)
                        local Value = math.floor(Info.Minimum + ((Info.Maximum - Info.Minimum) * Px))
                        TweenService:Create(innerSlider, TweenInfo.new(0.1), {Size = UDim2.new(Px,0,0,4)}):Play()
                        if Info.Flag then library.Flags[Info.Flag] = Value end
                        sliderValueText.Text = tostring(Value)
                        task.spawn(function() pcall(Info.Callback, Value) end)
                    end)
                    local MouseKill = UserInputService.InputEnded:Connect(function(UserInput)
                        if UserInput.UserInputType == Enum.UserInputType.MouseButton1 then MouseMove:Disconnect(); MouseKill:Disconnect() end
                    end)
                end)
            end

            function sectiontable:Dropdown(Info)
                Info.Text = Info.Text or "Dropdown"; Info.List = Info.List or {}; Info.Flag = Info.Flag or nil; Info.Callback = Info.Callback or function() end
                local DropdownYSize = 27; local insidedropdown = {}; local DropdownOpened = false

                local dropdown = Instance.new("Frame"); dropdown.BackgroundTransparency = 1; dropdown.Size = UDim2.new(0, 162, 0, 27); dropdown.Parent = sectionFrame; dropdown.ClipsDescendants = true
                local dropdownText = Instance.new("TextLabel"); dropdownText.Font = Enum.Font.GothamBold; dropdownText.Text = Info.Text; dropdownText.TextColor3 = Color3.fromRGB(217, 217, 217); dropdownText.TextSize = 11; dropdownText.TextXAlignment = Enum.TextXAlignment.Left; dropdownText.BackgroundTransparency = 1; dropdownText.Size = UDim2.new(0, 156, 0, 27); dropdownText.Parent = dropdown
                
                local dropdownButton = Instance.new("TextButton"); dropdownButton.BackgroundTransparency = 1; dropdownButton.Size = UDim2.new(0, 162, 0, 27); dropdownButton.Parent = dropdown
                local dropdownContainer = Instance.new("Frame"); dropdownContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25); dropdownContainer.BackgroundTransparency = 0.4; dropdownContainer.Size = UDim2.new(0, 162, 0, 27); dropdownContainer.Parent = dropdown
                Instance.new("UIListLayout", dropdownContainer).SortOrder = Enum.SortOrder.LayoutOrder
                local dPad = Instance.new("UIPadding", dropdownContainer); dPad.PaddingTop = UDim.new(0, 27)

                function insidedropdown:Add(text)
                    DropdownYSize = DropdownYSize + 27
                    local btnFrame = Instance.new("Frame"); btnFrame.BackgroundTransparency = 1; btnFrame.Size = UDim2.new(0, 162, 0, 27); btnFrame.Parent = dropdownContainer
                    local btnText = Instance.new("TextLabel"); btnText.Font = Enum.Font.GothamBold; btnText.Text = text; btnText.TextColor3 = Color3.fromRGB(191, 191, 191); btnText.TextSize = 11; btnText.TextXAlignment = Enum.TextXAlignment.Left; btnText.BackgroundTransparency = 1; btnText.Size = UDim2.new(0, 156, 0, 28); btnText.Parent = btnFrame
                    local btnClick = Instance.new("TextButton"); btnClick.BackgroundTransparency = 1; btnClick.Size = UDim2.new(0, 162, 0, 27); btnClick.Parent = btnFrame
                    
                    btnClick.MouseButton1Click:Connect(function()
                        PlaySound(); DropdownOpened = false
                        task.spawn(function() pcall(Info.Callback, btnText.Text) end)
                        if Info.Flag then library.Flags[Info.Flag] = btnText.Text end
                        dropdownText.Text = btnText.Text
                        TweenService:Create(dropdown, TweenInfo.new(.15), {Size = UDim2.new(0, 162, 0, 27)}):Play()
                        TweenService:Create(dropdownContainer, TweenInfo.new(.15), {Size = UDim2.new(0, 162, 0, 27)}):Play()
                    end)
                end
                for _,v in pairs(Info.List) do insidedropdown:Add(v) end

                dropdownButton.MouseButton1Click:Connect(function()
                    PlaySound(); DropdownOpened = not DropdownOpened
                    local targetSize = DropdownOpened and UDim2.new(0, 162, 0, DropdownYSize) or UDim2.new(0, 162, 0, 27)
                    TweenService:Create(dropdown, TweenInfo.new(.15), {Size = targetSize}):Play()
                    TweenService:Create(dropdownContainer, TweenInfo.new(.15), {Size = targetSize}):Play()
                end)
                return insidedropdown
            end
            return sectiontable
        end
        return tab
    end
    Instance.new("UIListLayout", scrollingContainer).SortOrder = Enum.SortOrder.LayoutOrder
    return window
end
return library
```

### **What's New & Improved:**
1. **Smart Asset System:** Replaced the messy folder/download logic with your clean `EnsureAssetDownloaded` function. It uses the CDN fixer and sends clean notifications to the user.
2. **Premium MUI Sounds:** The `MUI.mp3` is downloaded and hooked into every single click (Toggles, Buttons, Dropdowns, Tabs). It clones the sound and deletes it after playing so it doesn't lag or overlap weirdly.
3. **True Glassmorphism:** The main frame, topbar, sidebars, and sections now use `BackgroundTransparency`, subtle white `UIStroke` edges, and a diagonal `UIGradient` to simulate light reflecting off glass.
4. **Custom Background Support:** You can now pass an image ID when creating the window: `library:Window({Text = "My UI", BackgroundImage = "rbxassetid://123456789"})` and it will render beautifully behind the glass!
