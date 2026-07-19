-- IIIIIIIIII-HUB Loader - Script Completo con Nuevo Kill All
getgenv().SCRIPT_KEY = "KEYLESS"

local UIS = game:GetService("UserInputService")
local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled

local function createFallbackLibrary()
    local CoreGui = game:GetService("CoreGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "IIIIIIIIII-FallbackUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = CoreGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 420, 0, 320)
    mainFrame.Position = UDim2.new(0.5, -210, 0.5, -160)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -20, 0, 30)
    title.Position = UDim2.new(0, 10, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "IIIIIIIIII-HUB"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 18
    title.Font = Enum.Font.SourceSansBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = mainFrame

    local leftTabs = Instance.new("Frame")
    leftTabs.Name = "LeftTabs"
    leftTabs.Size = UDim2.new(0, 120, 1, -50)
    leftTabs.Position = UDim2.new(0, 10, 0, 50)
    leftTabs.BackgroundTransparency = 1
    leftTabs.Parent = mainFrame
    local leftLayout = Instance.new("UIListLayout")
    leftLayout.Padding = UDim.new(0, 6)
    leftLayout.Parent = leftTabs

    local contentArea = Instance.new("Frame")
    contentArea.Name = "Content"
    contentArea.Size = UDim2.new(1, -150, 1, -50)
    contentArea.Position = UDim2.new(0, 140, 0, 50)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = mainFrame

    local library = {}
    function library:Window(opts)
        local window = {}
        window.IsOpen = true
        window.Items = {MainFrame = {Instance = mainFrame}, LeftTabs = {Instance = leftTabs}}
        window.Pages = {}
        local currentPage = nil

        function window:SetOpen(open)
            window.IsOpen = open
            if mainFrame then
                mainFrame.Visible = open
            end
        end

        function window:Page(data)
            local page = {Name = data.Name or "Page", Items = {}, Sections = {}}
            local pageFrame = Instance.new("Frame")
            pageFrame.Size = UDim2.new(1, 0, 1, 0)
            pageFrame.BackgroundTransparency = 1
            pageFrame.Parent = contentArea
            pageFrame.Visible = false
            local pageLayout = Instance.new("UIListLayout")
            pageLayout.Padding = UDim.new(0, 8)
            pageLayout.Parent = pageFrame

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 0, 30)
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            button.Text = data.Name or "Page"
            button.TextColor3 = Color3.new(1, 1, 1)
            button.TextSize = 13
            button.Font = Enum.Font.SourceSans
            button.Parent = leftTabs
            Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)
            button.MouseButton1Click:Connect(function()
                for _, p in ipairs(window.Pages) do
                    if p.PageFrame then p.PageFrame.Visible = false end
                end
                pageFrame.Visible = true
                currentPage = page
            end)

            page.Items.Inactive = {Instance = button}
            local iconLabel = Instance.new("TextLabel")
            iconLabel.Name = "Icon"
            iconLabel.Size = UDim2.new(0, 18, 0, 18)
            iconLabel.Position = UDim2.new(0, 6, 0.5, -9)
            iconLabel.BackgroundTransparency = 1
            iconLabel.Text = "•"
            iconLabel.TextColor3 = Color3.new(1, 1, 1)
            iconLabel.TextSize = 18
            iconLabel.Font = Enum.Font.SourceSansBold
            iconLabel.Parent = button
            page.Items.Icon = {Instance = iconLabel}

            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "Text"
            textLabel.Size = UDim2.new(1, -30, 1, 0)
            textLabel.Position = UDim2.new(0, 24, 0, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = data.Name or "Page"
            textLabel.TextColor3 = Color3.new(1, 1, 1)
            textLabel.TextSize = 13
            textLabel.Font = Enum.Font.SourceSans
            textLabel.TextXAlignment = Enum.TextXAlignment.Left
            textLabel.Parent = button
            page.Items.Text = {Instance = textLabel}

            function page:Section(data)
                local sectionFrame = Instance.new("Frame")
                sectionFrame.Size = UDim2.new(1, 0, 0, 0)
                sectionFrame.BackgroundTransparency = 1
                sectionFrame.Parent = pageFrame
                local sectionLayout = Instance.new("UIListLayout")
                sectionLayout.Padding = UDim.new(0, 6)
                sectionLayout.Parent = sectionFrame
                local sectionPadding = Instance.new("UIPadding")
                sectionPadding.PaddingTop = UDim.new(0, 4)
                sectionPadding.PaddingBottom = UDim.new(0, 4)
                sectionPadding.PaddingLeft = UDim.new(0, 4)
                sectionPadding.PaddingRight = UDim.new(0, 4)
                sectionPadding.Parent = sectionFrame

                local header = Instance.new("TextLabel")
                header.Size = UDim2.new(1, 0, 0, 22)
                header.BackgroundTransparency = 1
                header.Text = data.Name or "Section"
                header.TextColor3 = Color3.new(1, 1, 1)
                header.TextSize = 14
                header.Font = Enum.Font.SourceSansSemibold
                header.TextXAlignment = Enum.TextXAlignment.Left
                header.Parent = sectionFrame

                local controls = Instance.new("Frame")
                controls.Size = UDim2.new(1, 0, 0, 0)
                controls.BackgroundTransparency = 1
                controls.Parent = sectionFrame
                local controlLayout = Instance.new("UIListLayout")
                controlLayout.Padding = UDim.new(0, 6)
                controlLayout.Parent = controls
                local controlPadding = Instance.new("UIPadding")
                controlPadding.PaddingTop = UDim.new(0, 4)
                controlPadding.PaddingBottom = UDim.new(0, 4)
                controlPadding.PaddingLeft = UDim.new(0, 4)
                controlPadding.PaddingRight = UDim.new(0, 4)
                controlPadding.Parent = controls

                local section = {Name = data.Name or "Section", Items = {Content = {Instance = controls}}}
                local function createControl(text)
                    local frame = Instance.new("Frame")
                    frame.Size = UDim2.new(1, 0, 0, 30)
                    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    frame.BorderSizePixel = 0
                    frame.Parent = controls
                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, -10, 1, 0)
                    label.Position = UDim2.new(0, 5, 0, 0)
                    label.BackgroundTransparency = 1
                    label.Text = text or "Control"
                    label.TextColor3 = Color3.new(1, 1, 1)
                    label.TextSize = 12
                    label.Font = Enum.Font.SourceSans
                    label.TextXAlignment = Enum.TextXAlignment.Left
                    label.Parent = frame
                    return frame
                end

                function section:Toggle(opts)
                    local ctrl = createControl(opts.Name or "Toggle")
                    if opts.Callback then
                        ctrl.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                                opts.Callback(true)
                            end
                        end)
                    end
                    return ctrl
                end
                function section:Slider(opts)
                    local ctrl = createControl(opts.Name or "Slider")
                    return ctrl
                end
                function section:Button(opts)
                    local ctrl = createControl(opts.Name or "Button")
                    if opts.Callback then
                        ctrl.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                                opts.Callback()
                            end
                        end)
                    end
                    return ctrl
                end
                function section:Label(text)
                    return createControl(text)
                end
                function section:Dropdown(opts)
                    local ctrl = createControl(opts.Name or "Dropdown")
                    return ctrl
                end

                page.Sections[#page.Sections + 1] = section
                return section
            end

            page.PageFrame = pageFrame
            window.Pages[#window.Pages + 1] = page
            if #window.Pages == 1 then
                pageFrame.Visible = true
                currentPage = page
            end
            return page
        end

        function window:Unload()
            if screenGui and screenGui.Parent then screenGui:Destroy() end
        end

        return window
    end

    function library:Unload()
        if screenGui and screenGui.Parent then screenGui:Destroy() end
    end
    return library
end

local function loadUiLibrary()
    local existing = getgenv().Library
    if existing and type(existing) == "table" and existing.Window then
        return existing
    end

    local _loader = loadstring or load
    local urls = isMobile and {
        "https://raw.githubusercontent.com/wearewereszives/mobile.lua/refs/heads/main/mobile.lua"
    } or {
        "https://gist.githubusercontent.com/rojosinsane-dev/620314eb301f276da6f2eda4c8097c11/raw",
        "https://gist.githubusercontent.com/rojosinsane-dev/d38fd3b74c4556f16ebcafb61f914f06/raw"
    }

    for _, url in ipairs(urls) do
        local ok, result = pcall(function()
            local chunk = game:HttpGet(url)
            if type(chunk) ~= "string" then
                return nil
            end
            local loaded = _loader(chunk)
            if type(loaded) == "function" then
                return loaded()
            end
            return loaded
        end)

        if ok and result and type(result) == "table" and result.Window then
            getgenv().Library = result
            return result
        end
    end

    local fallback = nil
    local okFallback, libraryResult = pcall(createFallbackLibrary)
    if okFallback and type(libraryResult) == "table" and libraryResult.Window then
        fallback = libraryResult
    else
        fallback = {
            Window = function() return {
                SetOpen = function() end,
                Page = function() return {
                    Section = function() return {
                        Toggle = function() end,
                        Slider = function() end,
                        Button = function() end,
                        Label = function() end,
                        Dropdown = function() end,
                    } end,
                } end,
            } end,
            Unload = function() end,
        }
    end

    getgenv().Library = fallback
    return fallback
end

if isMobile then
    -- MOBILE EDITION
    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    local Camera = workspace.CurrentCamera
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local DefaultSpeed = Humanoid.WalkSpeed
    local DefaultGravity = Workspace.Gravity
    local DefaultJumpPower = Humanoid.JumpPower or 50

    local Library = loadUiLibrary()
    if not Library then
        warn("No se pudo cargar la libreria UI remota, usando fallback seguro")
        Library = createFallbackLibrary()
    end
    
    ------------------------------------------------
    -- VARIABLES GLOBALES
    ------------------------------------------------
    local SpeedEnabled       = false
    local WalkSpeedValue     = 16
    local InfiniteJump       = false
    local GravityEnabled     = false
    local GravityValue       = 50
    local FlyEnabled         = false
    local FlySpeed           = 50
    local NoclipEnabled      = false
    local JumpPowerEnabled   = false
    local CustomJumpPower    = 50
    local FarmEnabled        = false
    local FarmSpeed          = 16
    
    local EspEnabled         = false
    local EspHighlightEnabled = false
    local EspNames           = false
    local EspDistance        = false
    local EspTeamCheck       = false
    
    local HitboxExpanderEnabled  = false
    local HitboxSize             = 10
    local InvisibleHitboxEnabled = false
    local InvisibleHitboxSize    = 10
    local HB_OrigSize = {}
    
    local function restoreAllHitboxes()
        for player, origSize in pairs(HB_OrigSize) do
            pcall(function()
                if player and player.Character then
                    local root = player.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.Size         = origSize
                        root.Transparency = 1
                        root.BrickColor   = BrickColor.new("Medium stone grey")
                        root.CanCollide   = true
                    end
                end
            end)
        end
        HB_OrigSize = {}
    end
    
    local NinjaEnabled        = false
    local ZombieEnabled       = false
    local OriginalAnimations  = {}
    local NinjaLoopConnection = nil
    local ZombieConnections   = {}
    
    ------------------------------------------------
    -- ⭐⭐⭐ KILL ALL (NUEVO SISTEMA)
    ------------------------------------------------
    local manualList = {}
    local rs = ReplicatedStorage
    local net = rs:WaitForChild("Packages"):WaitForChild("Net")
    local g = (getgenv and getgenv()) or _G
    g.__RE_FINDER = g.__RE_FINDER or {}
    local key = game.JobId
    local killAllOn = false
    local found = g.__RE_FINDER[key]
    
    local function getTeamIdentity(player)
        if not player then
            return nil
        end

        local attrTeam = player:GetAttribute("Team")
        if attrTeam ~= nil then
            return attrTeam
        end

        local team = player.Team
        if team and team:IsA("Team") then
            return team
        end

        local attrTeamName = player:GetAttribute("TeamName")
        if attrTeamName ~= nil then
            return attrTeamName
        end

        return nil
    end

    local function isEnemy(v)
        if not v or v == LocalPlayer then
            return false
        end

        local localTeam = getTeamIdentity(LocalPlayer)
        local targetTeam = getTeamIdentity(v)
        if localTeam ~= nil and targetTeam ~= nil then
            return localTeam ~= targetTeam
        end

        return false
    end
    
    local function getTarget()
        local m = LocalPlayer:GetAttribute("Map")
        local gm = LocalPlayer:GetAttribute("Game")
        for _, v in ipairs(Players:GetPlayers()) do
            if v ~= LocalPlayer then
                local c = v.Character
                local h = c and c:FindFirstChildOfClass("Humanoid")
                if h and h.Health > 0 and isEnemy(v) and v:GetAttribute("Map") == m and v:GetAttribute("Game") == gm then
                    return v
                end
            end
        end
    end
    
    local function getList()
        if #manualList > 0 then
            return manualList
        end
        local t = {}
        for _, o in ipairs(net:GetChildren()) do
            if o:IsA("RemoteEvent") and o.Name:sub(1, 3) == "RE/" then
                t[#t + 1] = o.Name
            end
        end
        return t
    end
    
    local function fire(name)
        local re = net:FindFirstChild(name)
        local tg = getTarget()
        if re and tg then
            re:FireServer("bb15e94b-1af0-48fe-be2b-b2f9e007565a", tg)
        end
    end
    
    local function waitMap()
        while LocalPlayer:GetAttribute("Map") == nil do
            LocalPlayer:GetAttributeChangedSignal("Map"):Wait()
        end
    end
    
    local function test(name)
        local tg = getTarget()
        if not tg then
            return false
        end
        local c = tg.Character or tg.CharacterAdded:Wait()
        local h = c:WaitForChild("Humanoid", 5)
        if not h or h.Health <= 0 then
            return false
        end
        local dead = false
        local cn = h.Died:Connect(function()
            dead = true
        end)
        local t = os.clock()
        while os.clock() - t < 3 do
            if dead or h.Health <= 0 then
                dead = true
                break
            end
            fire(name)
            task.wait()
        end
        cn:Disconnect()
        return dead
    end
    
    local function waitTg()
        while killAllOn and not getTarget() do
            task.wait(0.5)
        end
        return getTarget() ~= nil
    end
    
    task.spawn(function()
        waitMap()
        while true do
            task.wait()
            if not killAllOn then
                task.wait(0.1)
            elseif not found then
                if waitTg() then
                    for _, name in ipairs(getList()) do
                        if not killAllOn then
                            break
                        end
                        if test(name) then
                            found = name
                            g.__RE_FINDER[key] = name
                            break
                        else
                            waitTg()
                        end
                    end
                end
            else
                fire(found)
                task.wait()
            end
        end
    end)
    
    ------------------------------------------------
    -- ⭐⭐⭐ DETECCIÓN DE PARTIDA - MÉTODO MATCHID
    ------------------------------------------------
    local _inGame = false
    
    local function isInGame()
        return LocalPlayer:GetAttribute("MatchId") ~= nil
    end

    local function isPlayerInGame(player)
        if player == LocalPlayer then
            return isInGame()
        end

        local myMatch = LocalPlayer:GetAttribute("MatchId")
        local theirMatch = player:GetAttribute("MatchId")

        return myMatch ~= nil and theirMatch ~= nil and myMatch == theirMatch
    end

    local function isPlayerEnemy(player)
        if player == LocalPlayer then
            return false
        end

        if not isPlayerInGame(player) then
            return false
        end

        local myTeam = getTeamIdentity(LocalPlayer)
        local theirTeam = getTeamIdentity(player)

        if myTeam == nil or theirTeam == nil then
            return false
        end

        return myTeam ~= theirTeam
    end
    
    ------------------------------------------------
    -- JUMP POWER
    ------------------------------------------------
    local function applyJumpPower()
        if not Humanoid then return end
        Humanoid.JumpPower  = CustomJumpPower
        Humanoid.JumpHeight = CustomJumpPower * 0.8
    end
    
    ------------------------------------------------
    -- INVISIBLE SYSTEM
    ------------------------------------------------
    local INVIS_CONFIG = { INVISIBILITY_POSITION = Vector3.new(-25.95, 84, 3537.55) }
    local playerState  = { isInvisible = false }
    local characterVisualStates = {}
    
    local function captureCharacterVisualState(character)
        if not character then return end
        characterVisualStates[character] = {}
        for _, d in ipairs(character:GetDescendants()) do
            if d:IsA("BasePart") or d:IsA("Decal") then
                characterVisualStates[character][d] = d.Transparency
            end
        end
    end

    local function restoreCharacterVisualState(character)
        if not character then return end
        local state = characterVisualStates[character]
        if not state then return end
        for part, transparency in pairs(state) do
            if part and part.Parent then
                pcall(function()
                    part.Transparency = transparency
                end)
            end
        end
        characterVisualStates[character] = nil
    end
    
    local function setCharacterTransparency(character, transparency)
        if not character then return end
        if not characterVisualStates[character] then
            captureCharacterVisualState(character)
        end
        for _, d in ipairs(character:GetDescendants()) do
            if d:IsA("BasePart") or d:IsA("Decal") then
                pcall(function()
                    d.Transparency = transparency
                end)
            end
        end
    end
    
    local function toggleInvisibility(btn)
        if not LocalPlayer.Character then return end
        playerState.isInvisible = not playerState.isInvisible
        if playerState.isInvisible then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local savedCF = hrp.CFrame
            LocalPlayer.Character:MoveTo(INVIS_CONFIG.INVISIBILITY_POSITION)
            task.wait(0.15)
            local seat = Instance.new("Seat")
            seat.Name = "invischair"; seat.Anchored = false; seat.CanCollide = false
            seat.Transparency = 1; seat.Position = INVIS_CONFIG.INVISIBILITY_POSITION; seat.Parent = Workspace
            local weld = Instance.new("Weld")
            weld.Part0 = seat
            weld.Part1 = LocalPlayer.Character:FindFirstChild("Torso") or LocalPlayer.Character:FindFirstChild("UpperTorso")
            weld.Parent = seat
            task.wait(); seat.CFrame = savedCF
            setCharacterTransparency(LocalPlayer.Character, 0.5)
            btn.BackgroundColor3 = Color3.fromRGB(46, 204, 113); btn.Text = "VISIBLE"
        else
            local ic = Workspace:FindFirstChild("invischair")
            if ic then ic:Destroy() end
            if LocalPlayer.Character then setCharacterTransparency(LocalPlayer.Character, 0) end
            btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255); btn.Text = "INVISIBLE"
        end
    end
    
    local function createInvisGui()
        local sg = Instance.new("ScreenGui")
        sg.Name = "InvisToolMini"; sg.ResetOnSpawn = false; sg.Enabled = false; sg.Parent = game.CoreGui
        local f = Instance.new("Frame", sg)
        f.Size = UDim2.new(0,160,0,120); f.Position = UDim2.new(0.78,0,0.4,0)
        f.BackgroundColor3 = Color3.fromRGB(20,20,20); f.Active = true; f.Draggable = true
        Instance.new("UICorner", f).CornerRadius = UDim.new(0,8)
        local t = Instance.new("TextLabel", f)
        t.Size = UDim2.new(1,0,0,30); t.BackgroundTransparency = 1
        t.Text = "Invisible Menu"; t.TextColor3 = Color3.new(1,1,1); t.TextSize = 16; t.Font = Enum.Font.SourceSansBold
        local btn = Instance.new("TextButton", f)
        btn.Size = UDim2.new(0.9,0,0,50); btn.Position = UDim2.new(0.05,0,0.35,0)
        btn.BackgroundColor3 = Color3.fromRGB(0,170,255); btn.Text = "INVISIBLE"
        btn.TextColor3 = Color3.new(1,1,1); btn.TextSize = 16
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
        btn.MouseButton1Click:Connect(function() toggleInvisibility(btn) end)
        return sg
    end
    
    local InvisGuiInstance = createInvisGui()
    
    ------------------------------------------------
    -- ESP SYSTEM
    ------------------------------------------------
    local function createEspHighlight(character)
        if not character then return nil end
        local existing = character:FindFirstChild("Totally NOT Esp")
        if existing and existing:IsA("Highlight") then
            return existing
        end

        local hl = Instance.new("Highlight")
        hl.Name = "Totally NOT Esp"
        hl.Parent = character
        hl.Adornee = character
        hl.Enabled = true
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.FillColor = Color3.fromRGB(65, 165, 255)
        hl.FillTransparency = 0.35
        hl.OutlineColor = Color3.fromRGB(65, 165, 255)
        hl.OutlineTransparency = 0
        return hl
    end

    local function removeEspFromPlayer(player)
        if not player.Character then return end
        local h = player.Character:FindFirstChild("Totally NOT Esp")
        local i = player.Character:FindFirstChild("Icon")
        if h and h:IsA("Highlight") then h:Destroy() end
        if i then i:Destroy() end
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if root and HB_OrigSize[player] then
            root.Size         = HB_OrigSize[player]
            root.Transparency = 1
            root.BrickColor   = BrickColor.new("Medium stone grey")
            root.CanCollide   = true
            HB_OrigSize[player] = nil
        end
    end
    
    local function removeAllEsp()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then removeEspFromPlayer(p) end
        end
    end
    
    local function playerDistance(other)
        local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local theirHRP = other.Character and other.Character:FindFirstChild("HumanoidRootPart")
        if not myHRP or not theirHRP then return 0 end
        return math.floor((myHRP.Position - theirHRP.Position).Magnitude)
    end
    
    local function addEspToPlayer(player)
        if not EspEnabled or player == LocalPlayer or not player.Character then return end
        if not player.Character:FindFirstChild("HumanoidRootPart") then return end
        
        if EspTeamCheck then
            if not isInGame() then
                removeEspFromPlayer(player)
                return
            end
            if not isPlayerEnemy(player) then
                removeEspFromPlayer(player)
                return
            end
        end
        
        local _hum = player.Character:FindFirstChildOfClass("Humanoid")
        if not _hum or _hum.Health <= 0 then
            local _hl = player.Character:FindFirstChild("Totally NOT Esp")
            local _ic = player.Character:FindFirstChild("Icon")
            if _hl then _hl:Destroy() end
            if _ic then _ic:Destroy() end
            local _root = player.Character:FindFirstChild("HumanoidRootPart")
            if _root and HB_OrigSize[player] then
                _root.Size = HB_OrigSize[player]
                _root.Transparency = 1
                _root.BrickColor = BrickColor.new("Medium stone grey")
                _root.CanCollide = true
                HB_OrigSize[player] = nil
            end
            return
        end
        
        local existing = player.Character:FindFirstChild("Totally NOT Esp")
        local icon     = player.Character:FindFirstChild("Icon")
        local pos      = playerDistance(player)
        local txt      = (EspNames and player.Name or "") .. (EspNames and EspDistance and " | " or "") .. (EspDistance and "Dist: "..pos or "")
        
        if icon then
            local lbl = icon:FindFirstChild("ESP Text")
            if lbl then lbl.Text = txt end
        end
        
        if EspHighlightEnabled then
            local hl = createEspHighlight(player.Character)
            if hl then
                hl.Enabled = true
                hl.Adornee = player.Character
                hl.FillColor = Color3.fromRGB(65, 165, 255)
                hl.FillTransparency = 0.35
                hl.OutlineColor = Color3.fromRGB(65, 165, 255)
                hl.OutlineTransparency = 0
            end
        elseif existing and existing:IsA("Highlight") then
            existing:Destroy()
        end
        
        if not icon and (EspNames or EspDistance) then
            local bg = Instance.new("BillboardGui", player.Character)
            bg.Name = "Icon"; bg.AlwaysOnTop = true; bg.ExtentsOffset = Vector3.new(0,1,0)
            bg.Size = UDim2.new(0,800,0,50); bg.LightInfluence = 1
            local lbl = Instance.new("TextLabel", bg)
            lbl.Name = "ESP Text"; lbl.BackgroundTransparency = 1; lbl.Size = UDim2.new(1,0,1,0)
            lbl.Font = Enum.Font.SciFi; lbl.TextSize = 18; lbl.TextWrapped = true
            lbl.TextColor3 = Color3.fromRGB(65, 165, 255); lbl.Text = txt
        end
    end

    local NINJA_IDS = {
        idle1="rbxassetid://656117400", idle2="rbxassetid://656118341",
        walk="rbxassetid://656121766",  run="rbxassetid://656118852",
        jump="rbxassetid://656117878",  fall="rbxassetid://656115606",
        climb="rbxassetid://656114359", swim="rbxassetid://656119721",
        swimidle="rbxassetid://707876443"
    }
    local ZOMBIE_IDS = {
        idle1="rbxassetid://616158929", idle2="rbxassetid://616160636",
        walk="rbxassetid://616168032",  run="rbxassetid://616163682",
        jump="rbxassetid://616161997",  fall="rbxassetid://616157476",
        climb="rbxassetid://616156119", swim="rbxassetid://616165109",
        swimidle="rbxassetid://616166655"
    }
    
    local function saveOriginalAnimations(char)
        local anim = char:FindFirstChild("Animate")
        if not anim then return end
        OriginalAnimations = {}
        pcall(function()
                if anim:FindFirstChild("idle") then
                    OriginalAnimations.idle1 = anim.idle.Animation1.AnimationId
                    if anim.idle:FindFirstChild("Animation2") then
                        OriginalAnimations.idle2 = anim.idle.Animation2.AnimationId
                    end
                end
                for _, pair in ipairs({{"walk","WalkAnim"},{"run","RunAnim"},{"jump","JumpAnim"},
                    {"fall","FallAnim"},{"climb","ClimbAnim"},{"swim","SwimAnim"},{"swimidle","SwimIdleAnim"}}) do
                    if anim:FindFirstChild(pair[1]) and anim[pair[1]]:FindFirstChild(pair[2]) then
                        OriginalAnimations[pair[1]] = anim[pair[1]][pair[2]].AnimationId
                    end
                end
            end)
        end
        
        local function applyAnimPack(char, ids)
            local anim = char and char:FindFirstChild("Animate")
            if not anim then return end
            pcall(function()
                if anim:FindFirstChild("idle") then
                    anim.idle.Animation1.AnimationId = ids.idle1
                    if anim.idle:FindFirstChild("Animation2") then anim.idle.Animation2.AnimationId = ids.idle2 end
                end
                for _, pair in ipairs({{"walk","WalkAnim"},{"run","RunAnim"},{"jump","JumpAnim"},
                    {"fall","FallAnim"},{"climb","ClimbAnim"},{"swim","SwimAnim"},{"swimidle","SwimIdleAnim"}}) do
                    if anim:FindFirstChild(pair[1]) and anim[pair[1]]:FindFirstChild(pair[2]) then
                        anim[pair[1]][pair[2]].AnimationId = ids[pair[1]]
                    end
                end
            end)
        end
        
        local function resetAnimations(char)
            if not char or not next(OriginalAnimations) then return end
            local anim = char:FindFirstChild("Animate")
            if not anim then return end
            pcall(function()
                if OriginalAnimations.idle1 and anim:FindFirstChild("idle") then
                    anim.idle.Animation1.AnimationId = OriginalAnimations.idle1
                    if OriginalAnimations.idle2 and anim.idle:FindFirstChild("Animation2") then
                        anim.idle.Animation2.AnimationId = OriginalAnimations.idle2
                    end
                end
                for _, pair in ipairs({{"walk","WalkAnim"},{"run","RunAnim"},{"jump","JumpAnim"},
                    {"fall","FallAnim"},{"climb","ClimbAnim"},{"swim","SwimAnim"},{"swimidle","SwimIdleAnim"}}) do
                    if OriginalAnimations[pair[1]] and anim:FindFirstChild(pair[1]) and anim[pair[1]]:FindFirstChild(pair[2]) then
                        anim[pair[1]][pair[2]].AnimationId = OriginalAnimations[pair[1]]
                    end
                end
            end)
        end
        
        local function startNinjaLoop(char)
            if NinjaLoopConnection then NinjaLoopConnection:Disconnect() end
            task.spawn(function()
                while char and char.Parent and NinjaEnabled do
                    applyAnimPack(char, NINJA_IDS); task.wait(2)
                end
            end)
            NinjaLoopConnection = char.ChildAdded:Connect(function(child)
                if child.Name == "Animate" and NinjaEnabled then
                    task.wait(0.2); applyAnimPack(char, NINJA_IDS)
                end
            end)
        end
        
        local function stopZombie()
            for _, c in ipairs(ZombieConnections) do c:Disconnect() end
            ZombieConnections = {}
        end
        
        local function hookZombie(char)
            stopZombie()
            applyAnimPack(char, ZOMBIE_IDS)
            local anim = char:FindFirstChild("Animate")
            if anim then
                table.insert(ZombieConnections, anim.AncestryChanged:Connect(function()
                    task.defer(applyAnimPack, char, ZOMBIE_IDS)
                end))
            end
            table.insert(ZombieConnections, char.ChildAdded:Connect(function(x)
                if x.Name == "Animate" then task.defer(applyAnimPack, char, ZOMBIE_IDS) end
            end))
        end
        
        LocalPlayer.CharacterAdded:Connect(function(char)
            Character = char
            Humanoid  = char:WaitForChild("Humanoid")
            task.wait(0.3)
            if JumpPowerEnabled then applyJumpPower() end
            if NinjaEnabled then
                saveOriginalAnimations(char); task.wait(0.3)
                applyAnimPack(char, NINJA_IDS); startNinjaLoop(char)
            elseif ZombieEnabled then
                saveOriginalAnimations(char); hookZombie(char)
            end
            HB_OrigSize = {}
        end)
        
        UIS.JumpRequest:Connect(function()
            if InfiniteJump then
                local c = LocalPlayer.Character
                if c and c:FindFirstChild("Humanoid") then
                    c.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
        
        ------------------------------------------------
        -- SILENT AIM / FOV
        ------------------------------------------------
        local SilentAimEnabled   = false
        local FovCircleEnabled   = false
        local FovRadiusValue     = 100
        local MAX_DISTANCIA      = 500

        local fovCircle = Drawing and Drawing.new("Circle") or nil
        if fovCircle then
            fovCircle.Thickness = 2
            fovCircle.Color = Color3.fromRGB(65, 165, 255)
            fovCircle.Filled = false
            fovCircle.Transparency = 0.5
            fovCircle.Radius = FovRadiusValue
            fovCircle.Visible = false
        end

        local function updateFovCircle()
            if fovCircle then
                fovCircle.Radius = FovRadiusValue
                fovCircle.Visible = FovCircleEnabled
            end
        end

        RunService.RenderStepped:Connect(function()
            if fovCircle then
                local mousePos = UIS:GetMouseLocation()
                fovCircle.Position = Vector2.new(mousePos.X, mousePos.Y)
            end
        end)

        local function isEnemyVisible(targetPart)
            if not targetPart then return false end
            local origin = Camera.CFrame.Position
            local destination = targetPart.Position
            local direction = destination - origin
            local raycastParams = RaycastParams.new()
            raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
            raycastParams.FilterType = Enum.RaycastFilterType.Exclude
            local raycastResult = workspace:Raycast(origin, direction, raycastParams)
            if raycastResult then
                if raycastResult.Instance:IsDescendantOf(targetPart.Parent) then
                    return true
                end
            end
            return false
        end

        local function getBestTarget()
            local target = nil
            local shortestDistance = FovCircle and FovRadiusValue or 100
            local mousePos = UIS:GetMouseLocation()
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                    local isEnemy = (v.Team ~= LocalPlayer.Team or v.Team == nil)
                    if isEnemy then
                        local pos, onScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
                        if onScreen and isEnemyVisible(v.Character.Head) then
                            local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
                            if distance < shortestDistance then
                                target = v.Character.Head
                                shortestDistance = distance
                            end
                        end
                    end
                end
            end
            return target
        end

        local Mouse = LocalPlayer:GetMouse()
        local _silentAimHooked = false
        local function hookSilentAim()
            if _silentAimHooked then return end
            if not getrawmetatable or not setreadonly or not newcclosure then return end
            _silentAimHooked = true
            local mt = nil
            local success, result = pcall(getrawmetatable, Mouse)
            if success and result then
                mt = result
            else
                mt = getrawmetatable(game)
            end
            if not mt then return end
            local oldIndex = mt.__index
            setreadonly(mt, false)
            mt.__index = newcclosure(function(self, index)
                local isMouseObject = self == Mouse
                if not isMouseObject then
                    pcall(function()
                        if self and self.ClassName == "Mouse" then
                            isMouseObject = true
                        end
                    end)
                end
                if SilentAimEnabled and isMouseObject and (index == "Hit" or index == "Target") then
                    local target = getBestTarget()
                    if target then
                        return (index == "Hit" and target.CFrame or target)
                    end
                end
                return oldIndex(self, index)
            end)
            setreadonly(mt, true)
        end

        task.defer(hookSilentAim)
        local function hookRemoteFire()
            if not getrawmetatable or not setreadonly or not newcclosure or not getnamecallmethod then return end
            local success, mt = pcall(getrawmetatable, game)
            if not success or not mt then return end
            local oldNamecall = mt.__namecall
            setreadonly(mt, false)
            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if (method == "FireServer" or method == "InvokeServer") and SilentAimEnabled then
                    local nm = tostring(self.Name or "")
                    local lname = nm:lower()
                    if lname:find("gun") or lname:find("shoot") or lname:find("fire") or lname:find("debris") then
                        local target = getBestTarget()
                        if target then
                            local args = {...}
                            for i = 1, #args do
                                local a = args[i]
                                local ok, isInst = pcall(function() return a and a.IsA and a:IsA("Instance") end)
                                if ok and isInst then
                                    args[i] = target
                                    return oldNamecall(self, table.unpack(args))
                                end
                                if typeof and (typeof(a) == "Vector3" or typeof(a) == "CFrame") then
                                    args[i] = (typeof(a) == "Vector3" and target.Position) or target.CFrame
                                    return oldNamecall(self, table.unpack(args))
                                end
                            end
                            return oldNamecall(self, target)
                        end
                    end
                end
                return oldNamecall(self, ...)
            end)
            setreadonly(mt, true)
        end

        task.defer(hookRemoteFire)

        local function updateSilentAimState()
            if not SilentAimEnabled then return end
            hookSilentAim()
            hookRemoteFire()
        end
        
        ------------------------------------------------
        -- WINDOW (Degrad.lua)
        ------------------------------------------------
        local Window      = Library:Window({Name = "IIIIIIIIII-HUB", SubName = "Mobile Edition", Mode = "mobile"})

        local isMobile = game:GetService("UserInputService").TouchEnabled

        local MobileToggleGui = nil
        local MobileToggleButton = nil

        local function updateMobileToggleButton()
            if not MobileToggleButton then return end
            local open = Window and Window.IsOpen or false
            MobileToggleButton.Text = open and "☰" or "✕"
            MobileToggleButton.Parent.BackgroundColor3 = open and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(65, 165, 255)
        end

        local function toggleMobileUi()
            if not Window then return end
            Window:SetOpen(not Window.IsOpen)
            updateMobileToggleButton()
        end

        task.spawn(function()
            local coreGui = game:GetService("CoreGui")
            local sg = Instance.new("ScreenGui")
            sg.Name = "IIIIIIIIII-MobToggle"
            sg.ResetOnSpawn = false
            sg.Parent = coreGui

            local frame = Instance.new("Frame")
            frame.Name = "ToggleFrame"
            frame.Size = UDim2.new(0, 48, 0, 48)
            frame.Position = UDim2.new(0.9, -24, 0.88, -24)
            frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            frame.BorderSizePixel = 0
            frame.Active = true
            frame.Draggable = true
            frame.Parent = sg

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(1, 0)
            corner.Parent = frame

            local btn = Instance.new("TextButton")
            btn.Name = "ToggleButton"
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.Position = UDim2.new(0, 0, 0, 0)
            btn.BackgroundTransparency = 1
            btn.Text = "☰"
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 20
            btn.TextColor3 = Color3.new(1, 1, 1)
            btn.Parent = frame
            btn.MouseButton1Click:Connect(toggleMobileUi)

            MobileToggleGui = sg
            MobileToggleButton = btn
            updateMobileToggleButton()
        end)

        task.spawn(function()
            task.wait(0.1)
            local coreGui = game:GetService("CoreGui")
            local function applyMobileSize()
                for _, sg in ipairs(coreGui:GetChildren()) do
                    for _, frame in ipairs(sg:GetDescendants()) do
                        if frame:IsA("Frame") and frame.Size.X.Offset >= 300 and frame.Size.Y.Offset >= 200 then
                            frame.Size     = UDim2.new(0.86, 0, 0.96, 0)
                            frame.Position = UDim2.new(0.07, 0, 0.02, 0)
                            break
                        end
                    end
                end
            end
            applyMobileSize()
            task.wait(0.3)
            applyMobileSize()
            task.wait(0.5)
            applyMobileSize()
        end)

        local function applyMobileComfort()
            if not isMobile then return end

            local mainFrame = Window.Items and Window.Items["MainFrame"] and Window.Items["MainFrame"].Instance
            if mainFrame then
                mainFrame.Size = UDim2.new(0.86, 0, 0.96, 0)
                mainFrame.Position = UDim2.new(0.07, 0, 0.02, 0)
            end

            local leftTabs = Window.Items and Window.Items["LeftTabs"] and Window.Items["LeftTabs"].Instance
            if leftTabs then
                leftTabs.Size = UDim2.new(0, 220, 1, 0)
            end

            for _, page in ipairs(Window.Pages or {}) do
                local inactive = page.Items and page.Items.Inactive and page.Items.Inactive.Instance
                if inactive then
                    inactive.Size = UDim2.new(0, 170, 0, 50)
                end

                local icon = page.Items and page.Items.Icon and page.Items.Icon.Instance
                if icon then
                    icon.Size = UDim2.new(0, 22, 0, 22)
                    icon.Position = UDim2.new(0, 14, 0.5, 0)
                end

                local text = page.Items and page.Items.Text and page.Items.Text.Instance
                if text then
                    text.TextSize = 14
                    text.Position = UDim2.new(0, 42, 0.5, 0)
                end
            end

            for _, page in ipairs(Window.Pages or {}) do
                for _, section in ipairs(page.Sections or {}) do
                    local content = section.Items and section.Items["Content"] and section.Items["Content"].Instance
                    if content then
                        local layout = content:FindFirstChildOfClass("UIListLayout")
                        if layout then
                            layout.Padding = UDim.new(0, 8)
                        end

                        local padding = content:FindFirstChildOfClass("UIPadding")
                        if padding then
                            padding.PaddingTop = UDim.new(0, 10)
                            padding.PaddingBottom = UDim.new(0, 10)
                            padding.PaddingLeft = UDim.new(0, 10)
                            padding.PaddingRight = UDim.new(0, 10)
                        end
                    end
                end
            end
        end

        task.spawn(function()
            task.wait(0.8)
            applyMobileComfort()
        end)

        local MainPage     = Window:Page({Name = "Main",       Icon = "101636617799068"})
        local EspPage      = Window:Page({Name = "ESP",        Icon = "100050851789190"})
        local GunPage      = Window:Page({Name = "Gun",        Icon = "130510492706892"})
        local FarmPage     = Window:Page({Name = "Farm",       Icon = "101636617799068"})
        local AnimPage     = Window:Page({Name = "Animations", Icon = "92464809279921"})
        local SettingsPage = Window:Page({Name = "Settings",   Icon = "122669828593160"})

        task.spawn(function()
            task.wait(0.2)
            local farmIcon = FarmPage and FarmPage.Items and FarmPage.Items.Icon and FarmPage.Items.Icon.Instance
            if farmIcon and farmIcon:IsA("ImageLabel") then
                farmIcon.Image = "rbxassetid://101636617799068"
                farmIcon.ScaleType = Enum.ScaleType.Fit
            end

            local farmButton = FarmPage and FarmPage.Items and FarmPage.Items.Inactive and FarmPage.Items.Inactive.Instance
            if farmButton and farmButton:IsA("GuiObject") then
                farmButton.Visible = true
            end

            if FarmPage and FarmPage.PageFrame then
                local leftTabs = Window.Items and Window.Items.LeftTabs and Window.Items.LeftTabs.Instance
                if leftTabs and not leftTabs:FindFirstChild("FarmTabFallback") then
                    local manualFarmButton = Instance.new("TextButton")
                    manualFarmButton.Name = "FarmTabFallback"
                    manualFarmButton.Size = UDim2.new(1, 0, 0, 40)
                    manualFarmButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    manualFarmButton.TextColor3 = Color3.new(1, 1, 1)
                    manualFarmButton.TextSize = 14
                    manualFarmButton.Font = Enum.Font.SourceSans
                    manualFarmButton.Text = "Farm"
                    manualFarmButton.Parent = leftTabs
                    Instance.new("UICorner", manualFarmButton).CornerRadius = UDim.new(0, 8)
                    manualFarmButton.MouseButton1Click:Connect(function()
                        for _, page in ipairs(Window.Pages or {}) do
                            if page.PageFrame then
                                page.PageFrame.Visible = false
                            end
                        end
                        FarmPage.PageFrame.Visible = true
                    end)
                end
            end
        end)
        
        local MainLeft     = MainPage:Section({Name = "Player",     Side = 1})
        local MainRight    = MainPage:Section({Name = "Movement",   Side = 2})
        local EspLeft      = EspPage:Section({Name = "ESP Settings",Side = 1})
        local EspRight     = EspPage:Section({Name = "Visuals",     Side = 2})
        local GunLeft      = GunPage:Section({Name = "Gun Features",Side = 1})
        local GunRight     = GunPage:Section({Name = "Silent Aim",Side = 2})
        local AimSection   = GunPage:Section({Name = "Aim Features", Side = 1})
        local FarmLeft     = FarmPage:Section({Name = "Farm Tools", Side = 1})
        local FarmRight    = FarmPage:Section({Name = "Automation", Side = 2})

        -- Aimbot settings (exposed in the main menu as simple controls)
        local AimEnabled = false
        local AimWallCheck = true
        local AimTargetPart = "Head"
        local AimFOV = 180
        local AimSmoothness = 0.15
        local AimPrediction = 0.08
        local AimCurrentTool = nil
        local AimRenderConn = nil

        AimSection:Toggle({Name = "Aimbot", Flag = "AimbotToggle", Default = false, Callback = function(v)
            AimEnabled = v
        end})

        AimSection:Toggle({Name = "Wall Check", Flag = "AimbotWallCheck", Default = true, Callback = function(v)
            AimWallCheck = v
        end})

        AimSection:Dropdown({
            Name = "Target Body Part",
            Flag = "AimbotTargetPart",
            Items = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"},
            Default = AimTargetPart,
            Callback = function(v)
                AimTargetPart = v
            end
        })

        AimSection:Slider({Name = "FOV", Flag = "AimbotFOV", Default = AimFOV, Min = 30, Max = 1000, Rounding = 0, Callback = function(v)
            AimFOV = math.clamp(v, 30, 1000)
        end})
        AimSection:Slider({Name = "Smoothness", Flag = "AimbotSmoothness", Default = AimSmoothness, Min = 0.01, Max = 1, Rounding = 2, Callback = function(v)
            AimSmoothness = math.clamp(v, 0.01, 1)
        end})

        -- Tool tracking and aimbot core
        local function IsAllowedWeapon(tool)
            if not tool or not tool:IsA("Tool") then return false end
            local name = (tool.Name or ""):lower()
            return name:find("revolver") or name:find("gun") or name:find("pistol") or name:find("knife")
        end

        local function IsTargetAlive(part)
            if not part or not part.Parent then return false end
            local hum = part.Parent:FindFirstChildOfClass("Humanoid")
            return hum and hum.Health > 0
        end

        local function HasWallBetween(from, to)
            if not AimWallCheck then return false end
            local dir = to - from
            local dist = dir.Magnitude
            if dist == 0 then return false end
            local rp = RaycastParams.new()
            rp.FilterType = Enum.RaycastFilterType.Exclude
            rp.FilterDescendantsInstances = {LocalPlayer.Character}
            local res = workspace:Raycast(from, dir.Unit * dist, rp)
            if res and res.Instance then
                local hit = res.Instance
                if hit and hit.CanCollide then return true end
            end
            return false
        end

        local function GetClosestEnemy()
            local Players = game:GetService("Players")
            local closest = nil
            local shortest = AimFOV
            local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myRoot then return nil end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and isPlayerEnemy(plr) and plr.Character then
                    local part = plr.Character:FindFirstChild(AimTargetPart)
                    local root = plr.Character:FindFirstChild("HumanoidRootPart")
                    if part and root then
                        local dist = (myRoot.Position - root.Position).Magnitude
                        local _, onScreen = Camera:WorldToViewportPoint(part.Position)
                        if onScreen then
                            if not HasWallBetween(Camera.CFrame.Position, part.Position) and dist < shortest then
                                shortest = dist
                                closest = part
                            end
                        end
                    end
                end

            end
            return closest
        end

        local function UpdateAimbot()
            if not AimEnabled then return end
            if not AimCurrentTool or not IsAllowedWeapon(AimCurrentTool) then return end
            local targetPart = GetClosestEnemy()
            if targetPart and IsTargetAlive(targetPart) then
                if AimWallCheck and HasWallBetween(Camera.CFrame.Position, targetPart.Position) then return end
                local targetPos = targetPart.Position
                local root = targetPart.Parent and targetPart.Parent:FindFirstChild("HumanoidRootPart")
                if root then targetPos = targetPos + (root.Velocity * AimPrediction) end
                local dir = (targetPos - Camera.CFrame.Position).Unit
                local targetCFrame = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + dir)
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, AimSmoothness)
            end
        end

        -- track equipped tool
        local function SetupCharTools(char)
            char.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then AimCurrentTool = child end
            end)
            char.ChildRemoved:Connect(function(child)
                if child == AimCurrentTool then AimCurrentTool = nil end
            end)
            for _, c in ipairs(char:GetChildren()) do if c:IsA("Tool") then AimCurrentTool = c end end
        end

        if LocalPlayer.Character then SetupCharTools(LocalPlayer.Character) end
        LocalPlayer.CharacterAdded:Connect(function(c) task.wait(0.6); SetupCharTools(c) end)

        if AimRenderConn then AimRenderConn:Disconnect() end
        AimRenderConn = RunService.RenderStepped:Connect(UpdateAimbot)

        
        local AnimLeft   = AnimPage:Section({Name = "Animation Packs", Side = 1})
        local SettLeft   = SettingsPage:Section({Name = "Menu",   Side = 1})
        local SettRight  = SettingsPage:Section({Name = "Anti Lag", Side = 2})
        
        MainLeft:Label("Movement and utility system")
        
        MainLeft:Toggle({
            Name = "Enable WalkSpeed", Flag = "SpeedToggle", Default = false,
            Callback = function(value)
                SpeedEnabled = value
                if not value then
                    local c = LocalPlayer.Character
                    if c and c:FindFirstChild("Humanoid") then c.Humanoid.WalkSpeed = DefaultSpeed end
                end
            end
        })
        
        MainLeft:Slider({
            Name = "WalkSpeed", Flag = "WalkSpeed", Default = 16, Min = 16, Max = 500, Rounding = 0,
            Callback = function(value)
                local clamped = math.clamp(value, 16, 500)
                WalkSpeedValue = clamped
                if SpeedEnabled then
                    local c = LocalPlayer.Character
                    if c and c:FindFirstChild("Humanoid") then c.Humanoid.WalkSpeed = clamped end
                end
            end
        })
        
        MainLeft:Toggle({
            Name = "Infinite Jump", Flag = "InfiniteJump", Default = false,
            Callback = function(value) InfiniteJump = value end
        })
        
        MainLeft:Toggle({
            Name = "Low Gravity", Flag = "LowGravity", Default = false,
            Callback = function(value)
                GravityEnabled = value
                Workspace.Gravity = value and GravityValue or DefaultGravity
            end
        })
        
        MainLeft:Slider({
            Name = "Gravity Power", Flag = "GravityAmount", Default = 50, Min = 0, Max = 196, Rounding = 0,
            Callback = function(value)
                GravityValue = value
                if GravityEnabled then Workspace.Gravity = value end
            end
        })
        
        MainLeft:Button({
            Name = "Invisible Menu",
            Callback = function()
                InvisGuiInstance.Enabled = not InvisGuiInstance.Enabled
            end
        })
        
        MainRight:Label("Advanced settings")
        
        MainRight:Toggle({
            Name = "Enable JumpPower", Flag = "JumpPowerToggle", Default = false,
            Callback = function(value)
                JumpPowerEnabled = value
                if value then applyJumpPower()
                else
                    if Humanoid then Humanoid.JumpPower = DefaultJumpPower; Humanoid.JumpHeight = 7.2 end
                end
            end
        })
        
        MainRight:Slider({
            Name = "JumpPower", Flag = "JumpPower", Default = 50, Min = 50, Max = 500, Rounding = 0,
            Callback = function(value)
                local clamped = math.clamp(value, 50, 500)
                CustomJumpPower = clamped
                if JumpPowerEnabled then applyJumpPower() end
            end
        })
        
        MainRight:Toggle({
            Name = "Fly", Flag = "FlyToggle", Default = false,
            Callback = function(value)
                FlyEnabled = value
                if not value then
                    local c = LocalPlayer.Character
                    if c then
                        local hrp = c:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            if hrp:FindFirstChild("IIIIFly") then hrp.IIIIFly:Destroy() end
                            if hrp:FindFirstChild("IIIIFlyGyro") then hrp.IIIIFlyGyro:Destroy() end
                        end
                        if c:FindFirstChild("Humanoid") then c.Humanoid.PlatformStand = false end
                    end
                end
            end
        })
        
        MainRight:Slider({
            Name = "Fly Speed", Flag = "FlySpeed", Default = 50, Min = 10, Max = 300, Rounding = 0,
            Callback = function(value) FlySpeed = math.clamp(value, 10, 300) end
        })
        
        MainRight:Toggle({
            Name = "Noclip", Flag = "Noclip", Default = false,
            Callback = function(value) NoclipEnabled = value end
        })
        
        EspLeft:Toggle({
            Name = "Enable ESP", Flag = "EspEnabled", Default = false,
            Callback = function(value)
                EspEnabled = value
                if not value then
                    removeAllEsp()
                end
            end
        })

        EspLeft:Toggle({
            Name = "ESP Highlight", Flag = "EspHighlightEnabled", Default = false,
            Callback = function(value)
                EspHighlightEnabled = value
                if not value then
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character then
                            local hl = p.Character:FindFirstChild("Totally NOT Esp")
                            if hl then hl:Destroy() end
                        end
                    end
                end
            end
        })

        EspLeft:Toggle({
            Name = "ESP Names", Flag = "EspNames", Default = false,
            Callback = function(value)
                EspNames = value
            end
        })
        
        EspLeft:Toggle({
            Name = "ESP Distance", Flag = "EspDistance", Default = false,
            Callback = function(value)
                EspDistance = value
            end
        })
        
        EspRight:Toggle({
            Name = "Team Check", Flag = "EspTeamCheck", Default = false,
            Callback = function(value)
                EspTeamCheck = value
                if not value then
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character then
                            local hl = p.Character:FindFirstChild("Totally NOT Esp")
                            if hl then hl:Destroy() end
                        end
                    end
                end
            end
        })
        
        GunLeft:Toggle({
            Name = "Hit Box Expander", Flag = "HitBoxExpander", Default = false,
            Callback = function(value)
                HitboxExpanderEnabled = value
                if not value then restoreAllHitboxes() end
            end
        })
        
        GunLeft:Slider({
            Name = "Hitbox Size", Flag = "HitBoxSize", Default = 10, Min = 1, Max = 200, Rounding = 0,
            Callback = function(value) HitboxSize = value end
        })
        
        GunLeft:Toggle({
            Name = "Invisible Hitbox", Flag = "InvisibleHitbox", Default = false,
            Callback = function(value)
                InvisibleHitboxEnabled = value
                if not value then restoreAllHitboxes() end
            end
        })
        
        GunLeft:Slider({
            Name = "Invisible Hitbox Size", Flag = "InvisibleHitboxSize", Default = 10, Min = 1, Max = 200, Rounding = 0,
            Callback = function(value) InvisibleHitboxSize = value end
        })
        
        GunLeft:Toggle({
            Name = "Kill All", Flag = "KillAllToggle", Default = false,
            Callback = function(value)
                killAllOn = value
            end
        })
        
        GunRight:Toggle({
            Name = "Silent Aim", Flag = "SilentAimToggle", Default = false,
            Callback = function(value)
                SilentAimEnabled = value
                if value then updateSilentAimState() end
            end
        })
        
        GunRight:Toggle({
            Name = "Show FOV", Flag = "ShowFOVToggle", Default = false,
            Callback = function(value)
                FovCircleEnabled = value
                updateFovCircle()
            end
        })
        
        GunRight:Slider({
            Name = "FOV Radius", Flag = "FOVRadius", Default = 100, Min = 1, Max = 500, Rounding = 0,
            Callback = function(value)
                FovRadiusValue = math.clamp(value, 1, 500)
                updateFovCircle()
            end
        })
        
        GunRight:Label("Note: Silent Aim may not work on all executors")

        FarmLeft:Toggle({
            Name = "Auto Farm", Flag = "AutoFarmToggle", Default = false,
            Callback = function(value)
                FarmEnabled = value
            end
        })

        FarmLeft:Slider({
            Name = "Farm Speed", Flag = "FarmSpeed", Default = 16, Min = 8, Max = 100, Rounding = 0,
            Callback = function(value)
                FarmSpeed = math.clamp(value, 8, 100)
            end
        })

        FarmRight:Button({
            Name = "Refresh Farm Targets",
            Callback = function()
                if FarmEnabled then
                    print("Farm targets refreshed")
                end
            end
        })

        FarmRight:Label("Farm helpers stay lightweight and can be toggled on or off")
        
        AnimLeft:Toggle({
            Name = "Ninja Animation Pack", Flag = "NinjaToggle", Default = false,
            Callback = function(value)
                NinjaEnabled = value
                if value then
                    ZombieEnabled = false
                    stopZombie()
                    local c = LocalPlayer.Character
                    if c then saveOriginalAnimations(c); task.wait(0.3); applyAnimPack(c, NINJA_IDS); startNinjaLoop(c) end
                else
                    if NinjaLoopConnection then NinjaLoopConnection:Disconnect(); NinjaLoopConnection = nil end
                    resetAnimations(LocalPlayer.Character)
                end
            end
        })
        
        AnimLeft:Toggle({
            Name = "Zombie Animation Pack", Flag = "ZombieToggle", Default = false,
            Callback = function(value)
                ZombieEnabled = value
                if value then
                    NinjaEnabled = false
                    if NinjaLoopConnection then NinjaLoopConnection:Disconnect(); NinjaLoopConnection = nil end
                    local c = LocalPlayer.Character
                    if c then saveOriginalAnimations(c); hookZombie(c) end
                else
                    stopZombie()
                    resetAnimations(LocalPlayer.Character)
                end
            end
        })
        
        AnimLeft:Button({
            Name = "Reset Animations Pack",
            Callback = function()
                NinjaEnabled = false; ZombieEnabled = false
                if NinjaLoopConnection then NinjaLoopConnection:Disconnect(); NinjaLoopConnection = nil end
                stopZombie()
                resetAnimations(LocalPlayer.Character)
            end
        })
        
        local _antiLagApplied = false
        local function runAntiLag()
            if _antiLagApplied then return end
            _antiLagApplied = true
            pcall(function()
                local Lighting = game:GetService("Lighting")
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 9e9
                Lighting.Brightness = 0
                Lighting.EnvironmentDiffuseScale = 0
                Lighting.EnvironmentSpecularScale = 0
                for _, v in ipairs(Lighting:GetChildren()) do
                    pcall(function()
                        if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect")
                        or v:IsA("ColorCorrectionEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Atmosphere") then
                            v:Destroy()
                        end
                    end)
                end
                local function optimizeObj(obj)
                    pcall(function()
                        if obj:IsA("BasePart") then
                            obj.Material = Enum.Material.Plastic
                            obj.Reflectance = 0
                            obj.CastShadow = false
                        elseif obj:IsA("Decal") or obj:IsA("Texture") then
                            obj:Destroy()
                        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam")
                        or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
                            obj:Destroy()
                        elseif obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                            obj:Destroy()
                        end
                    end)
                end
                for _, v in ipairs(game:GetDescendants()) do
                    optimizeObj(v)
                end
                game.DescendantAdded:Connect(optimizeObj)
            end)
        end
        
        SettRight:Button({
            Name = "Anti Lag",
            Callback = function()
                runAntiLag()
            end
        })
        
        SettLeft:Button({
            Name = "Unload",
            Callback = function()
                killAllOn = false
                Workspace.Gravity = DefaultGravity
                local c = LocalPlayer.Character
                if c and c:FindFirstChild("Humanoid") then
                    c.Humanoid.WalkSpeed = DefaultSpeed
                    c.Humanoid.JumpPower = DefaultJumpPower
                end
                local ic = Workspace:FindFirstChild("invischair")
                if ic then ic:Destroy() end
                removeAllEsp()
                if fovCircle then fovCircle.Visible = false end
                Library:Unload()
            end
        })
        
        SettLeft:Label("Type m in chat to toggle UI")
        
        LocalPlayer.Chatted:Connect(function(msg)
            if msg:lower() == "m" then Window:SetOpen(not Window.IsOpen) end
        end)
        
        RunService.Heartbeat:Connect(function()
            _inGame = isInGame()
            local c = LocalPlayer.Character
            local hum = c and c:FindFirstChild("Humanoid")
            if not hum then return end
            if SpeedEnabled then hum.WalkSpeed = WalkSpeedValue end
            if JumpPowerEnabled and hum.JumpPower ~= CustomJumpPower then applyJumpPower() end
        end)
        
        RunService.Heartbeat:Connect(function()
            if not FlyEnabled then return end
            local c = LocalPlayer.Character
            if not c then return end
            local hrp = c:FindFirstChild("HumanoidRootPart")
            local hum = c:FindFirstChild("Humanoid")
            if not hrp or not hum then return end
            if not hrp:FindFirstChild("IIIIFly") then
                local BV = Instance.new("BodyVelocity")
                BV.Name = "IIIIFly"; BV.MaxForce = Vector3.new(9e5,9e5,9e5); BV.Velocity = Vector3.zero; BV.Parent = hrp
                local BG = Instance.new("BodyGyro")
                BG.Name = "IIIIFlyGyro"; BG.MaxTorque = Vector3.new(9e5,9e5,9e5); BG.P = 1000; BG.CFrame = Camera.CFrame; BG.Parent = hrp
                hum.PlatformStand = true
            end
        end)
        
        RunService.RenderStepped:Connect(function()
            if not FlyEnabled then return end
            local c = LocalPlayer.Character
            if not c then return end
            local hrp = c:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local BV = hrp:FindFirstChild("IIIIFly")
            local BG = hrp:FindFirstChild("IIIIFlyGyro")
            if BV and BG then
                local dir = Vector3.zero
                if UIS:IsKeyDown(Enum.KeyCode.W) then dir += Camera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then dir -= Camera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then dir -= Camera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then dir += Camera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0,1,0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0,1,0) end
                BV.Velocity = dir * FlySpeed
                BG.CFrame   = Camera.CFrame
            end
        end)
        
        RunService.Stepped:Connect(function()
            if not NoclipEnabled then return end
            local c = LocalPlayer.Character
            if not c then return end
            for _, v in ipairs(c:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end)
        
        RunService.Heartbeat:Connect(function()
            if not (HitboxExpanderEnabled or InvisibleHitboxEnabled) then
                return
            end

            local players = Players:GetPlayers()
            for _, p in ipairs(players) do
                if p ~= LocalPlayer and p.Character then
                    local root = p.Character:FindFirstChild("HumanoidRootPart")
                    local hum  = p.Character:FindFirstChildOfClass("Humanoid")
                    local isDead = not hum or hum.Health <= 0
                    if root then
                        local shouldApplyHitbox = true
                        if EspTeamCheck and not isPlayerEnemy(p) then
                            shouldApplyHitbox = false
                    end

                    if not isDead and shouldApplyHitbox and HitboxExpanderEnabled then
                        if not HB_OrigSize[p] then HB_OrigSize[p] = root.Size end
                        root.Size         = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                        root.Transparency = 0.5
                        root.BrickColor   = BrickColor.new("Cyan")
                        root.CanCollide   = false
                    elseif not isDead and shouldApplyHitbox and InvisibleHitboxEnabled then
                        if not HB_OrigSize[p] then HB_OrigSize[p] = root.Size end
                        root.Size         = Vector3.new(InvisibleHitboxSize, InvisibleHitboxSize, InvisibleHitboxSize)
                        root.Transparency = 1
                        root.CanCollide   = false
                    else
                        if HB_OrigSize[p] then
                            root.Size         = HB_OrigSize[p]
                            root.Transparency = 1
                            root.BrickColor   = BrickColor.new("Medium stone grey")
                            root.CanCollide   = true
                            HB_OrigSize[p]    = nil
                        end
                    end
                end
            end
        end
    end)
    
    local function applyTeamCheck(player)
        if not EspEnabled or not EspTeamCheck then return end
        if not player.Character then return end

        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then
            removeEspFromPlayer(player)
            return
        end

        if not isPlayerEnemy(player) then
            removeEspFromPlayer(player)
            return
        end

        if not EspHighlightEnabled then
            removeEspFromPlayer(player)
            return
        end

        local hl = createEspHighlight(player.Character)
        if hl then
            hl.Enabled = true
            hl.Adornee = player.Character
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            hl.FillColor = Color3.fromRGB(65, 165, 255)
            hl.FillTransparency = 0.35
            hl.OutlineColor = Color3.fromRGB(65, 165, 255)
            hl.OutlineTransparency = 0
        end
    end

    local lastEspUpdate = 0
    RunService.Heartbeat:Connect(function()
        if not (EspEnabled or EspTeamCheck) then
            return
        end

        local now = tick()
        if now - lastEspUpdate < 0.15 then
            return
        end
        lastEspUpdate = now

        if EspTeamCheck and not isInGame() then
            removeAllEsp()
            return
        end

        local players = Players:GetPlayers()
        for _, p in ipairs(players) do
            if p ~= LocalPlayer and p.Character then
                if EspEnabled then
                    if not EspTeamCheck or isPlayerEnemy(p) then
                        pcall(addEspToPlayer, p)
                    else
                        pcall(removeEspFromPlayer, p)
                    end
                end
                if EspTeamCheck then
                    pcall(applyTeamCheck, p)
                end
            end
        end
    end)
    
    local function hookPlayerDeath(player)
        if player == LocalPlayer then return end
        player.CharacterAdded:Connect(function(char)
            local hum = char:WaitForChild("Humanoid", 5)
            if hum then
                hum.Died:Connect(function()
                    clearDeadPlayerEsp(player)
                    if player.Character then
                        local root = player.Character:FindFirstChild("HumanoidRootPart")
                        if root and HB_OrigSize[player] then
                            root.Size = HB_OrigSize[player]
                            root.Transparency = 1
                            root.BrickColor = BrickColor.new("Medium stone grey")
                            root.CanCollide = true
                        end
                    end
                    HB_OrigSize[player] = nil
                end)
            end
            task.wait(0.5)
            if EspEnabled then pcall(addEspToPlayer, player) end
        end)
        player.CharacterRemoving:Connect(function()
            if player.Character then
                local hl = player.Character:FindFirstChild("Totally NOT Esp")
                local ic = player.Character:FindFirstChild("Icon")
                if hl then hl:Destroy() end
                if ic then ic:Destroy() end
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                if root and HB_OrigSize[player] then
                    root.Size = HB_OrigSize[player]
                    root.Transparency = 1
                    root.BrickColor = BrickColor.new("Medium stone grey")
                    root.CanCollide = true
                end
            end
            HB_OrigSize[player] = nil
        end)
    end

    Players.PlayerAdded:Connect(hookPlayerDeath)

    for _, player in ipairs(Players:GetPlayers()) do
        hookPlayerDeath(player)
        if player.Character then
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.Died:Connect(function()
                    if player.Character then
                        local hl = player.Character:FindFirstChild("Totally NOT Esp")
                        local ic = player.Character:FindFirstChild("Icon")
                        if hl then hl:Destroy() end
                        if ic then ic:Destroy() end
                        local root = player.Character:FindFirstChild("HumanoidRootPart")
                        if root and HB_OrigSize[player] then
                            root.Size = HB_OrigSize[player]
                            root.Transparency = 1
                            root.BrickColor = BrickColor.new("Medium stone grey")
                            root.CanCollide = true
                        end
                    end
                    HB_OrigSize[player] = nil
                end)
            end
        end
    end

    Players.PlayerRemoving:Connect(function(player)
        HB_OrigSize[player] = nil
    end)
    
    print([[
/**
* ············································································
* :      :::        :::        :::            :::    ::: :::    ::: ::::::::::
* :     :+:        :+:        :+:            :+:    :+: :+:    :+: :+:    :+::
* :    +:+        +:+        +:+            +:+    +:+ +:+    +:+ +:+    +:+ :
* :   +#+        +#+        +#+            +#++:++#++ +#+    +:+ +#++:++#+   :
* :  +#+        +#+        +#+            +#+    +#+ +#+    +#+ +#+    +#+   :
* : #+#        #+#        #+#        #+# #+#    #+# #+#    #+# #+#    #+#    :
* :########## ########## ########## ### ###    ###  ########  #########      :
* ············································································
*/
]])
    
else
    -- PC EDITION (IDÉNTICO AL MOBILE)
    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    local Camera = workspace.CurrentCamera
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local DefaultSpeed = Humanoid.WalkSpeed
    local DefaultGravity = Workspace.Gravity
    local DefaultJumpPower = Humanoid.JumpPower or 50
    
    local Library = loadUiLibrary()
    if not Library then
        warn("No se pudo cargar la libreria UI remota, usando fallback seguro")
        Library = createFallbackLibrary()
    end
    
    local SpeedEnabled       = false
    local WalkSpeedValue     = 16
    local InfiniteJump       = false
    local GravityEnabled     = false
    local GravityValue       = 50
    local FlyEnabled         = false
    local FlySpeed           = 50
    local NoclipEnabled      = false
    local JumpPowerEnabled   = false
    local CustomJumpPower    = 50
    
    local EspEnabled         = false
    local EspHighlightEnabled = false
    local EspNames           = false
    local EspDistance        = false
    local EspTeamCheck       = false
    
    local HitboxExpanderEnabled  = false
    local HitboxSize             = 10
    local InvisibleHitboxEnabled = false
    local InvisibleHitboxSize    = 10
    local HB_OrigSize = {}
    
    local function restoreAllHitboxes()
        for player, origSize in pairs(HB_OrigSize) do
            pcall(function()
                if player and player.Character then
                    local root = player.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.Size         = origSize
                        root.Transparency = 1
                        root.BrickColor   = BrickColor.new("Medium stone grey")
                        root.CanCollide   = true
                    end
                end
            end)
        end
        HB_OrigSize = {}
    end
    
    local NinjaEnabled        = false
    local ZombieEnabled       = false
    local OriginalAnimations  = {}
    local NinjaLoopConnection = nil
    local ZombieConnections   = {}
    
    ------------------------------------------------
    -- ⭐⭐⭐ KILL ALL (NUEVO SISTEMA PC)
    ------------------------------------------------
    local manualList = {}
    local rs = ReplicatedStorage
    local net = rs:WaitForChild("Packages"):WaitForChild("Net")
    local g = (getgenv and getgenv()) or _G
    g.__RE_FINDER = g.__RE_FINDER or {}
    local key = game.JobId
    local killAllOn = false
    local found = g.__RE_FINDER[key]
    
    local function isEnemy(v)
        if not v or v == LocalPlayer then
            return false
        end
        local localTeam = LocalPlayer:GetAttribute("Team")
        local targetTeam = v:GetAttribute("Team")
        if localTeam ~= nil and targetTeam ~= nil then
            return localTeam ~= targetTeam
        end
        return true
    end
    
    local function getTarget()
        local m = LocalPlayer:GetAttribute("Map")
        local gm = LocalPlayer:GetAttribute("Game")
        for _, v in ipairs(Players:GetPlayers()) do
            if v ~= LocalPlayer then
                local c = v.Character
                local h = c and c:FindFirstChildOfClass("Humanoid")
                if h and h.Health > 0 and isEnemy(v) and v:GetAttribute("Map") == m and v:GetAttribute("Game") == gm then
                    return v
                end
            end
        end
    end
    
    local function getList()
        if #manualList > 0 then
            return manualList
        end
        local t = {}
        for _, o in ipairs(net:GetChildren()) do
            if o:IsA("RemoteEvent") and o.Name:sub(1, 3) == "RE/" then
                t[#t + 1] = o.Name
            end
        end
        return t
    end
    
    local function fire(name)
        local re = net:FindFirstChild(name)
        local tg = getTarget()
        if re and tg then
            re:FireServer("bb15e94b-1af0-48fe-be2b-b2f9e007565a", tg)
        end
    end
    
    local function waitMap()
        while LocalPlayer:GetAttribute("Map") == nil do
            LocalPlayer:GetAttributeChangedSignal("Map"):Wait()
        end
    end
    
    local function test(name)
        local tg = getTarget()
        if not tg then
            return false
        end
        local c = tg.Character or tg.CharacterAdded:Wait()
        local h = c:WaitForChild("Humanoid", 5)
        if not h or h.Health <= 0 then
            return false
        end
        local dead = false
        local cn = h.Died:Connect(function()
            dead = true
        end)
        local t = os.clock()
        while os.clock() - t < 3 do
            if dead or h.Health <= 0 then
                dead = true
                break
            end
            fire(name)
            task.wait()
        end
        cn:Disconnect()
        return dead
    end
    
    local function waitTg()
        while killAllOn and not getTarget() do
            task.wait(0.5)
        end
        return getTarget() ~= nil
    end
    
    task.spawn(function()
        waitMap()
        while true do
            task.wait()
            if not killAllOn then
                task.wait(0.1)
            elseif not found then
                if waitTg() then
                    for _, name in ipairs(getList()) do
                        if not killAllOn then
                            break
                        end
                        if test(name) then
                            found = name
                            g.__RE_FINDER[key] = name
                            break
                        else
                            waitTg()
                        end
                    end
                end
            else
                fire(found)
                task.wait()
            end
        end
    end)
    
    local _inGame = false
    
    local function isInGame()
        return LocalPlayer:GetAttribute("MatchId") ~= nil
    end

    local function isPlayerInGame(player)
        if player == LocalPlayer then
            return isInGame()
        end
        local myMatch = LocalPlayer:GetAttribute("MatchId")
        local theirMatch = player:GetAttribute("MatchId")
        return myMatch ~= nil and theirMatch ~= nil and myMatch == theirMatch
    end

    local function isPlayerEnemy(player)
        if player == LocalPlayer then
            return false
        end
        if not isPlayerInGame(player) then
            return false
        end
        local myTeam = LocalPlayer:GetAttribute("Team")
        local theirTeam = player:GetAttribute("Team")
        return myTeam ~= nil and theirTeam ~= nil and myTeam ~= theirTeam
    end
    
    local function applyJumpPower()
        if not Humanoid then return end
        Humanoid.JumpPower  = CustomJumpPower
        Humanoid.JumpHeight = CustomJumpPower * 0.8
    end
    
    local INVIS_CONFIG = { INVISIBILITY_POSITION = Vector3.new(-25.95, 84, 3537.55) }
    local playerState  = { isInvisible = false }
    local characterVisualStates = {}
    
    local function captureCharacterVisualState(character)
        if not character then return end
        characterVisualStates[character] = {}
        for _, d in ipairs(character:GetDescendants()) do
            if d:IsA("BasePart") or d:IsA("Decal") then
                characterVisualStates[character][d] = d.Transparency
            end
        end
    end

    local function restoreCharacterVisualState(character)
        if not character then return end
        local state = characterVisualStates[character]
        if not state then return end
        for part, transparency in pairs(state) do
            if part and part.Parent then
                pcall(function()
                    part.Transparency = transparency
                end)
            end
        end
        characterVisualStates[character] = nil
    end
    
    local function setCharacterTransparency(character, transparency)
        if not character then return end
        if not characterVisualStates[character] then
            captureCharacterVisualState(character)
        end
        for _, d in ipairs(character:GetDescendants()) do
            if d:IsA("BasePart") or d:IsA("Decal") then
                pcall(function()
                    d.Transparency = transparency
                end)
            end
        end
    end
    
    local function toggleInvisibility(btn)
        if not LocalPlayer.Character then return end
        playerState.isInvisible = not playerState.isInvisible
        if playerState.isInvisible then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local savedCF = hrp.CFrame
            LocalPlayer.Character:MoveTo(INVIS_CONFIG.INVISIBILITY_POSITION)
            task.wait(0.15)
            local seat = Instance.new("Seat")
            seat.Name = "invischair"; seat.Anchored = false; seat.CanCollide = false
            seat.Transparency = 1; seat.Position = INVIS_CONFIG.INVISIBILITY_POSITION; seat.Parent = Workspace
            local weld = Instance.new("Weld")
            weld.Part0 = seat
            weld.Part1 = LocalPlayer.Character:FindFirstChild("Torso") or LocalPlayer.Character:FindFirstChild("UpperTorso")
            weld.Parent = seat
            task.wait(); seat.CFrame = savedCF
            setCharacterTransparency(LocalPlayer.Character, 0.5)
            btn.BackgroundColor3 = Color3.fromRGB(46, 204, 113); btn.Text = "VISIBLE"
        else
            local ic = Workspace:FindFirstChild("invischair")
            if ic then ic:Destroy() end
            if LocalPlayer.Character then setCharacterTransparency(LocalPlayer.Character, 0) end
            btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255); btn.Text = "INVISIBLE"
        end
    end
    
    local function createInvisGui()
        local sg = Instance.new("ScreenGui")
        sg.Name = "InvisToolMini"; sg.ResetOnSpawn = false; sg.Enabled = false; sg.Parent = game.CoreGui
        local f = Instance.new("Frame", sg)
        f.Size = UDim2.new(0,160,0,120); f.Position = UDim2.new(0.78,0,0.4,0)
        f.BackgroundColor3 = Color3.fromRGB(20,20,20); f.Active = true; f.Draggable = true
        Instance.new("UICorner", f).CornerRadius = UDim.new(0,8)
        local t = Instance.new("TextLabel", f)
        t.Size = UDim2.new(1,0,0,30); t.BackgroundTransparency = 1
        t.Text = "Invisible Menu"; t.TextColor3 = Color3.new(1,1,1); t.TextSize = 16; t.Font = Enum.Font.SourceSansBold
        local btn = Instance.new("TextButton", f)
        btn.Size = UDim2.new(0.9,0,0,50); btn.Position = UDim2.new(0.05,0,0.35,0)
        btn.BackgroundColor3 = Color3.fromRGB(0,170,255); btn.Text = "INVISIBLE"
        btn.TextColor3 = Color3.new(1,1,1); btn.TextSize = 16
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
        btn.MouseButton1Click:Connect(function() toggleInvisibility(btn) end)
        return sg
    end
    
    local InvisGuiInstance = createInvisGui()
    
    local function createEspHighlight(character)
        if not character then return nil end
        local existing = character:FindFirstChild("Totally NOT Esp")
        if existing and existing:IsA("Highlight") then
            return existing
        end

        local hl = Instance.new("Highlight")
        hl.Name = "Totally NOT Esp"
        hl.Parent = character
        hl.Adornee = character
        hl.Enabled = true
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.FillColor = Color3.fromRGB(65, 165, 255)
        hl.FillTransparency = 0.35
        hl.OutlineColor = Color3.fromRGB(65, 165, 255)
        hl.OutlineTransparency = 0
        return hl
    end

    local function removeEspFromPlayer(player)
        if not player.Character then return end
        local h = player.Character:FindFirstChild("Totally NOT Esp")
        local i = player.Character:FindFirstChild("Icon")
        if h and h:IsA("Highlight") then h:Destroy() end
        if i then i:Destroy() end
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if root and HB_OrigSize[player] then
            root.Size         = HB_OrigSize[player]
            root.Transparency = 1
            root.BrickColor   = BrickColor.new("Medium stone grey")
            root.CanCollide   = true
            HB_OrigSize[player] = nil
        end
    end
    
    local function removeAllEsp()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then removeEspFromPlayer(p) end
        end
    end
    
    local function playerDistance(other)
        local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local theirHRP = other.Character and other.Character:FindFirstChild("HumanoidRootPart")
        if not myHRP or not theirHRP then return 0 end
        return math.floor((myHRP.Position - theirHRP.Position).Magnitude)
    end
    
    local function addEspToPlayer(player)
        if not EspEnabled or player == LocalPlayer or not player.Character then return end
        if not player.Character:FindFirstChild("HumanoidRootPart") then return end
        
        if EspTeamCheck then
            if not isInGame() then
                removeEspFromPlayer(player)
                return
            end
            if not isPlayerEnemy(player) then
                removeEspFromPlayer(player)
                return
            end
        end
        
        local _hum = player.Character:FindFirstChildOfClass("Humanoid")
        if not _hum or _hum.Health <= 0 then
            local _hl = player.Character:FindFirstChild("Totally NOT Esp")
            local _ic = player.Character:FindFirstChild("Icon")
            if _hl then _hl:Destroy() end
            if _ic then _ic:Destroy() end
            local _root = player.Character:FindFirstChild("HumanoidRootPart")
            if _root and HB_OrigSize[player] then
                _root.Size = HB_OrigSize[player]
                _root.Transparency = 1
                _root.BrickColor = BrickColor.new("Medium stone grey")
                _root.CanCollide = true
                HB_OrigSize[player] = nil
            end
            return
        end
        
        local existing = player.Character:FindFirstChild("Totally NOT Esp")
        local icon     = player.Character:FindFirstChild("Icon")
        local pos      = playerDistance(player)
        local txt      = (EspNames and player.Name or "") .. (EspNames and EspDistance and " | " or "") .. (EspDistance and "Dist: "..pos or "")
        
        if icon then
            local lbl = icon:FindFirstChild("ESP Text")
            if lbl then lbl.Text = txt end
        end
        
        if EspHighlightEnabled then
            local hl = createEspHighlight(player.Character)
            if hl then
                hl.Enabled = true
                hl.Adornee = player.Character
                hl.FillColor = Color3.fromRGB(65, 165, 255)
                hl.FillTransparency = 0.35
                hl.OutlineColor = Color3.fromRGB(65, 165, 255)
                hl.OutlineTransparency = 0
            end
        elseif existing and existing:IsA("Highlight") then
            existing:Destroy()
        end
        
        if not icon and (EspNames or EspDistance) then
            local bg = Instance.new("BillboardGui", player.Character)
            bg.Name = "Icon"; bg.AlwaysOnTop = true; bg.ExtentsOffset = Vector3.new(0,1,0)
            bg.Size = UDim2.new(0,800,0,50); bg.LightInfluence = 1
            local lbl = Instance.new("TextLabel", bg)
            lbl.Name = "ESP Text"; lbl.BackgroundTransparency = 1; lbl.Size = UDim2.new(1,0,1,0)
            lbl.Font = Enum.Font.SciFi; lbl.TextSize = 18; lbl.TextWrapped = true
            lbl.TextColor3 = Color3.fromRGB(65, 165, 255); lbl.Text = txt
        end
        end

    local NINJA_IDS = {
        idle1="rbxassetid://656117400", idle2="rbxassetid://656118341",
        walk="rbxassetid://656121766",  run="rbxassetid://656118852",
        jump="rbxassetid://656117878",  fall="rbxassetid://656115606",
        climb="rbxassetid://656114359", swim="rbxassetid://656119721",
        swimidle="rbxassetid://707876443"
    }
    local ZOMBIE_IDS = {
        idle1="rbxassetid://616158929", idle2="rbxassetid://616160636",
        walk="rbxassetid://616168032",  run="rbxassetid://616163682",
        jump="rbxassetid://616161997",  fall="rbxassetid://616157476",
        climb="rbxassetid://616156119", swim="rbxassetid://616165109",
        swimidle="rbxassetid://616166655"
    }
    
    local function saveOriginalAnimations(char)
        local anim = char:FindFirstChild("Animate")
        if not anim then return end
        OriginalAnimations = {}
        pcall(function()
            if anim:FindFirstChild("idle") then
                OriginalAnimations.idle1 = anim.idle.Animation1.AnimationId
                if anim.idle:FindFirstChild("Animation2") then
                    OriginalAnimations.idle2 = anim.idle.Animation2.AnimationId
                end
            end
            for _, pair in ipairs({{"walk","WalkAnim"},{"run","RunAnim"},{"jump","JumpAnim"},
                {"fall","FallAnim"},{"climb","ClimbAnim"},{"swim","SwimAnim"},{"swimidle","SwimIdleAnim"}}) do
                if anim:FindFirstChild(pair[1]) and anim[pair[1]]:FindFirstChild(pair[2]) then
                    OriginalAnimations[pair[1]] = anim[pair[1]][pair[2]].AnimationId
                end
            end
        end)
    end
    
    local function applyAnimPack(char, ids)
        local anim = char and char:FindFirstChild("Animate")
        if not anim then return end
        pcall(function()
            if anim:FindFirstChild("idle") then
                anim.idle.Animation1.AnimationId = ids.idle1
                if anim.idle:FindFirstChild("Animation2") then anim.idle.Animation2.AnimationId = ids.idle2 end
            end
            for _, pair in ipairs({{"walk","WalkAnim"},{"run","RunAnim"},{"jump","JumpAnim"},
                {"fall","FallAnim"},{"climb","ClimbAnim"},{"swim","SwimAnim"},{"swimidle","SwimIdleAnim"}}) do
                if anim:FindFirstChild(pair[1]) and anim[pair[1]]:FindFirstChild(pair[2]) then
                    anim[pair[1]][pair[2]].AnimationId = ids[pair[1]]
                end
            end
        end)
    end
    
    local function resetAnimations(char)
        if not char or not next(OriginalAnimations) then return end
        local anim = char:FindFirstChild("Animate")
        if not anim then return end
        pcall(function()
            if OriginalAnimations.idle1 and anim:FindFirstChild("idle") then
                anim.idle.Animation1.AnimationId = OriginalAnimations.idle1
                if OriginalAnimations.idle2 and anim.idle:FindFirstChild("Animation2") then
                    anim.idle.Animation2.AnimationId = OriginalAnimations.idle2
                end
            end
            for _, pair in ipairs({{"walk","WalkAnim"},{"run","RunAnim"},{"jump","JumpAnim"},
                {"fall","FallAnim"},{"climb","ClimbAnim"},{"swim","SwimAnim"},{"swimidle","SwimIdleAnim"}}) do
                if OriginalAnimations[pair[1]] and anim:FindFirstChild(pair[1]) and anim[pair[1]]:FindFirstChild(pair[2]) then
                    anim[pair[1]][pair[2]].AnimationId = OriginalAnimations[pair[1]]
                end
            end
        end)
    end
    
    local function startNinjaLoop(char)
        if NinjaLoopConnection then NinjaLoopConnection:Disconnect() end
        task.spawn(function()
            while char and char.Parent and NinjaEnabled do
                applyAnimPack(char, NINJA_IDS); task.wait(2)
            end
        end)
        NinjaLoopConnection = char.ChildAdded:Connect(function(child)
            if child.Name == "Animate" and NinjaEnabled then
                task.wait(0.2); applyAnimPack(char, NINJA_IDS)
            end
        end)
    end
    
    local function stopZombie()
        for _, c in ipairs(ZombieConnections) do c:Disconnect() end
        ZombieConnections = {}
    end
    
    local function hookZombie(char)
        stopZombie()
        applyAnimPack(char, ZOMBIE_IDS)
        local anim = char:FindFirstChild("Animate")
        if anim then
            table.insert(ZombieConnections, anim.AncestryChanged:Connect(function()
                task.defer(applyAnimPack, char, ZOMBIE_IDS)
            end))
        end
        table.insert(ZombieConnections, char.ChildAdded:Connect(function(x)
            if x.Name == "Animate" then task.defer(applyAnimPack, char, ZOMBIE_IDS) end
        end))
    end
    
    LocalPlayer.CharacterAdded:Connect(function(char)
        Character = char
        Humanoid  = char:WaitForChild("Humanoid")
        task.wait(0.3)
        if JumpPowerEnabled then applyJumpPower() end
        if NinjaEnabled then
            saveOriginalAnimations(char); task.wait(0.3)
            applyAnimPack(char, NINJA_IDS); startNinjaLoop(char)
        elseif ZombieEnabled then
            saveOriginalAnimations(char); hookZombie(char)
        end
        HB_OrigSize = {}
    end)
    
    UIS.JumpRequest:Connect(function()
        if InfiniteJump then
            local c = LocalPlayer.Character
            if c and c:FindFirstChild("Humanoid") then
                c.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
    
    local SilentAimEnabled   = false
    local FovCircleEnabled   = false
    local FovRadiusValue     = 100
    local MAX_DISTANCIA      = 500

    local fovCircle = Drawing and Drawing.new("Circle") or nil
    if fovCircle then
        fovCircle.Thickness = 2
        fovCircle.Color = Color3.fromRGB(65, 165, 255)
        fovCircle.Filled = false
        fovCircle.Transparency = 0.5
        fovCircle.Radius = FovRadiusValue
        fovCircle.Visible = false
    end

    local function updateFovCircle()
        if fovCircle then
            fovCircle.Radius = FovRadiusValue
            fovCircle.Visible = FovCircleEnabled
        end
    end

    RunService.RenderStepped:Connect(function()
        if fovCircle then
            local mousePos = UIS:GetMouseLocation()
            fovCircle.Position = Vector2.new(mousePos.X, mousePos.Y)
        end
    end)

    local function isEnemyVisible(targetPart)
        if not targetPart then return false end
        local origin = Camera.CFrame.Position
        local destination = targetPart.Position
        local direction = destination - origin
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        local raycastResult = workspace:Raycast(origin, direction, raycastParams)
        if raycastResult then
            if raycastResult.Instance:IsDescendantOf(targetPart.Parent) then
                return true
            end
        end
        return false
    end

    local function getBestTarget()
        local target = nil
        local shortestDistance = FovCircle and FovRadiusValue or 100
        local mousePos = UIS:GetMouseLocation()
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                local isEnemy = (v.Team ~= LocalPlayer.Team or v.Team == nil)
                if isEnemy then
                    local pos, onScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
                    if onScreen and isEnemyVisible(v.Character.Head) then
                        local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
                        if distance < shortestDistance then
                            target = v.Character.Head
                            shortestDistance = distance
                        end
                    end
                end
            end
        end
        return target
    end

    local Mouse = LocalPlayer:GetMouse()
    local _silentAimHooked = false
    local function hookSilentAim()
        if _silentAimHooked then return end
        if not getrawmetatable or not setreadonly or not newcclosure then return end
        _silentAimHooked = true
        local mt = nil
        local success, result = pcall(getrawmetatable, Mouse)
        if success and result then
            mt = result
        else
            mt = getrawmetatable(game)
        end
        if not mt then return end
        local oldIndex = mt.__index
        setreadonly(mt, false)
        mt.__index = newcclosure(function(self, index)
            local isMouseObject = self == Mouse
            if not isMouseObject then
                pcall(function()
                    if self and self.ClassName == "Mouse" then
                        isMouseObject = true
                    end
                end)
            end
            if SilentAimEnabled and isMouseObject and (index == "Hit" or index == "Target") then
                local target = getBestTarget()
                if target then
                    return (index == "Hit" and target.CFrame or target)
                end
            end
            return oldIndex(self, index)
        end)
        setreadonly(mt, true)
    end

    task.defer(hookSilentAim)
    local function hookRemoteFire()
        if not getrawmetatable or not setreadonly or not newcclosure or not getnamecallmethod then return end
        local success, mt = pcall(getrawmetatable, game)
        if not success or not mt then return end
        local oldNamecall = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if (method == "FireServer" or method == "InvokeServer") and SilentAimEnabled then
                local nm = tostring(self.Name or "")
                local lname = nm:lower()
                if lname:find("gun") or lname:find("shoot") or lname:find("fire") or lname:find("debris") then
                    local target = getBestTarget()
                    if target then
                        local args = {...}
                        for i = 1, #args do
                            local a = args[i]
                            local ok, isInst = pcall(function() return a and a.IsA and a:IsA("Instance") end)
                            if ok and isInst then
                                args[i] = target
                                return oldNamecall(self, table.unpack(args))
                            end
                            if typeof and (typeof(a) == "Vector3" or typeof(a) == "CFrame") then
                                args[i] = (typeof(a) == "Vector3" and target.Position) or target.CFrame
                                return oldNamecall(self, table.unpack(args))
                            end
                        end
                        return oldNamecall(self, target)
                    end
                end
            end
            return oldNamecall(self, ...)
        end)
        setreadonly(mt, true)
    end

    task.defer(hookRemoteFire)

    local function updateSilentAimState()
        if not SilentAimEnabled then return end
        hookSilentAim()
        hookRemoteFire()
    end
    
    local Window      = Library:Window({Name = "IIIIIIIIII-HUB", SubName = "PC Edition"})
    local MainPage    = Window:Page({Name = "Main",       Icon = "101636617799068"})
    local EspPage     = Window:Page({Name = "ESP",        Icon = "100050851789190"})
    local GunPage     = Window:Page({Name = "Gun",        Icon = "130510492706892"})
    local FarmPage    = Window:Page({Name = "Farm",       Icon = "101636617799068"})
    local AnimPage    = Window:Page({Name = "Animations", Icon = "92464809279921"})
    local SettingsPage= Window:Page({Name = "Settings",   Icon = "122669828593160"})

    task.spawn(function()
        task.wait(0.2)
        local farmIcon = FarmPage and FarmPage.Items and FarmPage.Items.Icon and FarmPage.Items.Icon.Instance
        if farmIcon and farmIcon:IsA("ImageLabel") then
            farmIcon.Image = "rbxassetid://101636617799068"
            farmIcon.ScaleType = Enum.ScaleType.Fit
        end
    end)
    
    local MainLeft   = MainPage:Section({Name = "Player",     Side = 1})
    local MainRight  = MainPage:Section({Name = "Movement",   Side = 2})
    local EspLeft    = EspPage:Section({Name = "ESP Settings",Side = 1})
    local EspRight   = EspPage:Section({Name = "Visuals",     Side = 2})
    local GunLeft    = GunPage:Section({Name = "Gun Features",Side = 1})
    local GunRight   = GunPage:Section({Name = "Silent Aim",Side = 2})
    local AimSection = GunPage:Section({Name = "Aim Features", Side = 1})
    local FarmLeft   = FarmPage:Section({Name = "Farm Tools", Side = 1})
    local FarmRight  = FarmPage:Section({Name = "Automation", Side = 2})

    -- Aimbot settings (exposed in the main menu as simple controls)
    local AimEnabled = false
    local AimWallCheck = true
    local AimTargetPart = "Head"
    local AimFOV = 180
    local AimSmoothness = 0.15
    local AimPrediction = 0.08
    local AimCurrentTool = nil
    local AimRenderConn = nil

    AimSection:Toggle({Name = "Aimbot", Flag = "AimbotTogglePC", Default = false, Callback = function(v)
        AimEnabled = v
    end})

    AimSection:Toggle({Name = "Wall Check", Flag = "AimbotWallCheckPC", Default = true, Callback = function(v)
        AimWallCheck = v
    end})

    AimSection:Dropdown({
        Name = "Target Body Part",
        Flag = "AimbotTargetPartPC",
        Items = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"},
        Default = AimTargetPart,
        Callback = function(v)
            AimTargetPart = v
        end
    })

    AimSection:Slider({Name = "FOV", Flag = "AimbotFOVPC", Default = AimFOV, Min = 30, Max = 1000, Rounding = 0, Callback = function(v) AimFOV = v end})
    AimSection:Slider({Name = "Smoothness", Flag = "AimbotSmoothnessPC", Default = AimSmoothness, Min = 0.01, Max = 1, Rounding = 2, Callback = function(v) AimSmoothness = v end})

    -- Tool tracking and aimbot core
    local function IsAllowedWeapon(tool)
        if not tool or not tool.IsA then return false end
        if not tool:IsA("Tool") then return false end
        local name = (tool.Name or ""):lower()
        return name:find("revolver") or name:find("gun") or name:find("pistol") or name:find("knife")
    end

    local function IsTargetAlive(part)
        if not part or not part.Parent then return false end
        local hum = part.Parent:FindFirstChildOfClass("Humanoid")
        return hum and hum.Health > 0
    end

    local function HasWallBetween(from, to)
        if not AimWallCheck then return false end
        local dir = to - from
        local dist = dir.Magnitude
        if dist == 0 then return false end
        local rp = RaycastParams.new()
        rp.FilterType = Enum.RaycastFilterType.Exclude
        rp.FilterDescendantsInstances = {LocalPlayer.Character}
        local res = workspace:Raycast(from, dir.Unit * dist, rp)
        if res and res.Instance then
            local hit = res.Instance
            if hit and hit.CanCollide then return true end
        end
        return false
    end

    local function GetClosestEnemy()
        local Players = game:GetService("Players")
        local closest = nil
        local shortest = AimFOV
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not myRoot then return nil end
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and isPlayerEnemy(plr) and plr.Character then
                local part = plr.Character:FindFirstChild(AimTargetPart)
                local root = plr.Character:FindFirstChild("HumanoidRootPart")
                if part and root then
                    local dist = (myRoot.Position - root.Position).Magnitude
                    local _, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        if not HasWallBetween(Camera.CFrame.Position, part.Position) and dist < shortest then
                            shortest = dist
                            closest = part
                        end
                    end
                end
            end

        end
        return closest
    end

    local function UpdateAimbot()
        if not AimEnabled then return end
        if not AimCurrentTool or not IsAllowedWeapon(AimCurrentTool) then return end
        local targetPart = GetClosestEnemy()
        if targetPart and IsTargetAlive(targetPart) then
            if AimWallCheck and HasWallBetween(Camera.CFrame.Position, targetPart.Position) then return end
            local targetPos = targetPart.Position
            local root = targetPart.Parent and targetPart.Parent:FindFirstChild("HumanoidRootPart")
            if root then targetPos = targetPos + (root.Velocity * AimPrediction) end
            local dir = (targetPos - Camera.CFrame.Position).Unit
            local targetCFrame = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + dir)
            Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, AimSmoothness)
        end
    end

    -- track equipped tool
    local function SetupCharTools(char)
        char.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then AimCurrentTool = child end
        end)
        char.ChildRemoved:Connect(function(child)
            if child == AimCurrentTool then AimCurrentTool = nil end
        end)
        for _, c in ipairs(char:GetChildren()) do if c:IsA("Tool") then AimCurrentTool = c end end
    end

    if LocalPlayer.Character then SetupCharTools(LocalPlayer.Character) end
    LocalPlayer.CharacterAdded:Connect(function(c) task.wait(0.6); SetupCharTools(c) end)

    if AimRenderConn then AimRenderConn:Disconnect() end
    AimRenderConn = RunService.RenderStepped:Connect(UpdateAimbot)
    local AnimLeft   = AnimPage:Section({Name = "Animation Packs", Side = 1})
    local SettLeft   = SettingsPage:Section({Name = "Menu",   Side = 1})
    local SettRight  = SettingsPage:Section({Name = "Anti Lag", Side = 2})
    
    MainLeft:Label("Movement and utility system")
    MainLeft:Toggle({Name="Enable WalkSpeed",Flag="SpeedToggle",Default=false,Callback=function(v)SpeedEnabled=v if not v then local c=LocalPlayer.Character if c and c:FindFirstChild("Humanoid")then c.Humanoid.WalkSpeed=DefaultSpeed end end end})
    MainLeft:Slider({Name="WalkSpeed",Flag="WalkSpeed",Default=16,Min=16,Max=500,Rounding=0,Callback=function(v)local clamped=math.clamp(v,16,500) WalkSpeedValue=clamped if SpeedEnabled then local c=LocalPlayer.Character if c and c:FindFirstChild("Humanoid")then c.Humanoid.WalkSpeed=clamped end end end})
    MainLeft:Toggle({Name="Infinite Jump",Flag="InfiniteJump",Default=false,Callback=function(v)InfiniteJump=v end})
    MainLeft:Toggle({Name="Low Gravity",Flag="LowGravity",Default=false,Callback=function(v)GravityEnabled=v Workspace.Gravity=v and GravityValue or DefaultGravity end})
    MainLeft:Slider({Name="Gravity Power",Flag="GravityAmount",Default=50,Min=0,Max=196,Rounding=0,Callback=function(v)local clamped=math.clamp(v,0,196) GravityValue=clamped if GravityEnabled then Workspace.Gravity=clamped end end})
    MainLeft:Button({Name="Invisible Menu",Callback=function()InvisGuiInstance.Enabled=not InvisGuiInstance.Enabled end})
    
    MainRight:Label("Advanced settings")
    MainRight:Toggle({Name="Enable JumpPower",Flag="JumpPowerToggle",Default=false,Callback=function(v)JumpPowerEnabled=v if v then applyJumpPower()else if Humanoid then Humanoid.JumpPower=DefaultJumpPower;Humanoid.JumpHeight=7.2 end end end})
    MainRight:Slider({Name="JumpPower",Flag="JumpPower",Default=50,Min=50,Max=500,Rounding=0,Callback=function(v)local clamped=math.clamp(v,50,500) CustomJumpPower=clamped if JumpPowerEnabled then applyJumpPower()end end})
    MainRight:Toggle({Name="Fly",Flag="FlyToggle",Default=false,Callback=function(v)FlyEnabled=v if not v then local c=LocalPlayer.Character if c then local hrp=c:FindFirstChild("HumanoidRootPart")if hrp then if hrp:FindFirstChild("IIIIFly")then hrp.IIIIFly:Destroy()end if hrp:FindFirstChild("IIIIFlyGyro")then hrp.IIIIFlyGyro:Destroy()end end if c:FindFirstChild("Humanoid")then c.Humanoid.PlatformStand=false end end end end})
    MainRight:Slider({Name="Fly Speed",Flag="FlySpeed",Default=50,Min=10,Max=300,Rounding=0,Callback=function(v)FlySpeed=math.clamp(v,10,300) end})
    MainRight:Toggle({Name="Noclip",Flag="Noclip",Default=false,Callback=function(v)NoclipEnabled=v end})
    
    EspLeft:Toggle({Name="Enable ESP",Flag="EspEnabled",Default=false,Callback=function(v)EspEnabled=v if not v then removeAllEsp()end end})
    EspLeft:Toggle({Name="ESP Highlight",Flag="EspHighlightEnabled",Default=false,Callback=function(v)EspHighlightEnabled=v if not v then for _,p in ipairs(Players:GetPlayers())do if p~=LocalPlayer and p.Character then local hl=p.Character:FindFirstChild("Totally NOT Esp")if hl then hl:Destroy()end end end end end})
    EspLeft:Toggle({Name="ESP Names",Flag="EspNames",Default=false,Callback=function(v)EspNames=v end})
    EspLeft:Toggle({Name="ESP Distance",Flag="EspDistance",Default=false,Callback=function(v)EspDistance=v end})
    EspRight:Toggle({Name="Team Check",Flag="EspTeamCheck",Default=false,Callback=function(v)EspTeamCheck=v if not v then for _,p in ipairs(Players:GetPlayers())do if p~=LocalPlayer and p.Character then local hl=p.Character:FindFirstChild("Totally NOT Esp")if hl then hl:Destroy()end end end end end})
    
    GunLeft:Toggle({Name="Hit Box Expander",Flag="HitBoxExpander",Default=false,Callback=function(v)HitboxExpanderEnabled=v if not v then restoreAllHitboxes()end end})
    GunLeft:Slider({Name="Hitbox Size",Flag="HitBoxSize",Default=10,Min=1,Max=200,Rounding=0,Callback=function(v)HitboxSize=v end})
    GunLeft:Toggle({Name="Invisible Hitbox",Flag="InvisibleHitbox",Default=false,Callback=function(v)InvisibleHitboxEnabled=v if not v then restoreAllHitboxes()end end})
    GunLeft:Slider({Name="Invisible Hitbox Size",Flag="InvisibleHitboxSize",Default=10,Min=1,Max=200,Rounding=0,Callback=function(v)InvisibleHitboxSize=v end})
    GunLeft:Toggle({Name="Kill All",Flag="KillAllToggle",Default=false,Callback=function(v)killAllOn=v end})
    
    GunRight:Toggle({Name="Silent Aim",Flag="SilentAimToggle",Default=false,Callback=function(v)SilentAimEnabled=v if v then updateSilentAimState() end end})
    GunRight:Toggle({Name="Show FOV",Flag="ShowFOVToggle",Default=false,Callback=function(v)FovCircleEnabled=v updateFovCircle()end})
    GunRight:Slider({Name="FOV Radius",Flag="FOVRadius",Default=100,Min=1,Max=500,Rounding=0,Callback=function(v)FovRadiusValue=math.clamp(v,1,500) updateFovCircle()end})
    GunRight:Label("Note: Silent Aim may not work on all executors")

    FarmLeft:Toggle({Name="Auto Farm",Flag="AutoFarmToggle",Default=false,Callback=function(v)FarmEnabled=v end})
    FarmLeft:Slider({Name="Farm Speed",Flag="FarmSpeed",Default=16,Min=8,Max=100,Rounding=0,Callback=function(v)FarmSpeed=math.clamp(v,8,100) end})
    FarmRight:Button({Name="Refresh Farm Targets",Callback=function()if FarmEnabled then print("Farm targets refreshed") end end})
    FarmRight:Label("Farm helpers stay lightweight and can be toggled on or off")
    
    AnimLeft:Toggle({Name="Ninja Animation Pack",Flag="NinjaToggle",Default=false,Callback=function(v)
        NinjaEnabled = v
        if v then
            ZombieEnabled = false
            stopZombie()
            local c = LocalPlayer.Character
            if c then
                saveOriginalAnimations(c)
                task.wait(0.3)
                applyAnimPack(c, NINJA_IDS)
                startNinjaLoop(c)
            end
        else
            if NinjaLoopConnection then
                NinjaLoopConnection:Disconnect()
                NinjaLoopConnection = nil
            end
            resetAnimations(LocalPlayer.Character)
        end
    end})
    AnimLeft:Toggle({Name="Zombie Animation Pack",Flag="ZombieToggle",Default=false,Callback=function(v)ZombieEnabled=v if v then NinjaEnabled=false if NinjaLoopConnection then NinjaLoopConnection:Disconnect();NinjaLoopConnection=nil end local c=LocalPlayer.Character if c then saveOriginalAnimations(c);hookZombie(c)end else stopZombie()resetAnimations(LocalPlayer.Character)end end})
    AnimLeft:Button({Name="Reset Animations Pack",Callback=function()NinjaEnabled=false;ZombieEnabled=false if NinjaLoopConnection then NinjaLoopConnection:Disconnect();NinjaLoopConnection=nil end stopZombie()resetAnimations(LocalPlayer.Character)end})
    
    local _antiLagApplied=false local function runAntiLag()if _antiLagApplied then return end _antiLagApplied=true pcall(function()local Lighting=game:GetService("Lighting")Lighting.GlobalShadows=false Lighting.FogEnd=9e9 Lighting.Brightness=0 Lighting.EnvironmentDiffuseScale=0 Lighting.EnvironmentSpecularScale=0 for _,v in ipairs(Lighting:GetChildren())do pcall(function()if v:IsA("BloomEffect")or v:IsA("BlurEffect")or v:IsA("SunRaysEffect")or v:IsA("ColorCorrectionEffect")or v:IsA("DepthOfFieldEffect")or v:IsA("Atmosphere")then v:Destroy()end end)end local function optimizeObj(obj)pcall(function()if obj:IsA("BasePart")then obj.Material=Enum.Material.Plastic obj.Reflectance=0 obj.CastShadow=false elseif obj:IsA("Decal")or obj:IsA("Texture")then obj:Destroy()elseif obj:IsA("ParticleEmitter")or obj:IsA("Trail")or obj:IsA("Beam")or obj:IsA("Fire")or obj:IsA("Smoke")or obj:IsA("Sparkles")then obj:Destroy()elseif obj:IsA("PointLight")or obj:IsA("SpotLight")or obj:IsA("SurfaceLight")then obj:Destroy()end end)end for _,v in ipairs(game:GetDescendants())do optimizeObj(v)end game.DescendantAdded:Connect(optimizeObj)end)end
    
    SettRight:Button({Name="Anti Lag",Callback=function()runAntiLag()end})
    SettLeft:Button({Name="Unload",Callback=function()killAllOn=false Workspace.Gravity=DefaultGravity local c=LocalPlayer.Character if c and c:FindFirstChild("Humanoid")then c.Humanoid.WalkSpeed=DefaultSpeed c.Humanoid.JumpPower=DefaultJumpPower end local ic=Workspace:FindFirstChild("invischair")if ic then ic:Destroy()end removeAllEsp()if fovCircle then fovCircle.Visible=false end Library:Unload()end})
    SettLeft:Label("Press M to hide/show UI")

    if isMobile then
        SpeedEnabled = false
        JumpPowerEnabled = false
        FlyEnabled = false
        NoclipEnabled = false
        EspEnabled = false
        HitboxExpanderEnabled = false
        InvisibleHitboxEnabled = false
        SilentAimEnabled = false
        FovCircleEnabled = false
        FarmEnabled = false
    end
    
    UIS.InputBegan:Connect(function(input,gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.M then
            Window:SetOpen(not Window.IsOpen)
        end
    end)

    task.spawn(function()
        local interval = isMobile and 0.2 or 0.05
        while true do
            local ok, err = pcall(function()
                _inGame = isInGame()
                local c = LocalPlayer.Character
                local hum = c and c:FindFirstChild("Humanoid")
                if hum then
                    if SpeedEnabled then
                        hum.WalkSpeed = WalkSpeedValue
                    end
                    if JumpPowerEnabled and hum.JumpPower ~= CustomJumpPower then
                        applyJumpPower()
                    end
                end

                if FlyEnabled then
                    local hrp = c and c:FindFirstChild("HumanoidRootPart")
                    local flyHum = c and c:FindFirstChild("Humanoid")
                    if hrp and flyHum then
                        if not hrp:FindFirstChild("IIIIFly") then
                            local BV = Instance.new("BodyVelocity")
                            BV.Name = "IIIIFly"
                            BV.MaxForce = Vector3.new(9e5, 9e5, 9e5)
                            BV.Velocity = Vector3.zero
                            BV.Parent = hrp
                            local BG = Instance.new("BodyGyro")
                            BG.Name = "IIIIFlyGyro"
                            BG.MaxTorque = Vector3.new(9e5, 9e5, 9e5)
                            BG.P = 1000
                            BG.CFrame = Camera.CFrame
                            BG.Parent = hrp
                            flyHum.PlatformStand = true
                        end

                        local BV = hrp:FindFirstChild("IIIIFly")
                        local BG = hrp:FindFirstChild("IIIIFlyGyro")
                        if BV and BG then
                            local dir = Vector3.zero
                            if UIS:IsKeyDown(Enum.KeyCode.W) then dir += Camera.CFrame.LookVector end
                            if UIS:IsKeyDown(Enum.KeyCode.S) then dir -= Camera.CFrame.LookVector end
                            if UIS:IsKeyDown(Enum.KeyCode.A) then dir -= Camera.CFrame.RightVector end
                            if UIS:IsKeyDown(Enum.KeyCode.D) then dir += Camera.CFrame.RightVector end
                            if UIS:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0, 1, 0) end
                            if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0, 1, 0) end
                            BV.Velocity = dir * FlySpeed
                            BG.CFrame = Camera.CFrame
                        end
                    end
                end

                if NoclipEnabled then
                    if c then
                        for _, v in ipairs(c:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                end

                if HitboxExpanderEnabled or InvisibleHitboxEnabled then
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character then
                            local root = p.Character:FindFirstChild("HumanoidRootPart")
                            local hum2 = p.Character:FindFirstChildOfClass("Humanoid")
                            local isDead = not hum2 or hum2.Health <= 0
                            if root then
                                local shouldApplyHitbox = true
                                if EspTeamCheck and not isPlayerEnemy(p) then
                                    shouldApplyHitbox = false
                                end
                                if not isDead and shouldApplyHitbox and HitboxExpanderEnabled then
                                    if not HB_OrigSize[p] then
                                        HB_OrigSize[p] = root.Size
                                    end
                                    root.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                                    root.Transparency = 0.5
                                    root.BrickColor = BrickColor.new("Cyan")
                                    root.CanCollide = false
                                elseif not isDead and shouldApplyHitbox and InvisibleHitboxEnabled then
                                    if not HB_OrigSize[p] then
                                        HB_OrigSize[p] = root.Size
                                    end
                                    root.Size = Vector3.new(InvisibleHitboxSize, InvisibleHitboxSize, InvisibleHitboxSize)
                                    root.Transparency = 1
                                    root.CanCollide = false
                                elseif HB_OrigSize[p] then
                                    root.Size = HB_OrigSize[p]
                                    root.Transparency = 1
                                    root.BrickColor = BrickColor.new("Medium stone grey")
                                    root.CanCollide = true
                                    HB_OrigSize[p] = nil
                                end
                            end
                        end
                    end
                end

                if EspTeamCheck then
                    if not isInGame() then
                        removeAllEsp()
                        return
                    end
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character and not isPlayerEnemy(p) then
                            removeEspFromPlayer(p)
                        end
                    end
                end

                if EspEnabled then
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer then
                            if not EspTeamCheck or isPlayerEnemy(p) then
                                pcall(addEspToPlayer, p)
                            else
                                pcall(removeEspFromPlayer, p)
                            end
                            if EspTeamCheck then
                                pcall(applyTeamCheck, p)
                            end
                        end
                    end
                elseif not EspTeamCheck then
                    removeAllEsp()
                end
            end)

            if not ok and err then
                warn("[MobileHub] lightweight loop error: " .. tostring(err))
            end
            task.wait(interval)
        end
    end)
    
    local function applyTeamCheck(player)
        if not EspEnabled or not EspTeamCheck then return end
        if not player.Character then return end

        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then
            removeEspFromPlayer(player)
            return
        end

        if not isPlayerEnemy(player) then
            removeEspFromPlayer(player)
            return
        end

        if not EspHighlightEnabled then
            removeEspFromPlayer(player)
            return
        end

        local hl = createEspHighlight(player.Character)
        if hl then
            hl.Enabled = true
            hl.Adornee = player.Character
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            hl.FillColor = Color3.fromRGB(65, 165, 255)
            hl.FillTransparency = 0.35
            hl.OutlineColor = Color3.fromRGB(65, 165, 255)
            hl.OutlineTransparency = 0
        end
    end

    local function hookPlayerDeath(player)if player==LocalPlayer then return end player.CharacterAdded:Connect(function(char)local hum=char:WaitForChild("Humanoid",5)if hum then hum.Died:Connect(function()if player.Character then local hl=player.Character:FindFirstChild("Totally NOT Esp")local ic=player.Character:FindFirstChild("Icon")if hl then hl:Destroy()end if ic then ic:Destroy()end local root=player.Character:FindFirstChild("HumanoidRootPart")if root and HB_OrigSize[player]then root.Size=HB_OrigSize[player]root.Transparency=1 root.BrickColor=BrickColor.new("Medium stone grey")root.CanCollide=true end end HB_OrigSize[player]=nil end)end task.wait(0.5)if EspEnabled then pcall(addEspToPlayer,player)end end)player.CharacterRemoving:Connect(function()if player.Character then local hl=player.Character:FindFirstChild("Totally NOT Esp")local ic=player.Character:FindFirstChild("Icon")if hl then hl:Destroy()end if ic then ic:Destroy()end local root=player.Character:FindFirstChild("HumanoidRootPart")if root and HB_OrigSize[player]then root.Size=HB_OrigSize[player]root.Transparency=1 root.BrickColor=BrickColor.new("Medium stone grey")root.CanCollide=true end end HB_OrigSize[player]=nil end)end

    Players.PlayerAdded:Connect(hookPlayerDeath)

    for _,player in ipairs(Players:GetPlayers())do hookPlayerDeath(player)if player.Character then local hum=player.Character:FindFirstChildOfClass("Humanoid")if hum then hum.Died:Connect(function()if player.Character then local hl=player.Character:FindFirstChild("Totally NOT Esp")local ic=player.Character:FindFirstChild("Icon")if hl then hl:Destroy()end if ic then ic:Destroy()end local root=player.Character:FindFirstChild("HumanoidRootPart")if root and HB_OrigSize[player]then root.Size=HB_OrigSize[player]root.Transparency=1 root.BrickColor=BrickColor.new("Medium stone grey")root.CanCollide=true end end HB_OrigSize[player]=nil end)end end end

    Players.PlayerRemoving:Connect(function(player)HB_OrigSize[player]=nil end)
    
    print([[
/**
* ············································································
* :      :::        :::        :::            :::    ::: :::    ::: ::::::::::
* :     :+:        :+:        :+:            :+:    :+: :+:    :+: :+:    :+::
* :    +:+        +:+        +:+            +:+    +:+ +:+    +:+ +:+    +:+ :
* :   +#+        +#+        +#+            +#++:++#++ +#+    +:+ +#++:++#+   :
* :  +#+        +#+        +#+            +#+    +#+ +#+    +#+ +#+    +#+   :
* : #+#        #+#        #+#        #+# #+#    #+# #+#    #+# #+#    #+#    :
* :########## ########## ########## ### ###    ###  ########  #########      :
* ············································································
*/
]])
    
end 
