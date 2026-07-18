-- DecalIdByRay

-- === BASE SETUP ===
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- === SCREEN HOLDER ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RayWareV1"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

-- === MAIN WINDOW ===
local MainWindow = Instance.new("Frame")
MainWindow.Size = UDim2.new(0, 600, 0, 350)
MainWindow.Position = UDim2.new(0.5, -300, 0.5, -175)
MainWindow.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainWindow.Active = true
MainWindow.Draggable = true
MainWindow.Parent = ScreenGui

Instance.new("UICorner", MainWindow).CornerRadius = UDim.new(0, 12)

-- === TITLE BAR ===
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
TitleBar.Parent = MainWindow
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 12)

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -50, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "RayWare V1"
TitleText.TextColor3 = Color3.new(1,1,1)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar

-- === CLOSE BUTTON ===
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -45, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = TitleBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- === CONTENT AREA ===
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -20, 1, -65)
Content.Position = UDim2.new(0, 10, 0, 55)
Content.BackgroundTransparency = 1
Content.Parent = MainWindow

-- === DECALS SECTION ===
local DecalsTitle = Instance.new("TextLabel")
DecalsTitle.Size = UDim2.new(1, 0, 0, 30)
DecalsTitle.BackgroundTransparency = 1
DecalsTitle.Text = "Popular Decal IDs (Click to Copy)"
DecalsTitle.TextColor3 = Color3.new(1,1,1)
DecalsTitle.Font = Enum.Font.GothamBold
DecalsTitle.TextSize = 16
DecalsTitle.TextXAlignment = Enum.TextXAlignment.Left
DecalsTitle.Parent = Content

-- Decal IDs list (10 popular ones)
local decalList = {
    {name = "Giga Chad", id = "10590477450"},
    {name = "Rickroll", id = "6403436082"},
    {name = "Shocked Guy", id = "11818627075"},
    {name = "Among Us Face", id = "9180622670"},
    {name = "The Rock", id = "8425069728"},
    {name = "Cat Standing", id = "9142678957"},
    {name = "Meme Dog", id = "9835676498"},
    {name = "Luffy", id = "10511856020"},
    {name = "Beluga", id = "7129155278"},
    {name = "Gojo", id = "9242918232"},
}

-- Function to copy to clipboard
local function copyToClipboard(text)
    setclipboard(text)
    -- Optional: Show a notification (you can expand this)
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 200, 0, 40)
    notif.Position = UDim2.new(0.5, -100, 0.8, 0)
    notif.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
    notif.Text = "Copied: " .. text
    notif.TextColor3 = Color3.new(1,1,1)
    notif.Parent = ScreenGui
    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 8)
    
    game:GetService("TweenService"):Create(notif, TweenInfo.new(2), {Position = UDim2.new(0.5, -100, 0.9, 0), BackgroundTransparency = 1, TextTransparency = 1}):Play()
    task.delay(2, function() notif:Destroy() end)
end

-- Create buttons in a grid
local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0, 270, 0, 45)  -- Normal button size fitting the menu
grid.CellPadding = UDim2.new(0, 10, 0, 10)
grid.Parent = Content

for _, decal in ipairs(decalList) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)  -- Filled by grid
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.Text = decal.name .. "\nrbxassetid://" .. decal.id
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.TextWrapped = true
    btn.Parent = Content
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    
    btn.MouseButton1Click:Connect(function()
        copyToClipboard("rbxassetid://" .. decal.id)
    end)
end
