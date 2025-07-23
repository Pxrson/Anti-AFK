local s = {
    p = game:GetService('Players'),
    v = game:GetService('VirtualUser'),
    sg = game:GetService("StarterGui"),
    rs = game:GetService("RunService"),
    ts = game:GetService("TweenService")
}

local g = Instance.new("ScreenGui")
local m = Instance.new("Frame")
local uc = Instance.new("UICorner")
local tb = Instance.new("Frame")
local tc = Instance.new("UICorner")
local fl = Instance.new("TextLabel")
local tl = Instance.new("TextLabel")
local el = Instance.new("TextLabel")

g.Parent = game:GetService("CoreGui")
g.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
g.ResetOnSpawn = false

m.Parent = g
m.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
m.BackgroundTransparency = 0.1
m.Position = UDim2.new(0.8, 0, 0.1, 0)
m.Size = UDim2.new(0, 180, 0, 95)

tb.Parent = m
tb.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
tb.BackgroundTransparency = 0.1
tb.Size = UDim2.new(1, 0, 0, 22)

tc.Parent = tb
tc.CornerRadius = UDim.new(0, 4)

uc.Parent = m
uc.CornerRadius = UDim.new(0, 4)

local function l(p)
    local x = Instance.new("TextLabel")
    x.Parent = m
    x.BackgroundTransparency = 1
    x.Position = p
    x.Size = UDim2.new(1, -10, 0, 18)
    x.Font = Enum.Font.Code
    x.TextColor3 = Color3.fromRGB(255, 255, 255)
    x.TextSize = 13
    x.TextXAlignment = Enum.TextXAlignment.Left
    return x
end

fl = l(UDim2.new(0, 8, 0, 24))
tl = l(UDim2.new(0, 8, 0, 42))
el = l(UDim2.new(0, 8, 0, 60))

local u = game:GetService("UserInputService")
local d
local di
local ds
local sp
local dt

local function upd(i)
    if dt then dt:Cancel() end
    local delta = i.Position - ds
    local pos = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y)
    dt = s.ts:Create(m, TweenInfo.new(0.1), {Position = pos})
    dt:Play()
end

tb.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        d = true
        ds = i.Position
        sp = m.Position
        i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then
                d = false
            end
        end)
    end
end)

tb.InputChanged:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseMovement then
        di = i
    end
end)

u.InputChanged:Connect(function(i)
    if i == di and d then
        upd(i)
    end
end)

local st = os.time()

local t = Instance.new("TextLabel")
t.Parent = tb
t.BackgroundTransparency = 1
t.Position = UDim2.new(0, 8, 0, 0)
t.Size = UDim2.new(1, -16, 1, 0)
t.Font = Enum.Font.Code
t.Text = "Anti AFK"
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.TextSize = 13
t.TextXAlignment = Enum.TextXAlignment.Left

local cb = Instance.new("TextButton")
cb.Parent = tb
cb.BackgroundTransparency = 1
cb.Position = UDim2.new(1, -20, 0, 0)
cb.Size = UDim2.new(0, 20, 1, 0)
cb.Font = Enum.Font.Code
cb.Text = "×"
cb.TextColor3 = Color3.fromRGB(255, 255, 255)
cb.TextSize = 14
cb.AutoButtonColor = false

cb.MouseEnter:Connect(function()
    cb.TextColor3 = Color3.fromRGB(255, 50, 50)
end)

cb.MouseLeave:Connect(function()
    cb.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

cb.MouseButton1Click:Connect(function()
    g:Destroy()
end)

local function upg()
    fl.Text = "fps: " .. math.floor(1/s.rs.RenderStepped:Wait())
    tl.Text = "time: " .. os.date("%H:%M:%S")
    local ea = os.time() - st
    el.Text = string.format("exec: %02d:%02d:%02d", ea/3600%24, ea/60%60, ea%60)
end

s.rs.RenderStepped:Connect(upg)

s.sg:SetCore("SendNotification", {
    Title = "Anti AFK",
    Text = "running.. [github.com/Pxrson] <3",
    Icon = "rbxassetid://96250665598150",
    Duration = 5
})

s.p.LocalPlayer.Idled:Connect(function()
    s.v:CaptureController()
    s.v:ClickButton2(Vector2.new())
end)
