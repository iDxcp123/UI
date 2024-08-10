local Library = {}

function Library:Window(Name, Color, SizeY)
    local CoreGui = game:GetService("CoreGui")
    local UserInput = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local ScreenGui = Instance.new("ScreenGui")
    local Drag = Instance.new("Frame")
    local Main = Instance.new("Frame")
    local Frame = Instance.new("Frame")
    local Heading = Instance.new("Frame")
    local LabelListLayout = Instance.new("UIListLayout")
    local Title = Instance.new("TextLabel")
    local Background = Instance.new("Frame")
    local Content = Instance.new("Frame")
    local TabsListLayout = Instance.new("UIListLayout")
    local Tabs = Instance.new("Frame")
    local oldTab
    getgenv().WindowThemeColor = Color

    for _, gui in next, CoreGui:GetChildren() do
        if gui.Name == Name then
            gui:Destroy()
        end
    end

    ScreenGui.Name = Name
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 1000000000
    ScreenGui.ResetOnSpawn = false

    Drag.Name = "Drag"
    Drag.Parent = ScreenGui
    Drag.Active = true
    Drag.Draggable = true
    Drag.BackgroundColor3 = Color3.new(0.0509804, 0.0509804, 0.0509804)
    Drag.BorderColor3 = Color3.new(0, 0, 0)
    Drag.Position = UDim2.new(0.355398446, 0, 0.184466019, 0)
    Drag.Size = UDim2.new(0, 513, 0, 27)

    Main.Name = "Main"
    
local UIS = game:GetService("UserInputService")
local dragToggle = nil
local dragSpeed = 0.25
local dragInput = nil
local dragStart = nil
local startPos = nil

local function updateInput(input)
    local delta = input.Position - dragStart
    local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    Main.Position = newPosition
end

Drag.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

Drag.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragToggle then
        updateInput(input)
    end
end)
Main.Parent = Drag
    Main.Active = true
    Main.BackgroundColor3 = Color3.new(0.0509804, 0.0509804, 0.0509804)
    Main.BorderColor3 = Color3.new(0, 0, 0)
    Main.Position = UDim2.new(-0.001, 0, 0.023466019, 0)
    Main.Size = UDim2.new(0, 513, 0, SizeY)

    Frame.Parent = Main
    Frame.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
    Frame.BorderColor3 = Color3.new(0, 0, 0)
    Frame.Position = UDim2.new(0.0137524558, 0, 0.0470383018, 0)
    Frame.Size = UDim2.new(0, 499, 0, Main.Size.Y.Offset - 38)

    Heading.Name = "Heading"
    Heading.Parent = Main
    Heading.BackgroundColor3 = Color3.new(1, 1, 1)
    Heading.BackgroundTransparency = 1
    Heading.BorderColor3 = Color3.new(0, 0, 0)
    Heading.BorderSizePixel = 0
    Heading.Position = UDim2.new(0.023499012, 0, 0, 0)
    Heading.Size = UDim2.new(0, 494, 0, 27)

    LabelListLayout.Parent = Heading
    LabelListLayout.FillDirection = Enum.FillDirection.Horizontal
    LabelListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    LabelListLayout.Padding = UDim.new(0, 9)

    Title.Name = "Title"
    Title.Parent = Heading
    Title.BackgroundColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.0137524558, 0, 0.00199999125, 0)
    Title.Size = UDim2.new(0, #Name * 6.833333333333333, 0, 23)
    Title.Font = Enum.Font.Code
    Title.Text = Name
    Title.TextSize = 14
    Title.TextColor3 = Color3.new(0.490196, 0.490196, 0.490196)
    Title.TextStrokeTransparency = 0.4
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Background.Name = "Background"
    Background.Parent = Frame
    Background.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.141176)
    Background.BorderColor3 = Color3.new(0, 0, 0)
    Background.Position = UDim2.new(0.0155808367, 0, 0.0434783697, 0)
    Background.Size = UDim2.new(0, 483, 0, Frame.Size.Y.Offset - 34)

    Content.Name = "Content"
    Content.Parent = Background
    Content.BackgroundColor3 = Color3.new(0, 0, 0)
    Content.BackgroundTransparency = 1
    Content.BorderSizePixel = 0
    Content.Position = UDim2.new(0.0124223605, 0, 0.0099593997, 0)
    Content.Size = UDim2.new(0, 470, 0, Background.Size.Y.Offset - 11)

    Tabs.Parent = Frame
    Tabs.BackgroundColor3 = Color3.new(1, 1, 1)
    Tabs.BackgroundTransparency = 1
    Tabs.BorderColor3 = Color3.new(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0.0276048928, 0, 0, 0)
    Tabs.Size = UDim2.new(0, 476, 0, 23)

    TabsListLayout.Parent = Tabs
    TabsListLayout.FillDirection = Enum.FillDirection.Horizontal
    TabsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabsListLayout.Padding = UDim.new(0, 5)

    local function tweenProp(Inst, Property)
        return game:GetService("TweenService"):Create(Inst, TweenInfo.new(0.5, Enum.EasingStyle.Quint), Property):Play()
    end

    RunService.RenderStepped:Connect(function()
        wait()
        framePosLeft = 1
        framePosRight = 1
        for _, frame in next, Content:GetChildren() do
            frame.Position = UDim2.new(-0.00377,0,0,framePosLeft - 2)
            framePosLeft = framePosLeft + frame.Size.Y.Offset + 5
            if Content.Size.Y.Offset - framePosLeft + 7 < 0 then
                frame.Position = UDim2.new(0.507,0,0,-1)
            end
            if frame.Position.X.Scale >= 0.507 then
                frame.Position = UDim2.new(0.507,0,0,framePosRight - 2)
                framePosRight = framePosRight + frame.Size.Y.Offset + 5
            end
        end
        ZIndexNum = 0
        ZIndexMax = 0
        for _, func in next, Content:GetDescendants() do
            if func.Name == "Section" or func.Name == "Dropdown" or func.Name == "Color" then
                ZIndexMax = ZIndexMax + 1
            end
        end
        for _, func in next, Content:GetDescendants() do
            if func.Name == "Section" or func.Name == "Dropdown" or func.Name == "Color" then
                func.ZIndex = 2 + (ZIndexMax-ZIndexNum)
                ZIndexNum = ZIndexNum + 1
            end
        end
    end)

    spawn(function()
        TabCounter = 0
        function altersize(tab)
            textcounter = 0
            for i=1,#tab.Text do
                textcounter = textcounter + 7.9
            end
            tab.Size = UDim2.new(0, textcounter, 0, tab.Size.Y.Offset)
        end
        while TabCounter == 0 do
            for _, tab in next, Tabs:GetChildren() do
                if tab:IsA("TextButton") then
                    altersize(tab)
                    TabCounter = TabCounter + 1
                    if TabCounter == 1 then
                        tab.TextColor3 = Color3.fromRGB(255,255,255)
                        for _, section in next, tab.Contents:GetChildren() do
                            oldTab = tab
                            section.Visible = true
                            section.Parent = Content
                        end
                    else
                        tab.TextColor3 = Color3.fromRGB(125,125,125)
                    end
                end
            end
        end
    end)

    local WindowLibrary = {}

    function WindowLibrary:Label(Name, Color)
        local Label = Instance.new("TextLabel")
        local Differ = Instance.new("TextLabel")

        Differ.Name = "Differ"
        Differ.Parent = Heading
        Differ.BackgroundColor3 = Color3.new(1, 1, 1)
        Differ.BackgroundTransparency = 1
        Differ.Position = UDim2.new(0.0137524558, 0, 0.00199999125, 0)
        Differ.Size = UDim2.new(0, 6, 0, 23)
        Differ.Font = Enum.Font.Code
        Differ.Text = "|"
        Differ.TextColor3 = Color3.fromRGB(255, 255, 255)
        Differ.TextSize = 14
        Differ.TextStrokeTransparency = 0.4
        Differ.TextXAlignment = Enum.TextXAlignment.Left

        Label.Name = "Label"
        Label.Parent = Heading
        Label.BackgroundColor3 = Color3.new(1, 1, 1)
        Label.BackgroundTransparency = 1
        Label.Position = UDim2.new(0.0137524558, 0, 0.00199999125, 0)
        Label.Size = UDim2.new(0, #Name * 6.833333333333333, 0, 23)
        Label.Font = Enum.Font.Code
        Label.Text = Name
        Label.TextColor3 = Color
        Label.TextSize = 14
        Label.TextStrokeTransparency = 0.4
        Label.TextXAlignment = Enum.TextXAlignment.Left
    end

    function WindowLibrary:Tab(Name)
        local Tab = Instance.new("TextButton")
        local Contents = Instance.new("Folder")

        Tab.Name = "Tab"
        Tab.Parent = Tabs
        Tab.BackgroundColor3 = Color3.new(1, 1, 1)
        Tab.BackgroundTransparency = 1
        Tab.Size = UDim2.new(0, 24, 0, 23)
        Tab.AutoButtonColor = false
        Tab.Font = Enum.Font.Code
        Tab.Text = Name
        Tab.TextColor3 = Color3.new(1, 1, 1)
        Tab.TextSize = 14
        Tab.TextStrokeTransparency = 0.4

        Contents.Name = "Contents"
        Contents.Parent = Tab

        Tab.MouseButton1Click:Connect(function()
            for _, tab in next, Tabs:GetChildren() do
                if tab:IsA("TextButton") then
                    if tab ~= Tab then
                        tweenProp(tab, {TextColor3 = Color3.fromRGB(125,125,125)})
                        for _, section in next, Content:GetChildren() do
                            if section:IsA("Frame") then
                                section.Visible = false
                                section.Parent = oldTab.Contents
                            end
                        end
                    end
                end
            end
            tweenProp(Tab, {TextColor3 = Color3.fromRGB(255, 255, 255)})
            for _, section in next, Contents:GetChildren() do
                oldTab = Tab
                section.Visible = true
                section.Parent = Content
            end
        end)

        local SectionLibrary = {}

        function SectionLibrary:Section(Name)
            local Section = Instance.new("Frame")
            local SectionContents = Instance.new("Frame")
            local SectionTitle = Instance.new("TextLabel")
            local SectionListLayout = Instance.new("UIListLayout")

            Section.Name = "Section"
            Section.Parent = Contents
            Section.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
            Section.BorderColor3 = Color3.new(0, 0, 0)
            Section.Position = UDim2.new(0.0120000001, 0, 0.00899999961, 0)
            Section.Size = UDim2.new(0, 235, 0, 247)
            Section.ZIndex = 0
            Section.Visible = false

            SectionContents.Name = "Contents"
            SectionContents.Parent = Section
            SectionContents.BackgroundColor3 = Color3.new(0.145098, 0.145098, 0.145098)
            SectionContents.BackgroundTransparency = 1
            SectionContents.BorderSizePixel = 0
            SectionContents.Position = UDim2.new(0.0278463159, 0, 0.0322874375, 0)
            SectionContents.Size = UDim2.new(0, 220, 0, 84)

            SectionTitle.Name = "Title"
            SectionTitle.Parent = SectionContents
            SectionTitle.BackgroundColor3 = Color3.new(1, 1, 1)
            SectionTitle.BackgroundTransparency = 1
            SectionTitle.Position = UDim2.new(0.0260000005, 0, -1.05768967, 0)
            SectionTitle.Size = UDim2.new(0, 178, 0, 12)
            SectionTitle.Font = Enum.Font.Code
            SectionTitle.Text = Name
            SectionTitle.TextColor3 = Color3.new(1, 1, 1)
            SectionTitle.TextSize = 14
            SectionTitle.TextStrokeTransparency = 0.4
            SectionTitle.TextXAlignment = Enum.TextXAlignment.Left

            SectionListLayout.Parent = SectionContents
            SectionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            SectionListLayout.Padding = UDim.new(0.100000001, 0)

            RunService.RenderStepped:Connect(function()
                wait()
                FuncSize = 0
                for _, func in next, SectionContents:GetChildren() do
                    if func:IsA("TextLabel") or func:IsA("TextButton") then
                        FuncSize = FuncSize + 9 + func.Size.Y.Offset
                    end
                end
                Section.Size = UDim2.new(0,Section.Size.X.Offset,0,FuncSize)
            end)

            local Functions = {}

            function Functions:Button(Name, Func)
                local Button = Instance.new("TextButton")
                getgenv()[Name] = false

                Button.Name = "Button"
                Button.Parent = SectionContents
                Button.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
                Button.BorderColor3 = Color3.new(0, 0, 0)
                Button.Position = UDim2.new(-0.00888097659, 0, 0.284795314, 0)
                Button.Size = UDim2.new(0, 223, 0, 18)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Code
                Button.Text = Name
                Button.TextColor3 = Color3.new(1, 1, 1)
                Button.TextSize = 14
                Button.TextStrokeTransparency = 0.4

                Button.MouseButton1Click:Connect(Func)
            end

            function Functions:Toggle(Name, Func)
                local Toggle = Instance.new("TextButton")
                local TextLabel = Instance.new("TextLabel")

                Toggle.Name = "Toggle"
                Toggle.Parent = SectionContents
                Toggle.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
                Toggle.BorderColor3 = Color3.new(0, 0, 0)
                Toggle.Position = UDim2.new(-0.00888097659, 0, 0.284795314, 0)
                Toggle.Size = UDim2.new(0, 13, 0, 13)
                Toggle.AutoButtonColor = false
                Toggle.Font = Enum.Font.Code
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.new(1, 1, 1)
                Toggle.TextSize = 14
                Toggle.TextStrokeTransparency = 0.4

                TextLabel.Parent = Toggle
                TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Position = UDim2.new(1.67999995, 0, -0.0149999997, 0)
                TextLabel.Size = UDim2.new(0, 199, 0, 13)
                TextLabel.Font = Enum.Font.Code
                TextLabel.Text = Name
                TextLabel.TextColor3 = Color3.new(0.301961, 0.301961, 0.301961)
                TextLabel.TextSize = 14
                TextLabel.TextStrokeTransparency = 0.4
                TextLabel.TextXAlignment = Enum.TextXAlignment.Left

                Toggle.MouseButton1Click:Connect(function()
                    if getgenv()[Name] then
                        tweenProp(Toggle, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)})
                        tweenProp(TextLabel, {TextColor3 = Color3.fromRGB(77, 77, 77)})
                    else
                        tweenProp(Toggle, {BackgroundColor3 = getgenv().WindowThemeColor})
                        tweenProp(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)})
                    end
                    getgenv()[Name] = not getgenv()[Name]
                    Func(getgenv()[Name])
                end)
            end

            function Functions:Color(Name, Default, Func)
                local Color = Instance.new("TextLabel")
                local TextButton = Instance.new("TextButton")
                local Main = Instance.new("Frame")
                local Picker = Instance.new("Frame")
                local Gradient = Instance.new("ImageLabel")
                local Cursor = Instance.new("Frame")
                local Vertical = Instance.new("Frame")
                local Horizontal = Instance.new("Frame")
                local R = Instance.new("TextBox")
                local G = Instance.new("TextBox")
                local B = Instance.new("TextBox")
                local Rainbow = Instance.new("TextButton")
                local TextLabel = Instance.new("TextLabel")

                Color.Name = "Color"
                Color.Parent = SectionContents
                Color.BackgroundColor3 = Color3.new(1, 1, 1)
                Color.BackgroundTransparency = 1
                Color.Position = UDim2.new(1.67999995, 0, -0.0149999997, 0)
                Color.Size = UDim2.new(0, 199, 0, 11)
                Color.ZIndex = 2
                Color.Font = Enum.Font.Code
                Color.Text = Name
                Color.TextColor3 = Color3.new(1, 1, 1)
                Color.TextSize = 14
                Color.TextStrokeTransparency = 0.40000000596046
                Color.TextXAlignment = Enum.TextXAlignment.Left

                TextButton.Parent = Color
                TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
                TextButton.BorderColor3 = Color3.new(0, 0, 0)
                TextButton.Position = UDim2.new(1.05142057, 0, -0.0228970051, 0)
                TextButton.Size = UDim2.new(0, 13, 0, 13)
                TextButton.AutoButtonColor = false
                TextButton.Font = Enum.Font.Code
                TextButton.Text = ""
                TextButton.TextColor3 = Color3.new(1, 1, 1)
                TextButton.TextSize = 14
                TextButton.TextStrokeTransparency = 0

                Main.Name = "Main"
                Main.Parent = Color
                Main.BackgroundColor3 = Color3.new(1, 1, 1)
                Main.BackgroundTransparency = 1
                Main.BorderSizePixel = 0
                Main.ClipsDescendants = true
                Main.Position = UDim2.new(0.562814057, 0, 1.61538458, 0)
                Main.Size = UDim2.new(0, 111, 0, 0)
                Main.Visible = false

                Picker.Name = "Picker"
                Picker.Parent = Main
                Picker.Active = true
                Picker.AnchorPoint = Vector2.new(0.5, 0.5)
                Picker.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
                Picker.BorderColor3 = Color3.new(0, 0, 0)
                Picker.Position = UDim2.new(0.5, 0, 0.5, 0)
                Picker.Size = UDim2.new(0, 109, 0, 142)
                Picker.Visible = true
                Picker.SizeConstraint = Enum.SizeConstraint.RelativeYY

                Gradient.Name = "Gradient"
                Gradient.Parent = Picker
                Gradient.AnchorPoint = Vector2.new(0.5, 0.5)
                Gradient.BackgroundColor3 = Color3.new(1, 1, 1)
                Gradient.BorderColor3 = Color3.new(0.627451, 0.627451, 0.627451)
                Gradient.BorderSizePixel = 0
                Gradient.ClipsDescendants = true
                Gradient.Position = UDim2.new(0.5, 0, 0.349999994, 0)
                Gradient.Size = UDim2.new(0.649999976, 0, 0.649999976, 0)
                Gradient.SizeConstraint = Enum.SizeConstraint.RelativeYY
                Gradient.Image = "rbxassetid://328298876"

                Cursor.Name = "Cursor"
                Cursor.Parent = Gradient
                Cursor.BackgroundColor3 = Color3.new(1, 1, 1)
                Cursor.BorderColor3 = Color3.new(0, 0, 0)
                Cursor.BorderSizePixel = 0
                Cursor.Position = UDim2.new(1, -1, 0, 1)
                Cursor.ZIndex = 2

                Vertical.Name = "Vertical"
                Vertical.Parent = Cursor
                Vertical.AnchorPoint = Vector2.new(0.5, 0.5)
                Vertical.BackgroundColor3 = Color3.new(0, 0, 0)
                Vertical.BorderColor3 = Color3.new(0, 0, 0)
                Vertical.BorderSizePixel = 0
                Vertical.Size = UDim2.new(0, 2, 0, 20)
                Vertical.ZIndex = 2

                Horizontal.Name = "Horizontal"
                Horizontal.Parent = Cursor
                Horizontal.AnchorPoint = Vector2.new(0.5, 0.5)
                Horizontal.BackgroundColor3 = Color3.new(0, 0, 0)
                Horizontal.BorderColor3 = Color3.new(0, 0, 0)
                Horizontal.BorderSizePixel = 0
                Horizontal.Size = UDim2.new(0, 20, 0, 2)
                Horizontal.ZIndex = 2

                R.Name = "R"
                R.Parent = Picker
                R.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
                R.BorderColor3 = Color3.new(0, 0, 0)
                R.Position = UDim2.new(0.0299999993, 0, 0.862999976, 0)
                R.Size = UDim2.new(0, 31, 0, 15)
                R.Font = Enum.Font.Code
                R.PlaceholderColor3 = Color3.new(0.764706, 0.764706, 0.764706)
                R.PlaceholderText = "R"
                R.Text = ""
                R.TextColor3 = Color3.new(1, 1, 1)
                R.TextSize = 14

                G.Name = "G"
                G.Parent = Picker
                G.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
                G.BorderColor3 = Color3.new(0, 0, 0)
                G.Position = UDim2.new(0.360000014, 0, 0.862999976, 0)
                G.Size = UDim2.new(0, 31, 0, 15)
                G.Font = Enum.Font.Code
                G.PlaceholderColor3 = Color3.new(0.764706, 0.764706, 0.764706)
                G.PlaceholderText = "G"
                G.Text = ""
                G.TextColor3 = Color3.new(1, 1, 1)
                G.TextSize = 14

                B.Name = "B"
                B.Parent = Picker
                B.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
                B.BorderColor3 = Color3.new(0, 0, 0)
                B.Position = UDim2.new(0.685000002, 0, 0.862999976, 0)
                B.Size = UDim2.new(0, 31, 0, 15)
                B.Font = Enum.Font.Code
                B.PlaceholderColor3 = Color3.new(0.764706, 0.764706, 0.764706)
                B.PlaceholderText = "B"
                B.Text = ""
                B.TextColor3 = Color3.new(1, 1, 1)
                B.TextSize = 14

                Rainbow.Name = "Rainbow"
                Rainbow.Parent = Picker
                Rainbow.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
                Rainbow.BorderColor3 = Color3.new(0, 0, 0)
                Rainbow.Position = UDim2.new(0.0469999984, 0, 0.720000029, 0)
                Rainbow.Size = UDim2.new(0, 13, 0, 13)
                Rainbow.AutoButtonColor = false
                Rainbow.Font = Enum.Font.Code
                Rainbow.Text = ""
                Rainbow.TextColor3 = Color3.new(1, 1, 1)
                Rainbow.TextSize = 14
                Rainbow.TextStrokeTransparency = 0

                TextLabel.Parent = Rainbow
                TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Position = UDim2.new(1.83384347, 0, -0.0150005631, 0)
                TextLabel.Size = UDim2.new(0, 67, 0, 13)
                TextLabel.Font = Enum.Font.Code
                TextLabel.Text = "Rainbow"
                TextLabel.TextColor3 = Color3.new(0.301961, 0.301961, 0.301961)
                TextLabel.TextSize = 14
                TextLabel.TextStrokeTransparency = 0.40000000596046
                TextLabel.TextXAlignment = Enum.TextXAlignment.Left

                local Player = game:GetService("Players").LocalPlayer
                local Mouse = Player:GetMouse()
                local Down = false

                local function SanitizeNumber(value, rgbValue, isHue)
                    if value then
                        value = (value ~= value and 0) or (tonumber(value) or 0)
                        
                        if isHue then
                            return math.clamp(value, 0, 360)
                        else
                            return math.clamp(value, 0, (rgbValue and 255 or 1))
                        end
                    end
                end

                local function UpdateColorWithRGB()
                    local color = Color3.fromRGB(tonumber(R.Text), tonumber(G.Text), tonumber(B.Text))
                    TextButton.BackgroundColor3 = color
                    Func(color)
                    
                    return color
                end

                local function UpdateFillIns(color)
                    if color then
                        local h, s, v = Color3.toHSV(color)
                        local r, g, b = math.floor(color.r * 255 + 0.5), math.floor(color.g * 255 + 0.5), math.floor(color.b * 255 + 0.5)
                        
                        R.Text = r
                        G.Text = g
                        B.Text = b
                        
                        local gradientSize = Gradient.AbsoluteSize
                        local sizeScale = 360 / gradientSize.X
                        Cursor.Position = UDim2.new(0, gradientSize.X - (h * 360) / sizeScale, 0, gradientSize.Y - (s * 360) / sizeScale)
                    end
                end

                local function GetColor()
                    local mousePosition = Vector2.new(Mouse.X, Mouse.Y)
                    local gradientPosition = Gradient.AbsolutePosition
                    local gradientSize = Gradient.AbsoluteSize
                    
                    if (mousePosition.X < (gradientPosition.X + gradientSize.X) and mousePosition.X > gradientPosition.X) and (mousePosition.Y < (gradientPosition.Y + gradientSize.Y) and mousePosition.Y > gradientPosition.Y) then
                        local gradientSize = Gradient.AbsoluteSize
                        UserInput.MouseIconEnabled = false
                        
                        local sizeScale = 360 / gradientSize.X
                        local offset = Vector2.new(Mouse.X, Mouse.Y) - (Gradient.AbsolutePosition + gradientSize / 2)
                        
                        local hue = math.abs((offset.X * sizeScale - 180) / 360)
                        local saturation = math.abs((offset.Y * sizeScale - 180) / 360)
                        local color = Color3.fromHSV(hue, saturation, 1)
                        
                        TextButton.BackgroundColor3 = color
                        Func(color)
                        Cursor.Position = UDim2.new(0, math.clamp(offset.X + gradientSize.X / 2, 0, gradientSize.X), 0, math.clamp(offset.Y + gradientSize.Y / 2, 0, gradientSize.Y))
                        
                        return color
                    end
                    
                    UserInput.MouseIconEnabled = true
                    return nil
                end

                spawn(function()
                    repeat
                        wait()
                        if getgenv()[Name] then
                            for Hue = 0,1,0.0023 do
                                wait(0.1)
                                getgenv()[Name .. "Rainbow"] = Color3.fromHSV(Hue,1,1)
                            end
                        end
                    until false
                end)

                if Default and type(Default) == "userdata" then
                    UpdateFillIns(Default)
                else
                    Func = Default
                    UpdateFillIns(Color3.fromRGB(255,255,255))
                end
                UpdateColorWithRGB()

                TextButton.MouseButton1Click:Connect(function()
                    if Main.Visible then
                        tweenProp(Main, {Size = UDim2.new(0, 111, 0, 0)})
                        wait(0.4)
                        Main.Visible = false
                    else
                        Main.Visible = true
                        tweenProp(Main, {Size = UDim2.new(0, 111, 0, 144)})
                    end
                end)

                Rainbow.MouseButton1Click:Connect(function()
                    if getgenv()[Name] then
                        tweenProp(Rainbow, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)})
                        tweenProp(TextLabel, {TextColor3 = Color3.fromRGB(77, 77, 77)})
                        counter = 0
                    else
                        tweenProp(Rainbow, {BackgroundColor3 = getgenv().WindowThemeColor})
                        tweenProp(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)})
                    end
                    getgenv()[Name] = not getgenv()[Name]
                end)

                spawn(function()
                    RunService.RenderStepped:Connect(function()
                        if getgenv()[Name] then
                            wait()
                            UpdateFillIns(getgenv()[Name .. "Rainbow"])
                        end
                    end)
                end)

                Mouse.Move:Connect(function()
                    if UserInput:IsMouseButtonPressed(0) and Main.Visible then
                        UpdateFillIns(GetColor())
                    else
                        UserInput.MouseIconEnabled = true
                    end
                end)

                R:GetPropertyChangedSignal("Text"):Connect(function()
                    local text = R.Text
                            
                    if #text ~= 0 then
                        R.Text = SanitizeNumber(text, true)
                        UpdateFillIns(UpdateColorWithRGB())
                    end
                end)
                        
                 G:GetPropertyChangedSignal("Text"):Connect(function()
                    local text = G.Text
                    
                    if #text ~= 0 then
                        G.Text = SanitizeNumber(text, true)
                        UpdateFillIns(UpdateColorWithRGB())
                    end
                end)
                        
                B:GetPropertyChangedSignal("Text"):Connect(function()
                    local text = B.Text
                            
                    if #text ~= 0 then
                        B.Text = SanitizeNumber(text, true)
                        UpdateFillIns(UpdateColorWithRGB())
                    end
                end)
            end

            function Functions:Dropdown(...)
                local Dropdown = Instance.new("TextLabel")
                local Button = Instance.new("TextButton")
                local Frame = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")

                for _, Data in next, {...} do
                    FuncType = type(Data)
                    if FuncType == "table" then
                        FuncData = Data
                    elseif FuncType == "function" then
                        Func = Data
                    elseif FuncType == "string" then 
                        Name = Data
                    end
                end

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = SectionContents
                Dropdown.BackgroundColor3 = Color3.new(1, 1, 1)
                Dropdown.BackgroundTransparency = 1
                Dropdown.Position = UDim2.new(0, 0, 2.39047599, 0)
                Dropdown.Size = UDim2.new(0, 178, 0, 39)
                Dropdown.ZIndex = 2
                Dropdown.Font = Enum.Font.Code
                Dropdown.Text = Name
                Dropdown.TextColor3 = Color3.new(1, 1, 1)
                Dropdown.TextSize = 14
                Dropdown.TextStrokeTransparency = 0.40000000596046
                Dropdown.TextXAlignment = Enum.TextXAlignment.Left
                Dropdown.TextYAlignment = Enum.TextYAlignment.Top

                Button.Name = "Button"
                Button.Parent = Dropdown
                Button.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
                Button.BorderColor3 = Color3.new(0, 0, 0)
                Button.Position = UDim2.new(-0.0140000004, 0, 0.48, 0)
                Button.Size = UDim2.new(0, 223, 0, 18)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Code
                Button.Text = " "..FuncData[1]
                Button.TextColor3 = Color3.new(1, 1, 1)
                Button.TextSize = 14
                Button.TextStrokeTransparency = 0.40000000596046
                Button.TextXAlignment = Enum.TextXAlignment.Left

                Frame.Parent = Button
                Frame.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
                Frame.BorderColor3 = Color3.new(0, 0, 0)
                Frame.BorderSizePixel = 1
                Frame.Position = UDim2.new(0, 0, 1.05, 0)
                Frame.Size = UDim2.new(0, 223, 0, 0)
                Frame.Visible = false
                Frame.ZIndex = 2

                UIListLayout.Parent = Frame
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

                local function tweenDropdown(Size, Time)
                    tweenProp(Frame, {Size = UDim2.new(0, 223, 0, (#FuncData-1)*Size)})
                    for _, TextButton in next, Frame:GetChildren() do
                        if TextButton:IsA("TextButton") and TextButton ~= Button then
                            tweenProp(TextButton, {Size = UDim2.new(0, 223, 0, Size)})
                        end
                    end
                    wait(Time)
                    Frame.Visible = not Frame.Visible
                end

                function createfunc(Name, Function)
                    local Button = Instance.new("TextButton")

                    Button.Name = "Button"
                    Button.Parent = Frame
                    Button.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
                    Button.BorderColor3 = Color3.new(0, 0, 0)
                    Button.BorderSizePixel = 0
                    Button.Position = UDim2.new(-0.0140000004, 0, 0.519999981, 0)
                    Button.Size = UDim2.new(0, 223, 0, 0)
                    Button.AutoButtonColor = false
                    Button.Font = Enum.Font.Code
                    Button.Text = " "..Name
                    Button.TextColor3 = Color3.new(1, 1, 1)
                    Button.TextSize = 14
                    Button.TextStrokeTransparency = 0.40000000596046
                    Button.TextXAlignment = Enum.TextXAlignment.Left

                    Button.MouseButton1Click:Connect(function()
                        Function(Name)
                        Button.Visible = false
                        Frame.Parent.Text = " "..Name
                        tweenDropdown(0,0.09)
                        for _, TextButton in next, Frame:GetChildren() do
                            if TextButton:IsA("TextButton") and TextButton ~= Button then
                                TextButton.Visible = true
                            end
                        end
                    end)

                    return Button
                end

                Func(FuncData[1])

                Button.MouseButton1Click:Connect(function()
                    if Frame.Visible then
                        tweenDropdown(0,0.1)
                        wait(0.15)
                    else
                        tweenDropdown(18,0.02)
                    end
                end)

                for _, TextButton in next, Frame:GetChildren() do
                    if TextButton:IsA("TextButton") and TextButton ~= Button then
                        TextButton.Visible = true
                    end
                end

                for FuncNum, FuncName in next, FuncData do
                    local Func = createfunc(FuncName, Func)
                    if FuncNum == 1 then
                        Func.Visible = false
                    end
                end
            end

            function Functions:Keybind(Name, Func)
                local Keybind = Instance.new("TextLabel")
                local Button = Instance.new("TextButton")
                getgenv()[Name .. "Bind"] = nil
                getgenv()[Name .. "Toggle"] = false
                getgenv()[Name .. "Pressed"] = false

                Keybind.Name = "Keybind"
                Keybind.Parent = SectionContents
                Keybind.BackgroundColor3 = Color3.new(1, 1, 1)
                Keybind.BackgroundTransparency = 1
                Keybind.Position = UDim2.new(0, 0, 1.98395073, 0)
                Keybind.Size = UDim2.new(0, 102, 0, 12)
                Keybind.Font = Enum.Font.Code
                Keybind.Text = Name
                Keybind.TextColor3 = Color3.new(1, 1, 1)
                Keybind.TextSize = 14
                Keybind.TextStrokeTransparency = 0.4
                Keybind.TextXAlignment = Enum.TextXAlignment.Left

                Button.Name = "Button"
                Button.Parent = Keybind
                Button.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
                Button.BackgroundTransparency = 1
                Button.BorderColor3 = Color3.new(0, 0, 0)
                Button.Position = UDim2.new(1.35386384, 0, -0.298538178, 0)
                Button.Size = UDim2.new(0, 82, 0, 18)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Code
                Button.Text = "None"
                Button.TextColor3 = Color3.new(1, 1, 1)
                Button.TextSize = 14
                Button.TextStrokeTransparency = 0.4
                Button.TextXAlignment = Enum.TextXAlignment.Right

                local KeyLib = {
                    ["One"] = "1",
                    ["Two"] = "2",
                    ["Three"] = "3",
                    ["Four"] = "4",
                    ["Five"] = "5",
                    ["Six"] = "6",
                    ["Seven"] = "7",
                    ["Eight"] = "8",
                    ["Nine"] = "9",
                    ["Zero"] = "0"
                }

                Button.MouseButton1Click:Connect(function()
                    if getgenv()[Name .. "Pressed"] then
                        Button.Text = "None"
                    else
                        Button.Text = "..."
                    end
                    getgenv()[Name .. "Bind"] = nil
                    getgenv()[Name .. "Pressed"] = not getgenv()[Name .. "Pressed"]
                end)

                UserInput.InputBegan:Connect(function(InputObject)
                    if getgenv()[Name .. "Pressed"] and InputObject.UserInputType == Enum.UserInputType.Keyboard then
                        KeyCodeName = InputObject.KeyCode.Name
                        if string.find(KeyCodeName, "Right") then
                            KeyCodeName = string.gsub(KeyCodeName, "Right", "R")
                        elseif string.find(KeyCodeName, "Left") then
                            KeyCodeName = string.gsub(KeyCodeName, "Left", "L")
                        elseif KeyLib[KeyCodeName] then
                            KeyCodeName = KeyLib[KeyCodeName]
                        end
                        Button.Text = KeyCodeName
                        getgenv()[Name .. "Bind"] = InputObject
                        getgenv()[Name .. "Pressed"] = false
                    end
                end)

                UserInput.InputBegan:Connect(function(InputObject)
                    if InputObject == getgenv()[Name .. "Bind"] then
                        getgenv()[Name .. "Toggle"] = not getgenv()[Name .. "Toggle"]
                        Func(getgenv()[Name .. "Toggle"])
                    end
                end)
            end

            function Functions:Slider(Name, Max, Min, Func)
                local Slider = Instance.new("TextLabel")
                local Toggle = Instance.new("TextButton")
                local Slide = Instance.new("TextButton")
                local TextButton = Instance.new("TextButton")
                local Num = Instance.new("TextLabel")
                local held = false
                Max = Max - Min

                Slider.Name = "Slider"
                Slider.Parent = SectionContents
                Slider.BackgroundColor3 = Color3.new(1, 1, 1)
                Slider.BackgroundTransparency = 1
                Slider.Position = UDim2.new(0, 0, 1.86666656, 0)
                Slider.Size = UDim2.new(0, 178, 0, 39)
                Slider.Font = Enum.Font.Code
                Slider.Text = Name
                Slider.TextColor3 = Color3.new(255, 255, 255)
                Slider.TextSize = 14
                Slider.TextStrokeTransparency = 0.4
                Slider.TextXAlignment = Enum.TextXAlignment.Left
                Slider.TextYAlignment = Enum.TextYAlignment.Top

                Slide.Name = "Slider"
                Slide.Parent = Slider
                Slide.Active = false
                Slide.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
                Slide.BorderColor3 = Color3.new(0, 0, 0)
                Slide.ClipsDescendants = true
                Slide.Position = UDim2.new(0, 0, 0.532051325, 0)
                Slide.Size = UDim2.new(0, 223, 0, 18)
                Slide.AutoButtonColor = false
                Slide.Font = Enum.Font.Code
                Slide.Text = ""
                Slide.TextColor3 = Color3.new(1, 1, 1)
                Slide.TextSize = 14
                Slide.TextStrokeTransparency = 0.4

                TextButton.Parent = Slide
                TextButton.BackgroundColor3 = getgenv().WindowThemeColor
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(0, 0, 1, 0)
                TextButton.AutoButtonColor = false
                TextButton.Font = Enum.Font.Code
                TextButton.Text = ""
                TextButton.TextColor3 = Color3.new(0, 0, 0)
                TextButton.TextSize = 14
                TextButton.TextStrokeTransparency = 0.4

                Num.Name = "Num"
                Num.Parent = TextButton
                Num.Active = true
                Num.BackgroundColor3 = Color3.new(1, 1, 1)
                Num.BackgroundTransparency = 1
                Num.Position = UDim2.new(0, 112, 0, 0)
                Num.Size = UDim2.new(0, 0, 0, 18)
                Num.Font = Enum.Font.Code
                Num.Text = tostring(Min)
                Num.TextColor3 = Color3.new(1, 1, 1)
                Num.TextSize = 14
                Num.TextStrokeTransparency = 0.4

                function snap(number, factor)
                    if factor == 0 then
                        return number
                    else
                        return math.floor(number/factor+0.5)*factor
                    end
                end

                Slide.MouseButton1Up:connect(function()
                    held = false
                end)

                Slide.MouseEnter:connect(function()
                    Slide.MouseButton1Down:connect(function()
                        held = true
                    end)
                end)

                TextButton.MouseButton1Up:connect(function()
                    held = false
                end)

                TextButton.MouseEnter:connect(function()
                    TextButton.MouseButton1Down:connect(function()
                        held = true
                    end)
                end)

                RunService.RenderStepped:connect(function()
                    if not UserInput:IsMouseButtonPressed(0) then
                        held = false
                    end
                end)

                RunService.RenderStepped:connect(function()
                    if held then
                        local MousePos = UserInput:GetMouseLocation().X
                        local BtnPos = TextButton.Position
                        local SliderSize = Slide.AbsoluteSize.X
                        local SliderPos = Slide.AbsolutePosition.X
                        local pos = snap((MousePos-SliderPos)/SliderSize,0.01)
                        percentage = math.clamp(pos,0,1)
                        TextButton:TweenSizeAndPosition(UDim2.new(percentage,0,1,0), UDim2.new(percentage/100,-2,(BtnPos.Y.Scale), BtnPos.Y.Offset), nil, nil, 0.08)
                        local est = math.floor((math.floor((Max * percentage) * Max) / Max)) + Min
                        if Min == est then
                            Num.Text = Min
                        else
                            Num.Text = est
                        end
                        Func(tonumber(Num.Text))
                    end
                end)
            end

            function Functions:ToggleSlider(Name, Max, Min, Func)
                local Slider = Instance.new("TextLabel")
                local Toggle = Instance.new("TextButton")
                local Slide = Instance.new("TextButton")
                local TextButton = Instance.new("TextButton")
                local Num = Instance.new("TextLabel")
                local held = false
                Max = Max - Min
                getgenv()[Name] = false

                Slider.Name = "Slider"
                Slider.Parent = SectionContents
                Slider.BackgroundColor3 = Color3.new(1, 1, 1)
                Slider.BackgroundTransparency = 1
                Slider.Position = UDim2.new(0, 0, 1.86666656, 0)
                Slider.Size = UDim2.new(0, 178, 0, 39)
                Slider.Font = Enum.Font.Code
                Slider.Text = Name
                Slider.TextColor3 = Color3.new(0.301961, 0.301961, 0.301961)
                Slider.TextSize = 14
                Slider.TextStrokeTransparency = 0.4
                Slider.TextXAlignment = Enum.TextXAlignment.Left
                Slider.TextYAlignment = Enum.TextYAlignment.Top

                Toggle.Name = "Toggle"
                Toggle.Parent = Slider
                Toggle.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
                Toggle.BorderColor3 = Color3.new(0, 0, 0)
                Toggle.Position = UDim2.new(1.1768539, 0, -0.0112500004, 0)
                Toggle.Size = UDim2.new(0, 13, 0, 13)
                Toggle.AutoButtonColor = false
                Toggle.Font = Enum.Font.Code
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.new(1, 1, 1)
                Toggle.TextSize = 14
                Toggle.TextStrokeTransparency = 0.4

                Slide.Name = "Slider"
                Slide.Parent = Slider
                Slide.Active = false
                Slide.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
                Slide.BorderColor3 = Color3.new(0, 0, 0)
                Slide.ClipsDescendants = true
                Slide.Position = UDim2.new(0, 0, 0.532051325, 0)
                Slide.Size = UDim2.new(0, 223, 0, 18)
                Slide.AutoButtonColor = false
                Slide.Font = Enum.Font.Code
                Slide.Text = ""
                Slide.TextColor3 = Color3.new(1, 1, 1)
                Slide.TextSize = 14
                Slide.TextStrokeTransparency = 0.4

                TextButton.Parent = Slide
                TextButton.BackgroundColor3 = getgenv().WindowThemeColor
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(0, 0, 1, 0)
                TextButton.AutoButtonColor = false
                TextButton.Font = Enum.Font.Code
                TextButton.Text = ""
                TextButton.TextColor3 = Color3.new(0, 0, 0)
                TextButton.TextSize = 14
                TextButton.TextStrokeTransparency = 0.4

                Num.Name = "Num"
                Num.Parent = TextButton
                Num.Active = true
                Num.BackgroundColor3 = Color3.new(1, 1, 1)
                Num.BackgroundTransparency = 1
                Num.Position = UDim2.new(0, 112, 0, 0)
                Num.Size = UDim2.new(0, 0, 0, 18)
                Num.Font = Enum.Font.Code
                Num.Text = tostring(Min)
                Num.TextColor3 = Color3.new(1, 1, 1)
                Num.TextSize = 14
                Num.TextStrokeTransparency = 0.4

                Toggle.MouseButton1Click:Connect(function()
                    if getgenv()[Name] then
                        tweenProp(Toggle, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)})
                        tweenProp(Slider, {TextColor3 = Color3.fromRGB(77, 77, 77)})
                    else
                        tweenProp(Toggle, {BackgroundColor3 = getgenv().WindowThemeColor})
                        tweenProp(Slider, {TextColor3 = Color3.fromRGB(255, 255, 255)})
                    end
                    getgenv()[Name] = not getgenv()[Name]
                    Func(getgenv()[Name], tonumber(Num.Text))
                end)
                
                function snap(number, factor)
                    if factor == 0 then
                        return number
                    else
                        return math.floor(number/factor+0.5)*factor
                    end
                end

                Slide.MouseButton1Up:connect(function()
                    held = false
                end)

                Slide.MouseEnter:connect(function()
                    Slide.MouseButton1Down:connect(function()
                        held = true
                    end)
                end)

                TextButton.MouseButton1Up:connect(function()
                    held = false
                end)

                TextButton.MouseEnter:connect(function()
                    TextButton.MouseButton1Down:connect(function()
                        held = true
                    end)
                end)

                RunService.RenderStepped:connect(function()
                    if not UserInput:IsMouseButtonPressed(0) then
                        held = false
                    end
                end)

                RunService.RenderStepped:connect(function()
                    if held then
                        local MousePos = UserInput:GetMouseLocation().X
                        local BtnPos = TextButton.Position
                        local SliderSize = Slide.AbsoluteSize.X
                        local SliderPos = Slide.AbsolutePosition.X
                        local pos = snap((MousePos-SliderPos)/SliderSize,0.01)
                        percentage = math.clamp(pos,0,1)
                        TextButton:TweenSizeAndPosition(UDim2.new(percentage,0,1,0), UDim2.new(percentage/100,-2,(BtnPos.Y.Scale), BtnPos.Y.Offset), nil, nil, 0.08)
                        local est = math.floor((math.floor((Max * percentage) * Max) / Max)) + Min
                        if Min == est then
                            Num.Text = Min
                        else
                            Num.Text = est
                        end
                    end
                end)
            end

            function Functions:Textbox(Name, Func)
                local Textbox = Instance.new("TextLabel")
                local TextBox = Instance.new("TextBox")
                local Frame = Instance.new("Frame")

                Textbox.Name = "Text box"
                Textbox.Parent = SectionContents
                Textbox.BackgroundColor3 = Color3.new(1, 1, 1)
                Textbox.BackgroundTransparency = 1
                Textbox.Position = UDim2.new(0.190909088, 0, 2.13571429, 0)
                Textbox.Size = UDim2.new(0, 178, 0, 36)
                Textbox.Font = Enum.Font.Code
                Textbox.Text = Name
                Textbox.TextColor3 = Color3.new(1, 1, 1)
                Textbox.TextSize = 14
                Textbox.TextStrokeTransparency = 0.4
                Textbox.TextXAlignment = Enum.TextXAlignment.Left
                Textbox.TextYAlignment = Enum.TextYAlignment.Top

                TextBox.Parent = Textbox
                TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
                TextBox.BackgroundTransparency = 1
                TextBox.BorderColor3 = Color3.new(0, 0, 0)
                TextBox.Position = UDim2.new(0, 0, 0.45999992, 0)
                TextBox.Size = UDim2.new(0, 220, 0, 14)
                TextBox.ClearTextOnFocus = false
                TextBox.Font = Enum.Font.SourceSans
                TextBox.PlaceholderColor3 = Color3.new(0.764706, 0.764706, 0.764706)
                TextBox.PlaceholderText = "..."
                TextBox.Text = ""
                TextBox.TextColor3 = Color3.new(1, 1, 1)
                TextBox.TextSize = 14
                TextBox.TextStrokeTransparency = 0.4
                TextBox.TextXAlignment = Enum.TextXAlignment.Left

                Frame.Parent = TextBox
                Frame.BackgroundColor3 = getgenv().WindowThemeColor
                Frame.BorderSizePixel = 0
                Frame.Position = UDim2.new(0, 0, 1, 0)
                Frame.Size = UDim2.new(0, 1, 0, 0)

                TextBox.Focused:Connect(function()
                    Frame.Size = UDim2.new(0,1,0,1)
                    Frame:TweenSizeAndPosition(UDim2.new(0,220,0,1), UDim2.new(-0.009,0,1,0),nil,nil,0.5)
                end)

                TextBox.FocusLost:Connect(function()
                    if TextBox.Text == '' then
                        Frame:TweenSizeAndPosition(UDim2.new(0,1,0,0), UDim2.new(0,0,1,0),nil,nil,0.5)
                    end
                    Func(TextBox.Text)
                end)
            end

            return Functions
        end
    
        return SectionLibrary
    end

    return WindowLibrary
end

return Library