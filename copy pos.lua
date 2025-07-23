-- dont steal this shit brutha
-- discord: .pxrson
local pxrson_s = {
    p = game:GetService('Players'),
    v = game:GetService('VirtualUser'),
    sg = game:GetService("StarterGui"),
    rs = game:GetService("RunService"),
    ts = game:GetService("TweenService")
}

local pxrson_g = Instance.new("ScreenGui")
local pxrson_m = Instance.new("Frame")
local pxrson_uc = Instance.new("UICorner")
local pxrson_tb = Instance.new("Frame")
local pxrson_tc = Instance.new("UICorner")
local pxrson_fl = Instance.new("TextLabel")
local pxrson_tl = Instance.new("TextLabel")
local pxrson_el = Instance.new("TextLabel")

pxrson_g.Parent = game:GetService("CoreGui")
pxrson_g.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pxrson_g.ResetOnSpawn = false

pxrson_m.Parent = pxrson_g
pxrson_m.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
pxrson_m.BackgroundTransparency = 0.1
pxrson_m.Position = UDim2.new(0.6, 0, 0.1, 0)
pxrson_m.Size = UDim2.new(0, 180, 0, 120)

pxrson_tb.Parent = pxrson_m
pxrson_tb.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
pxrson_tb.BackgroundTransparency = 0.1
pxrson_tb.Size = UDim2.new(1, 0, 0, 22)

pxrson_tc.Parent = pxrson_tb
pxrson_tc.CornerRadius = UDim.new(0, 4)

pxrson_uc.Parent = pxrson_m
pxrson_uc.CornerRadius = UDim.new(0, 4)

local function pxrson_l(p)
    local x = Instance.new("TextLabel")
    x.Parent = pxrson_m
    x.BackgroundTransparency = 1
    x.Position = p
    x.Size = UDim2.new(1, -10, 0, 18)
    x.Font = Enum.Font.Code
    x.TextColor3 = Color3.fromRGB(255, 255, 255)
    x.TextSize = 13
    x.TextXAlignment = Enum.TextXAlignment.Left
    return x
end

pxrson_fl = pxrson_l(UDim2.new(0, 8, 0, 24))
pxrson_tl = pxrson_l(UDim2.new(0, 8, 0, 42))
pxrson_el = pxrson_l(UDim2.new(0, 8, 0, 60))

local pxrson_u = game:GetService("UserInputService")
local pxrson_d = false
local pxrson_ds
local pxrson_sp
local pxrson_conn

local function pxrson_upd(current_pos)
    local delta = current_pos - pxrson_ds
    local viewport = workspace.CurrentCamera.ViewportSize
    local new_x = math.max(0, math.min(viewport.X - pxrson_m.AbsoluteSize.X, pxrson_sp.X + delta.X))
    local new_y = math.max(0, math.min(viewport.Y - pxrson_m.AbsoluteSize.Y, pxrson_sp.Y + delta.Y))
    
    pxrson_m.Position = UDim2.new(0, new_x, 0, new_y)
end

pxrson_tb.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        pxrson_d = true
        pxrson_ds = i.Position
        pxrson_sp = Vector2.new(pxrson_m.AbsolutePosition.X, pxrson_m.AbsolutePosition.Y)
        
        pxrson_conn = pxrson_u.InputChanged:Connect(function(input)
            if pxrson_d and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                pxrson_upd(input.Position)
            end
        end)
        
        local end_conn
        end_conn = pxrson_u.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                pxrson_d = false
                if pxrson_conn then
                    pxrson_conn:Disconnect()
                    pxrson_conn = nil
                end
                end_conn:Disconnect()
            end
        end)
    end
end)

local pxrson_st = os.time()

local pxrson_t = Instance.new("TextLabel")
pxrson_t.Parent = pxrson_tb
pxrson_t.BackgroundTransparency = 1
pxrson_t.Position = UDim2.new(0, 8, 0, 0)
pxrson_t.Size = UDim2.new(1, -16, 1, 0)
pxrson_t.Font = Enum.Font.Code
pxrson_t.Text = "Coordinates Copy"
pxrson_t.TextColor3 = Color3.fromRGB(255, 255, 255)
pxrson_t.TextSize = 13
pxrson_t.TextXAlignment = Enum.TextXAlignment.Left

local pxrson_cb = Instance.new("TextButton")
pxrson_cb.Parent = pxrson_tb
pxrson_cb.BackgroundTransparency = 1
pxrson_cb.Position = UDim2.new(1, -20, 0, 0)
pxrson_cb.Size = UDim2.new(0, 20, 1, 0)
pxrson_cb.Font = Enum.Font.Code
pxrson_cb.Text = "×"
pxrson_cb.TextColor3 = Color3.fromRGB(255, 255, 255)
pxrson_cb.TextSize = 14
pxrson_cb.AutoButtonColor = false

pxrson_cb.MouseEnter:Connect(function()
    pxrson_cb.TextColor3 = Color3.fromRGB(255, 50, 50)
end)

pxrson_cb.MouseLeave:Connect(function()
    pxrson_cb.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

pxrson_cb.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch then
        pxrson_cb.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

pxrson_cb.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch then
        pxrson_cb.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

pxrson_cb.MouseButton1Click:Connect(function()
    pxrson_g:Destroy()
end)

pxrson_cb.TouchTap:Connect(function()
    pxrson_g:Destroy()
end)

local pxrson_bp = Instance.new("TextButton")
pxrson_bp.Parent = pxrson_m
pxrson_bp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
pxrson_bp.BackgroundTransparency = 0.1
pxrson_bp.Position = UDim2.new(0, 8, 0, 80)
pxrson_bp.Size = UDim2.new(0, 50, 0, 20)
pxrson_bp.Font = Enum.Font.Code
pxrson_bp.Text = "copy"
pxrson_bp.TextColor3 = Color3.fromRGB(255, 255, 255)
pxrson_bp.TextSize = 12
pxrson_bp.AutoButtonColor = false

local pxrson_bpc = Instance.new("UICorner")
pxrson_bpc.Parent = pxrson_bp
pxrson_bpc.CornerRadius = UDim.new(0, 3)

local pxrson_bt = Instance.new("TextButton")
pxrson_bt.Parent = pxrson_m
pxrson_bt.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
pxrson_bt.BackgroundTransparency = 0.1
pxrson_bt.Position = UDim2.new(0, 62, 0, 80)
pxrson_bt.Size = UDim2.new(0, 50, 0, 20)
pxrson_bt.Font = Enum.Font.Code
pxrson_bt.Text = "paste"
pxrson_bt.TextColor3 = Color3.fromRGB(255, 255, 255)
pxrson_bt.TextSize = 12
pxrson_bt.AutoButtonColor = false

local pxrson_btc = Instance.new("UICorner")
pxrson_btc.Parent = pxrson_bt
pxrson_btc.CornerRadius = UDim.new(0, 3)

pxrson_bp.MouseEnter:Connect(function()
    pxrson_bp.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

pxrson_bp.MouseLeave:Connect(function()
    pxrson_bp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end)

pxrson_bt.MouseEnter:Connect(function()
    pxrson_bt.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

pxrson_bt.MouseLeave:Connect(function()
    pxrson_bt.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end)

pxrson_bp.MouseButton1Click:Connect(function()
    if pxrson_s.p.LocalPlayer.Character and pxrson_s.p.LocalPlayer.Character.HumanoidRootPart then
        pxrson_st = pxrson_s.p.LocalPlayer.Character.HumanoidRootPart.Position
        pxrson_s.sg:SetCore("SendNotification", {
            Title = "Coordinates Copy",
            Text = "coordinates saved",
            Duration = 3
        })
    end
end)

pxrson_bt.MouseButton1Click:Connect(function()
    if pxrson_s.p.LocalPlayer.Character and pxrson_s.p.LocalPlayer.Character.HumanoidRootPart then
        pxrson_s.p.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pxrson_st)
        pxrson_s.sg:SetCore("SendNotification", {
            Title = "Coordinates Copy",
            Text = "teleported to saved coordinates",
            Duration = 3
        })
    end
end)

local function pxrson_upg()
    pxrson_fl.Text = "fps: " .. math.floor(1/pxrson_s.rs.RenderStepped:Wait())
    pxrson_tl.Text = "time: " .. os.date("%H:%M:%S")
    if pxrson_s.p.LocalPlayer.Character and pxrson_s.p.LocalPlayer.Character.HumanoidRootPart then
        local coords = pxrson_s.p.LocalPlayer.Character.HumanoidRootPart.Position
        pxrson_el.Text = string.format("coords: %.1f, %.1f, %.1f", coords.X, coords.Y, coords.Z)
    else
        pxrson_el.Text = "coords: no character"
    end
end

pxrson_s.rs.RenderStepped:Connect(pxrson_upg)

pxrson_s.sg:SetCore("SendNotification", {
    Title = "Coordinates Copy",
    Text = "running.. [github.com/Pxrson] <3",
    Icon = "rbxassetid://96250665598150",
    Duration = 5
})

pxrson_s.p.LocalPlayer.Chatted:Connect(function(msg)
    if msg:lower() == "/copycoords" then
        if pxrson_s.p.LocalPlayer.Character and pxrson_s.p.LocalPlayer.Character.HumanoidRootPart then
            pxrson_st = pxrson_s.p.LocalPlayer.Character.HumanoidRootPart.Position
            pxrson_s.sg:SetCore("SendNotification", {
                Title = "Coordinates Copy",
                Text = "coordinates saved",
                Duration = 3
            })
        end
    elseif msg:lower() == "/pastecoords" then
        if pxrson_s.p.LocalPlayer.Character and pxrson_s.p.LocalPlayer.Character.HumanoidRootPart then
            pxrson_s.p.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pxrson_st)
            pxrson_s.sg:SetCore("SendNotification", {
                Title = "Coordinates Copy",
                Text = "teleported to saved coordinates",
                Duration = 3
            })
        end
    end
end)
