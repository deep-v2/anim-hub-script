local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnimationHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Notificación personalizada
local notificationFrame = Instance.new("Frame")
notificationFrame.Name = "Notification"
notificationFrame.Size = UDim2.new(0, 320, 0, 80)
notificationFrame.Position = UDim2.new(1, 10, 0.5, -40)
notificationFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
notificationFrame.BackgroundTransparency = 0.1
notificationFrame.BorderSizePixel = 0
notificationFrame.Visible = false
notificationFrame.Parent = screenGui

local notifCorner = Instance.new("UICorner")
notifCorner.CornerRadius = UDim.new(0, 15)
notifCorner.Parent = notificationFrame

local notifStroke = Instance.new("UIStroke")
notifStroke.Color = Color3.fromRGB(100, 150, 255)
notifStroke.Thickness = 2
notifStroke.Transparency = 0.3
notifStroke.Parent = notificationFrame

local notifGlow = Instance.new("ImageLabel")
notifGlow.Name = "Glow"
notifGlow.Size = UDim2.new(1, 40, 1, 40)
notifGlow.Position = UDim2.new(0.5, -20, 0.5, -20)
notifGlow.AnchorPoint = Vector2.new(0.5, 0.5)
notifGlow.BackgroundTransparency = 1
notifGlow.Image = false
notifGlow.ImageColor3 = Color3.fromRGB(100, 150, 255)
notifGlow.ImageTransparency = 0.8
notifGlow.ScaleType = Enum.ScaleType.Slice
notifGlow.SliceCenter = Rect.new(10, 10, 118, 118)
notifGlow.Parent = notificationFrame

local notifTitle = Instance.new("TextLabel")
notifTitle.Name = "Title"
notifTitle.Size = UDim2.new(1, -20, 0, 25)
notifTitle.Position = UDim2.new(0, 10, 0, 10)
notifTitle.BackgroundTransparency = 1
notifTitle.Text = "Minimized"
notifTitle.TextColor3 = Color3.fromRGB(100, 150, 255)
notifTitle.TextSize = 16
notifTitle.Font = Enum.Font.GothamBold
notifTitle.TextXAlignment = Enum.TextXAlignment.Left
notifTitle.Parent = notificationFrame

local notifText = Instance.new("TextLabel")
notifText.Name = "Text"
notifText.Size = UDim2.new(1, -20, 0, 40)
notifText.Position = UDim2.new(0, 10, 0, 35)
notifText.BackgroundTransparency = 1
notifText.Text = "Press LeftCTRL to open the gui again."
notifText.TextColor3 = Color3.fromRGB(200, 200, 220)
notifText.TextSize = 12
notifText.Font = Enum.Font.Gotham
notifText.TextXAlignment = Enum.TextXAlignment.Left
notifText.TextWrapped = true
notifText.Parent = notificationFrame

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = false
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 20)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(100, 150, 255)
mainStroke.Thickness = 2
mainStroke.Transparency = 0.4
mainStroke.Parent = mainFrame

-- Efecto de brillo suave
local mainGlow = Instance.new("ImageLabel")
mainGlow.Name = "Glow"
mainGlow.Size = UDim2.new(1, 60, 1, 60)
mainGlow.Position = UDim2.new(0.5, -30, 0.5, -30)
mainGlow.AnchorPoint = Vector2.new(0.5, 0.5)
mainGlow.BackgroundTransparency = 1
mainGlow.Image = false
mainGlow.ImageColor3 = Color3.fromRGB(100, 150, 255)
mainGlow.ImageTransparency = 0.9
mainGlow.ScaleType = Enum.ScaleType.Slice
mainGlow.SliceCenter = Rect.new(10, 10, 118, 118)
mainGlow.ZIndex = 0
mainGlow.Parent = mainFrame

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
header.BackgroundTransparency = 0.85
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 20)
headerCorner.Parent = header

local headerGradient = Instance.new("UIGradient")
headerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 100, 255))
}
headerGradient.Rotation = 45
headerGradient.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0.85),
    NumberSequenceKeypoint.new(1, 0.9)
}
headerGradient.Parent = header

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0, 200, 1, -5)
title.Position = UDim2.new(0, 20, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Animation Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextStrokeTransparency = 0.7
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Name = "Subtitle"
subtitle.Size = UDim2.new(0, 200, 0, 15)
subtitle.Position = UDim2.new(0, 20, 0, 30)
subtitle.BackgroundTransparency = 1
subtitle.Text = "by kbau • Press CTRL to hide"
subtitle.TextColor3 = Color3.fromRGB(200, 200, 220)
subtitle.TextSize = 11
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.TextTransparency = 0.2
subtitle.Parent = header

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 38, 0, 38)
minimizeButton.Position = UDim2.new(1, -85, 0, 6)
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
minimizeButton.BackgroundTransparency = 0.2
minimizeButton.BorderSizePixel = 0
minimizeButton.Text = "−"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = 22
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.Parent = header

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(1, 0)
minCorner.Parent = minimizeButton

local minStroke = Instance.new("UIStroke")
minStroke.Color = Color3.fromRGB(255, 255, 255)
minStroke.Thickness = 1.5
minStroke.Transparency = 0.5
minStroke.Parent = minimizeButton

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 38, 0, 38)
closeButton.Position = UDim2.new(1, -43, 0, 6)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 80, 100)
closeButton.BackgroundTransparency = 0.2
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 18
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeButton

local closeStroke = Instance.new("UIStroke")
closeStroke.Color = Color3.fromRGB(255, 255, 255)
closeStroke.Thickness = 1.5
closeStroke.Transparency = 0.5
closeStroke.Parent = closeButton

local leftPanel = Instance.new("Frame")
leftPanel.Name = "LeftPanel"
leftPanel.Size = UDim2.new(0, 135, 1, -60)
leftPanel.Position = UDim2.new(0, 10, 0, 55)
leftPanel.BackgroundTransparency = 1
leftPanel.Parent = mainFrame

local rightPanel = Instance.new("Frame")
rightPanel.Name = "RightPanel"
rightPanel.Size = UDim2.new(1, -155, 1, -60)
rightPanel.Position = UDim2.new(0, 150, 0, 55)
rightPanel.BackgroundTransparency = 1
rightPanel.ClipsDescendants = true
rightPanel.Parent = mainFrame

local stopButton = Instance.new("TextButton")
stopButton.Name = "StopButton"
stopButton.Size = UDim2.new(1, 0, 0, 38)
stopButton.BackgroundColor3 = Color3.fromRGB(255, 100, 120)
stopButton.BackgroundTransparency = 0.3
stopButton.BorderSizePixel = 0
stopButton.Text = "⏹ Stop Animations"
stopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
stopButton.TextSize = 14
stopButton.Font = Enum.Font.GothamBold
stopButton.Parent = rightPanel

local stopCorner = Instance.new("UICorner")
stopCorner.CornerRadius = UDim.new(0, 12)
stopCorner.Parent = stopButton

local stopStroke = Instance.new("UIStroke")
stopStroke.Color = Color3.fromRGB(255, 150, 170)
stopStroke.Thickness = 1.5
stopStroke.Transparency = 0.4
stopStroke.Parent = stopButton

local buttonContainer = Instance.new("ScrollingFrame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Size = UDim2.new(1, 0, 1, -48)
buttonContainer.Position = UDim2.new(0, 0, 0, 43)
buttonContainer.BackgroundTransparency = 1
buttonContainer.BorderSizePixel = 0
buttonContainer.ScrollBarThickness = 6
buttonContainer.ScrollBarImageColor3 = Color3.fromRGB(100, 150, 255)
buttonContainer.ScrollBarImageTransparency = 0.4
buttonContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
buttonContainer.ClipsDescendants = true
buttonContainer.Parent = rightPanel

local animations = {
    ["Hands"] = {
        {name = "Wave", id = "79631923269131"},
        {name = "Like", id = "138220663525384"},
        {name = "Dislike", id = "138220663525384"},
        {name = "Point", id = "71439424797320"},
        {name = "Come Here", id = "127772514180203"},
        {name = "Ok", id = "100188963456227"},
        {name = "Nuh-Uh!", id = "82374480951071"},
        {name = "Finger Gun", id = "81100102810594"},
        {name = "Peace Sign", id = "72361092556872"},
        {name = "Hold", id = "77423395801230"},
        {name = "Think", id = "121922614712085"}
    },
    ["Misc"] = {
        {name = "Fake Death", id = "126527283467855"},
        {name = "Ground Tilt", id = "111300849035882"},
        {name = "Head", id = "73753845465382"},
        {name = "Cute Sit", id = "92270419093034"}
    },
    ["Glitches"] = {
        {name = "Bouncy Twirl", id = "14352343065"},
        {name = "Happier Jump", id = "15609995579"},
        {name = "V Pose", id = "10214319518"},
        {name = "Flex Walk", id = "15505459811"}
    },
    ["Dances"] = {
        {name = "CaramellDansen", id = "73785690856046"},
        {name = "Russian Dance", id = "97148848007002"},
        {name = "Fortnite Default", id = "101011728520473"},
        {name = "I Want Money", id = "104248876465825"},
        {name = "Party Rock", id = "113074782746670"},
        {name = "Boogie Down", id = "99662142344622"},
        {name = "Rat Dance", id = "117444124506335"},
        {name = "Billy Bounce", id = "133394554631338"},
        {name = "Orange Justice", id = "95127716920692"},
        {name = "Get Griddy", id = "121966805049108"},
        {name = "Gangnam Style", id = "78801539668900"},
        {name = "Arm Swings (Metroman)", id = "71043409187026"},
        {name = "I WANNA RUN AWAY", id = "76459424967458"},
        {name = "Hakari (Lonely Lonely)", id = "72935992500498"}
    }
}

local currentAnim = nil
local selectedCategory = "Hands"
local isMinimized = false
local isHidden = false
local viewportClones = {}

local function showNotification()
    notificationFrame.Visible = true
    notificationFrame.Position = UDim2.new(1, 10, 0.5, -40)
    
    local tweenIn = TweenService:Create(notificationFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -330, 0.5, -40)
    })
    tweenIn:Play()
    
    task.wait(4)
    
    local tweenOut = TweenService:Create(notificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(1, 10, 0.5, -40)
    })
    tweenOut:Play()
    tweenOut.Completed:Wait()
    notificationFrame.Visible = false
end

local function playAnimation(animationId)
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    if currentAnim then
        currentAnim:Stop()
    end
    
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://" .. animationId
    
    currentAnim = humanoid:LoadAnimation(animation)
    currentAnim:Play()
    
    print("Playing animation: " .. animationId)
end

local function stopAllAnimations()
    if currentAnim then
        currentAnim:Stop()
        currentAnim = nil
    end
    
    for _, data in pairs(viewportClones) do
        if data.anim then
            data.anim:Stop()
        end
        if data.connection then
            data.connection:Disconnect()
        end
    end
    
    print("All animations stopped")
end

local function setupViewport(viewport, animId)
    local char = player.Character or player.CharacterAdded:Wait()

    viewport:ClearAllChildren()
    viewport.LightColor = Color3.new(1, 1, 1)
    viewport.Ambient = Color3.new(0.8, 0.8, 0.9)
    viewport.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    viewport.BackgroundTransparency = 0.2

    local worldModel = Instance.new("WorldModel")
    worldModel.Parent = viewport

    local clone = char:Clone()
    for _, obj in ipairs(clone:GetDescendants()) do
        if obj:IsA("Script") or obj:IsA("LocalScript") then
            obj:Destroy()
        elseif obj:IsA("BasePart") then
            obj.Anchored = true
            obj.CanCollide = false
            obj.CastShadow = false
        end
    end
    clone.Parent = worldModel

    local root = clone:FindFirstChild("HumanoidRootPart") or clone:FindFirstChild("Torso")
    if not root then
        warn("No se encontró la raíz del personaje")
        return
    end

    clone.PrimaryPart = root
    clone:PivotTo(CFrame.new(0, 0, 0))

    local camera = Instance.new("Camera")
    camera.CameraType = Enum.CameraType.Scriptable
    camera.Parent = viewport
    viewport.CurrentCamera = camera

    local _, size = clone:GetBoundingBox()
    local radius = math.max(size.X, size.Z) * 1.5
    local height = size.Y * 0.5
    local angle = 0

    local humanoid = clone:FindFirstChildOfClass("Humanoid")
    local animator
    if humanoid then
        animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
    else
        local controller = Instance.new("AnimationController", clone)
        animator = Instance.new("Animator", controller)
    end

    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://" .. animId

    local success, track = pcall(function()
        return animator:LoadAnimation(animation)
    end)

    if success and track then
        track.Looped = true
        track:Play()
    end

    game:GetService("RunService").RenderStepped:Connect(function(dt)
        angle = (angle + dt * 0.5) % (math.pi * 2)
        local camPos = Vector3.new(math.sin(angle) * radius, height, math.cos(angle) * radius)
        camera.CFrame = CFrame.new(camPos, Vector3.new(0, height * 0.9, 0))
    end)
end

local function createAnimCard(anim, col, row)
    local buttonSize = 130
    local spacing = 25
    
    local card = Instance.new("Frame")
    card.Name = anim.name .. "Card"
    card.Size = UDim2.new(0, buttonSize, 0, buttonSize + 30)
    card.Position = UDim2.new(0, col * (buttonSize + spacing), 0, row * (buttonSize + spacing + 10))
    card.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    card.BackgroundTransparency = 0.3
    card.BorderSizePixel = 0
    card.Parent = buttonContainer
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 14)
    cardCorner.Parent = card
    
    local cardStroke = Instance.new("UIStroke")
    cardStroke.Color = Color3.fromRGB(100, 150, 255)
    cardStroke.Thickness = 1.5
    cardStroke.Transparency = 0.6
    cardStroke.Parent = card
    
    local cardGradient = Instance.new("UIGradient")
    cardGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 45))
    }
    cardGradient.Rotation = 135
    cardGradient.Parent = card
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, -10, 0, 25)
    nameLabel.Position = UDim2.new(0, 5, 0, 2)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = anim.name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextSize = 12
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextXAlignment = Enum.TextXAlignment.Center
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    nameLabel.TextStrokeTransparency = 0.8
    nameLabel.Parent = card
    
    local viewport = Instance.new("ViewportFrame")
    viewport.Name = "Viewport"
    viewport.Size = UDim2.new(1, -10, 1, -35)
    viewport.Position = UDim2.new(0, 5, 0, 27)
    viewport.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    viewport.BackgroundTransparency = 0.3
    viewport.BorderSizePixel = 0
    viewport.Parent = card
    
    local viewCorner = Instance.new("UICorner")
    viewCorner.CornerRadius = UDim.new(0, 12)
    viewCorner.Parent = viewport
    
    local viewStroke = Instance.new("UIStroke")
    viewStroke.Color = Color3.fromRGB(100, 150, 255)
    viewStroke.Thickness = 1
    viewStroke.Transparency = 0.8
    viewStroke.Parent = viewport
    
    local loadingLabel = Instance.new("TextLabel")
    loadingLabel.Name = "LoadingLabel"
    loadingLabel.Size = UDim2.new(1, 0, 1, 0)
    loadingLabel.BackgroundTransparency = 1
    loadingLabel.Text = "⏳ Loading..."
    loadingLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    loadingLabel.TextSize = 11
    loadingLabel.Font = Enum.Font.Gotham
    loadingLabel.Parent = viewport
    
    local clickButton = Instance.new("TextButton")
    clickButton.Name = "ClickButton"
    clickButton.Size = UDim2.new(1, 0, 1, 0)
    clickButton.BackgroundTransparency = 1
    clickButton.Text = ""
    clickButton.ZIndex = 2
    clickButton.Parent = card
    
    task.spawn(function()
        local success = pcall(function()
            setupViewport(viewport, anim.id)
        end)
        
        if success then
            loadingLabel:Destroy()
        else
            loadingLabel.Text = "❌ Error"
            loadingLabel.TextColor3 = Color3.fromRGB(255, 100, 120)
        end
    end)
    
    clickButton.MouseEnter:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
        TweenService:Create(cardStroke, TweenInfo.new(0.2), {Transparency = 0.2, Thickness = 2}):Play()
    end)
    
    clickButton.MouseLeave:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
        TweenService:Create(cardStroke, TweenInfo.new(0.2), {Transparency = 0.6, Thickness = 1.5}):Play()
    end)
    
    clickButton.MouseButton1Click:Connect(function()
        playAnimation(anim.id)
        TweenService:Create(card, TweenInfo.new(0.1), {Size = UDim2.new(0, buttonSize - 5, 0, buttonSize + 25)}):Play()
        task.wait(0.1)
        TweenService:Create(card, TweenInfo.new(0.1), {Size = UDim2.new(0, buttonSize, 0, buttonSize + 30)}):Play()
    end)
end

local function updateAnimationButtons()
    for _, child in pairs(buttonContainer:GetChildren()) do
        if child:IsA("Frame") then
            for viewport, data in pairs(viewportClones) do
                if data.clone and data.clone:IsDescendantOf(child) then
                    if data.anim then
                        data.anim:Stop()
                    end
                    if data.connection then
                        data.connection:Disconnect()
                    end
                    viewportClones[viewport] = nil
                end
            end
            child:Destroy()
        end
    end
    
    local animList = animations[selectedCategory]
    local columns = 3
    local buttonSize = 130
    local spacing = 15
    
    for i, anim in ipairs(animList) do
        local col = (i - 1) % columns
        local row = math.floor((i - 1) / columns)
        createAnimCard(anim, col, row)
    end
    
    local totalRows = math.ceil(#animList / columns)
    buttonContainer.CanvasSize = UDim2.new(0, 0, 0, totalRows * (buttonSize + 40 + spacing) + 10)
end

local categoryButtons = {}
local yPos = 0

for categoryName, _ in pairs(animations) do
    local catButton = Instance.new("TextButton")
    catButton.Name = categoryName
    catButton.Size = UDim2.new(1, 0, 0, 42)
    catButton.Position = UDim2.new(0, 0, 0, yPos)
    catButton.BackgroundColor3 = categoryName == selectedCategory and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(40, 40, 60)
    catButton.BackgroundTransparency = 0.25
    catButton.BorderSizePixel = 0
    catButton.Text = categoryName
    catButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    catButton.TextSize = 15
    catButton.Font = Enum.Font.GothamBold
    catButton.TextStrokeTransparency = 0.8
    catButton.Parent = leftPanel
    
    local catCorner = Instance.new("UICorner")
    catCorner.CornerRadius = UDim.new(0, 12)
    catCorner.Parent = catButton
    
    local catStroke = Instance.new("UIStroke")
    catStroke.Color = Color3.fromRGB(100, 150, 255)
    catStroke.Thickness = 1.5
    catStroke.Transparency = categoryName == selectedCategory and 0.4 or 0.7
    catStroke.Parent = catButton
    
    categoryButtons[categoryName] = catButton
    yPos = yPos + 52
end

for categoryName, button in pairs(categoryButtons) do
    button.MouseButton1Click:Connect(function()
        selectedCategory = categoryName
        
        for name, btn in pairs(categoryButtons) do
            local isSelected = name == selectedCategory
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = isSelected and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(40, 40, 60),
                BackgroundTransparency = isSelected and 0.15 or 0.25
            }):Play()
            TweenService:Create(btn:FindFirstChildOfClass("UIStroke"), TweenInfo.new(0.2), {
                Transparency = isSelected and 0.4 or 0.7
            }):Play()
        end
        
        updateAnimationButtons()
    end)
    
    button.MouseEnter:Connect(function()
        if selectedCategory ~= categoryName then
            TweenService:Create(button, TweenInfo.new(0.15), {BackgroundTransparency = 0.15}):Play()
        end
    end)
    
    button.MouseLeave:Connect(function()
        if selectedCategory ~= categoryName then
            TweenService:Create(button, TweenInfo.new(0.15), {BackgroundTransparency = 0.25}):Play()
        end
    end)
end

stopButton.MouseButton1Click:Connect(function()
    stopAllAnimations()
    TweenService:Create(stopButton, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 35)}):Play()
    task.wait(0.1)
    TweenService:Create(stopButton, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 38)}):Play()
end)

stopButton.MouseEnter:Connect(function()
    TweenService:Create(stopButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.15}):Play()
    TweenService:Create(stopStroke, TweenInfo.new(0.2), {Transparency = 0.2}):Play()
end)

stopButton.MouseLeave:Connect(function()
    TweenService:Create(stopButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
    TweenService:Create(stopStroke, TweenInfo.new(0.2), {Transparency = 0.4}):Play()
end)

minimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    if isMinimized then
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 220, 0, 55),
            BackgroundTransparency = 0.1
        }):Play()
        leftPanel.Visible = false
        rightPanel.Visible = false
        minimizeButton.Text = "□"
    else
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 600, 0, 400),
            BackgroundTransparency = 0.15
        }):Play()
        leftPanel.Visible = true
        rightPanel.Visible = true
        minimizeButton.Text = "−"
    end
end)

minimizeButton.MouseEnter:Connect(function()
    TweenService:Create(minimizeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.05}):Play()
end)

minimizeButton.MouseLeave:Connect(function()
    TweenService:Create(minimizeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
end)

closeButton.MouseButton1Click:Connect(function()
    stopAllAnimations()
    TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()
    task.wait(0.3)
    screenGui:Destroy()
end)

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.05}):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
end)

-- Sistema de ocultar con CTRL
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.LeftControl then
        isHidden = not isHidden
        
        if isHidden then
            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Position = UDim2.new(0.5, -300, -0.5, -200)
            }):Play()
            task.wait(0.3)
            mainFrame.Visible = false
            task.spawn(showNotification)
        else
            mainFrame.Visible = true
            mainFrame.Position = UDim2.new(0.5, -300, -0.5, -200)
            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, -300, 0.5, -200)
            }):Play()
        end
    end
end)

local function initializeHub()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        updateAnimationButtons()
        print("✨ Animation Hub initialized successfully!")
    else
        player.CharacterAdded:Wait()
        task.wait(0.5)
        updateAnimationButtons()
        print("✨ Animation Hub initialized after CharacterAdded!")
    end
end

-- Animación de entrada inicial
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 600, 0, 400),
    Position = UDim2.new(0.5, -300, 0.5, -200)
}):Play()

if player.Character then
    task.wait(1)
    initializeHub()
else
    player.CharacterAdded:Wait()
    task.wait(1)
    initializeHub()
end

player.CharacterAdded:Connect(function()
    task.wait(1)
    updateAnimationButtons()
end)
