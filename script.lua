local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnimationHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = false
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 20)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(100, 100, 120)
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.5
mainStroke.Parent = mainFrame

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
header.BackgroundTransparency = 0.95
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 20)
headerCorner.Parent = header

local headerStroke = Instance.new("UIStroke")
headerStroke.Color = Color3.fromRGB(255, 255, 255)
headerStroke.Thickness = 1
headerStroke.Transparency = 0.8
headerStroke.Parent = header

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0, 200, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Anim Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextStrokeTransparency = 0.8
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Name = "Subtitle"
subtitle.Size = UDim2.new(0, 200, 0, 15)
subtitle.Position = UDim2.new(0, 15, 0, 25)
subtitle.BackgroundTransparency = 1
subtitle.Text = "by kbau"
subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
subtitle.TextSize = 11
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.TextTransparency = 0.3
subtitle.Parent = header

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 35, 0, 35)
minimizeButton.Position = UDim2.new(1, -80, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
minimizeButton.BackgroundTransparency = 0.3
minimizeButton.BorderSizePixel = 0
minimizeButton.Text = "−"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = 20
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.Parent = header

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(1, 0)
minCorner.Parent = minimizeButton

local minStroke = Instance.new("UIStroke")
minStroke.Color = Color3.fromRGB(255, 255, 255)
minStroke.Thickness = 1.5
minStroke.Transparency = 0.6
minStroke.Parent = minimizeButton

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 35, 0, 35)
closeButton.Position = UDim2.new(1, -40, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
closeButton.BackgroundTransparency = 0.3
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 16
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeButton

local closeStroke = Instance.new("UIStroke")
closeStroke.Color = Color3.fromRGB(255, 255, 255)
closeStroke.Thickness = 1.5
closeStroke.Transparency = 0.6
closeStroke.Parent = closeButton

local leftPanel = Instance.new("Frame")
leftPanel.Name = "LeftPanel"
leftPanel.Size = UDim2.new(0, 130, 1, -55)
leftPanel.Position = UDim2.new(0, 10, 0, 50)
leftPanel.BackgroundTransparency = 1
leftPanel.Parent = mainFrame

local rightPanel = Instance.new("Frame")
rightPanel.Name = "RightPanel"
rightPanel.Size = UDim2.new(1, -150, 1, -55)
rightPanel.Position = UDim2.new(0, 145, 0, 50)
rightPanel.BackgroundTransparency = 1
rightPanel.ClipsDescendants = true
rightPanel.Parent = mainFrame

local stopButton = Instance.new("TextButton")
stopButton.Name = "StopButton"
stopButton.Size = UDim2.new(1, 0, 0, 35)
stopButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
stopButton.BackgroundTransparency = 0.4
stopButton.BorderSizePixel = 0
stopButton.Text = "Stop Animations"
stopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
stopButton.TextSize = 14
stopButton.Font = Enum.Font.GothamBold
stopButton.Parent = rightPanel

local stopCorner = Instance.new("UICorner")
stopCorner.CornerRadius = UDim.new(0, 10)
stopCorner.Parent = stopButton

local stopStroke = Instance.new("UIStroke")
stopStroke.Color = Color3.fromRGB(255, 150, 150)
stopStroke.Thickness = 1.5
stopStroke.Transparency = 0.5
stopStroke.Parent = stopButton

local buttonContainer = Instance.new("ScrollingFrame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Size = UDim2.new(1, 0, 1, -45)
buttonContainer.Position = UDim2.new(0, 0, 0, 40)
buttonContainer.BackgroundTransparency = 1
buttonContainer.BorderSizePixel = 0
buttonContainer.ScrollBarThickness = 6
buttonContainer.ScrollBarImageColor3 = Color3.fromRGB(150, 150, 180)
buttonContainer.ScrollBarImageTransparency = 0.5
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
		{name = "Pat", id = "103278273067294"},
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
        {name = "Arm Swings (Metroman)", id = "71043409187026"}
    }
}

local currentAnim = nil
local selectedCategory = "Hands"
local isMinimized = false
local viewportClones = {}

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
    
    print("Reproduciendo animación: " .. animationId)
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
    
    print("Todas las animaciones detenidas")
end

local function setupViewport(viewport, animId)
    local character = player.Character
    if not character then 
        warn("No se encontró el personaje")
        return 
    end
    
    local clone = character:Clone()
    
    for _, obj in pairs(clone:GetDescendants()) do
        if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
            obj:Destroy()
        end
    end
    
    local humanoid = clone:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    end
    
    clone.Parent = viewport
    
    local camera = Instance.new("Camera")
    camera.Parent = viewport
    viewport.CurrentCamera = camera
    viewport.LightingEnabled = true
    viewport.Ambient = Color3.fromRGB(255, 255, 255)
    
    local rootPart = clone:FindFirstChild("HumanoidRootPart")
    if rootPart then
        rootPart.Anchored = true
        
        local modelCFrame = clone:GetBoundingBox()
        local modelSize = clone:GetExtentsSize()
        local maxDimension = math.max(modelSize.X, modelSize.Y, modelSize.Z)
        local distance = maxDimension * 2.5
        
        camera.CFrame = CFrame.new(modelCFrame.Position + Vector3.new(0, 0, distance), modelCFrame.Position)
        camera.FieldOfView = 40
        
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if clone and clone.Parent and rootPart and rootPart.Parent then
                rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(0.8), 0)
            else
                if connection then
                    connection:Disconnect()
                end
            end
        end)
        
        if humanoid and animId then
            task.wait(0.1)
            
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://" .. animId
            
            local animTrack = humanoid:LoadAnimation(animation)
            animTrack.Looped = true
            animTrack:Play()
            
            viewportClones[viewport] = {
                clone = clone,
                anim = animTrack,
                connection = connection
            }
        end
    end
    
    return clone
end

local function createAnimCard(anim, col, row)
    local buttonSize = 130
    local spacing = 10
    
    local card = Instance.new("Frame")
    card.Name = anim.name .. "Card"
    card.Size = UDim2.new(0, buttonSize, 0, buttonSize + 30)
    card.Position = UDim2.new(0, col * (buttonSize + spacing), 0, row * (buttonSize + spacing))
    card.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    card.BackgroundTransparency = 0.4
    card.BorderSizePixel = 0
    card.Parent = buttonContainer
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 12)
    cardCorner.Parent = card
    
    local cardStroke = Instance.new("UIStroke")
    cardStroke.Color = Color3.fromRGB(150, 150, 200)
    cardStroke.Thickness = 1.5
    cardStroke.Transparency = 0.6
    cardStroke.Parent = card
    
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
    nameLabel.Parent = card
    
    local viewport = Instance.new("ViewportFrame")
    viewport.Name = "Viewport"
    viewport.Size = UDim2.new(1, -10, 1, -35)
    viewport.Position = UDim2.new(0, 5, 0, 27)
    viewport.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    viewport.BackgroundTransparency = 0.5
    viewport.BorderSizePixel = 0
    viewport.Parent = card
    
    local viewCorner = Instance.new("UICorner")
    viewCorner.CornerRadius = UDim.new(0, 10)
    viewCorner.Parent = viewport
    
    local viewStroke = Instance.new("UIStroke")
    viewStroke.Color = Color3.fromRGB(100, 100, 150)
    viewStroke.Thickness = 1
    viewStroke.Transparency = 0.7
    viewStroke.Parent = viewport
    
    local clickButton = Instance.new("TextButton")
    clickButton.Name = "ClickButton"
    clickButton.Size = UDim2.new(1, 0, 1, 0)
    clickButton.BackgroundTransparency = 1
    clickButton.Text = ""
    clickButton.ZIndex = 2
    clickButton.Parent = card
    
    task.spawn(function()
        setupViewport(viewport, anim.id)
    end)
    
    clickButton.MouseEnter:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
        TweenService:Create(cardStroke, TweenInfo.new(0.2), {Transparency = 0.3}):Play()
    end)
    
    clickButton.MouseLeave:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.2), {BackgroundTransparency = 0.4}):Play()
        TweenService:Create(cardStroke, TweenInfo.new(0.2), {Transparency = 0.6}):Play()
    end)
    
    clickButton.MouseButton1Click:Connect(function()
        playAnimation(anim.id)
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
    local spacing = 10
    
    for i, anim in ipairs(animList) do
        local col = (i - 1) % columns
        local row = math.floor((i - 1) / columns)
        createAnimCard(anim, col, row)
    end
    
    local totalRows = math.ceil(#animList / columns)
    buttonContainer.CanvasSize = UDim2.new(0, 0, 0, totalRows * (buttonSize + 40 + spacing))
end

local categoryButtons = {}
local yPos = 0

for categoryName, _ in pairs(animations) do
    local catButton = Instance.new("TextButton")
    catButton.Name = categoryName
    catButton.Size = UDim2.new(1, 0, 0, 40)
    catButton.Position = UDim2.new(0, 0, 0, yPos)
    catButton.BackgroundColor3 = categoryName == selectedCategory and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(60, 60, 80)
    catButton.BackgroundTransparency = 0.3
    catButton.BorderSizePixel = 0
    catButton.Text = categoryName
    catButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    catButton.TextSize = 15
    catButton.Font = Enum.Font.GothamBold
    catButton.Parent = leftPanel
    
    local catCorner = Instance.new("UICorner")
    catCorner.CornerRadius = UDim.new(0, 10)
    catCorner.Parent = catButton
    
    local catStroke = Instance.new("UIStroke")
    catStroke.Color = Color3.fromRGB(255, 255, 255)
    catStroke.Thickness = 1.5
    catStroke.Transparency = 0.7
    catStroke.Parent = catButton
    
    categoryButtons[categoryName] = catButton
    yPos = yPos + 50
end

for categoryName, button in pairs(categoryButtons) do
    button.MouseButton1Click:Connect(function()
        selectedCategory = categoryName
        
        for name, btn in pairs(categoryButtons) do
            if name == selectedCategory then
                TweenService:Create(btn, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(100, 150, 255),
                    BackgroundTransparency = 0.2
                }):Play()
            else
                TweenService:Create(btn, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(60, 60, 80),
                    BackgroundTransparency = 0.3
                }):Play()
            end
        end
        
        updateAnimationButtons()
    end)
end

stopButton.MouseButton1Click:Connect(function()
    stopAllAnimations()
end)

stopButton.MouseEnter:Connect(function()
    TweenService:Create(stopButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
end)

stopButton.MouseLeave:Connect(function()
    TweenService:Create(stopButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.4}):Play()
end)

minimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    if isMinimized then
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 200, 0, 50),
            BackgroundTransparency = 0.2
        }):Play()
        leftPanel.Visible = false
        rightPanel.Visible = false
        minimizeButton.Text = "□"
    else
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 600, 0, 400),
            BackgroundTransparency = 0.3
        }):Play()
        leftPanel.Visible = true
        rightPanel.Visible = true
        minimizeButton.Text = "−"
    end
end)

minimizeButton.MouseEnter:Connect(function()
    TweenService:Create(minimizeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
end)

minimizeButton.MouseLeave:Connect(function()
    TweenService:Create(minimizeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
end)

closeButton.MouseButton1Click:Connect(function()
    stopAllAnimations()
    screenGui:Destroy()
end)

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
end)

local function initializeHub()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        updateAnimationButtons()
        print("Animation Hub inicializado correctamente!")
    else
        player.CharacterAdded:Wait()
        task.wait(0.5)
        updateAnimationButtons()
        print("Animation Hub inicializado después de CharacterAdded!")
    end
end

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
