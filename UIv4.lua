
local Library = {}

function Library:Window(Name, Color, SizeY)
    local CoreGui = game:GetService("CoreGui")
    local UserInput = game:GetService("UserInputService")
    local ScreenGui = Instance.new("ScreenGui")
    local Drag = Instance.new("Frame")
    local Main = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    
    -- Mobile and PC Compatibility
    ScreenGui.Name = Name
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    Drag.Name = "Drag"
    Drag.Parent = ScreenGui
    Drag.Active = true
    Drag.Draggable = true
    Drag.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
    Drag.Size = UDim2.new(0, 350, 0, 25)
    Drag.Position = UDim2.new(0.35, 0, 0.2, 0)
    
    Main.Name = "Main"
    Main.Parent = Drag
    Main.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
    Main.Size = UDim2.new(0, 350, 0, SizeY or 400)
    
    Title.Name = "Title"
    Title.Parent = Drag
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.Size = UDim2.new(0, 200, 0, 25)
    Title.Font = Enum.Font.SourceSans
    Title.Text = Name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    
    -- Draggable Worry/Drawat/Yağız Part
    local WorryPart = Instance.new("Frame")
    WorryPart.Name = "WorryPart"
    WorryPart.Parent = Main
    WorryPart.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    WorryPart.Size = UDim2.new(0, 150, 0, 100)
    WorryPart.Position = UDim2.new(0.5, -75, 0.5, -50)
    WorryPart.Active = true
    WorryPart.Draggable = true
    
    local WorryLabel = Instance.new("TextLabel")
    WorryLabel.Parent = WorryPart
    WorryLabel.Size = UDim2.new(1, 0, 1, 0)
    WorryLabel.BackgroundTransparency = 1
    WorryLabel.Font = Enum.Font.SourceSans
    WorryLabel.Text = "Worry/Drawat/Yağız"
    WorryLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    WorryLabel.TextSize = 16

    return Library
end

return Library
