-- Boombox ID By Ray (2026 Updated)

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
TitleText.Text = "RayWare - Boombox Id 2026"
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

-- === BOOMBOX SECTION ===
local BoomboxTitle = Instance.new("TextLabel")
BoomboxTitle.Size = UDim2.new(1, 0, 0, 30)
BoomboxTitle.BackgroundTransparency = 1
BoomboxTitle.Text = "."
BoomboxTitle.TextColor3 = Color3.new(1,1,1)
BoomboxTitle.Font = Enum.Font.GothamBold
BoomboxTitle.TextSize = 16
BoomboxTitle.TextXAlignment = Enum.TextXAlignment.Left
BoomboxTitle.Parent = Content

-- Updated Boombox IDs list (Working as of 2026)
local boomboxList = {
    {name = "God's Plan", id = "1665926924"},
    {name = "Festival Phonk", id = "80059228606274"},
    {name = "Suii Phonk", id = "93316204367148"},
    {name = "Industry Baby", id = "7253841629"},
    {name = "Metal Phonk", id = "135071730662747"},
    {name = "Mood", id = "5519565135"},
    {name = "Levitating", id = "6606223785"},
    {name = "Highway to Hell", id = "4728058875"},
    {name = "Spooky Scary Skeletons", id = "138081566"},
    {name = "Boom Clap", id = "189739789"},
}

-- Function to copy to clipboard
local function copyToClipboard(text)
    setclipboard(text)
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
grid.CellSize = UDim2.new(0, 270, 0, 45)
grid.CellPadding = UDim2.new(0, 10, 0, 10)
grid.Parent = Content

for _, item in ipairs(boomboxList) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.Text = item.name .. "\n" .. item.id
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.TextWrapped = true
    btn.Parent = Content
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    
    btn.MouseButton1Click:Connect(function()
        copyToClipboard(item.id)
    end)
end
