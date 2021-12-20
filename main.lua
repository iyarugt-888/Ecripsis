local Client = game:GetService("Players").LocalPlayer
local Library = loadstring(game.HttpGet(game, "https://pastebin.com/raw/rBRdpBDh"))()
local Remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
local EffectRequested = Remotes:WaitForChild("EffectRequested")
local ScreenGui, TextBox = Instance.new("ScreenGui"), Instance.new("TextBox")
local Loops = {}
local function Create(Properties, Speed, Attachment, Size)
    EffectRequested:FireServer(
        {
            ["PartArgs"] = Properties,
            ["Direction"] = Vector3.new(0, 0, 0),
            ["Name"] = "HitscanBeam",
            ["Here"] = Vector3.new(0, 0, 0),
            ["Speed"] = Speed,
            ["Attachment"] = Attachment,
            ["Size"] = Size,
            ["There"] = Vector3.new(0, 0, 0)
        }
    )
end
local function GetPlayers(Input)
    if game:GetService("Teams"):FindFirstChild(Input) and not game:GetService("Players"):FindFirstChild(Input) then
        local Players = {}
        local Team = game:GetService("Teams"):FindFirstChild(Input)
        for i, v in next, game:GetService("Players"):GetPlayers() do
            if v.Team == Team then
                Players[#Players + 1] = v
            end
        end
        return Players
    end
    if Input == "others" and not game:GetService("Players"):FindFirstChild("others") then
        local Players = {}
        for i, v in next, game:GetService("Players"):GetPlayers() do
            if v ~= Client then
                Players[#Players + 1] = v
            end
        end
        return Players
    end
    for i, v in next, game:GetService("Players"):GetPlayers() do
        if string.sub(string.lower(v.Name), 1, string.len(Input)) == string.lower(Input) then
            return {v}
        end
    end
    return {}
end
local function GetCharacters(Input)
    local Players = GetPlayers(Input)
    local Characters = {}
    for i, v in next, Players do
        local Character = v.Character
        if Character then
            if Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Head") then
                Characters[v] = Character
            end
        end
    end
    return Characters
end
local getsenv = function(s)
    for i, v in next, getgc() do
        if type(v) == "function" then
            local env = getfenv(v)
            if env.script == s then
                return env
            end
        end
    end
end
local Commands = {
    ["kill"] = function(Players)
        local Characters = GetCharacters(Players)
        for c = 1, 15 do
            for i, v in next, Characters do
                local Head, Attachment = v:FindFirstChild("Head"), v:FindFirstChild("HumanoidRootPart")
                if Head and Attachment then
                    Create(
                        {
                            ["CanCollide"] = true,
                            ["Anchored"] = true,
                            ["Transparency"] = 1,
                            ["Position"] = Vector3.new(Head.Position),
                            ["CFrame"] = CFrame.new(Head.Position),
                            ["Size"] = Vector3.new(20, 20, 20),
                            ["Color"] = Color3.fromRGB(255, 0, 0),
                            ["Material"] = "Glass",
                            ["Name"] = string.rep("_", math.random(1, 1500)),
                            ["Velocity"] = Vector3.new(9e9, 9e9, 9e9)
                        },
                        0,
                        Attachment,
                        1
                    )
                end
            end
        end
    end,
    ["loopkill"] = function(Players)
        for a, b in next, Players do
            Loops[b.Name] = true
            while wait(0.25) and Loops[b.Name] == true do
                local Characters = GetCharacters(Players)
                for i, v in next, Characters do
                    local Head, Attachment = v:FindFirstChild("Head"), v:FindFirstChild("HumanoidRootPart")
                    if Head and Attachment then
                        for i = 1, 15 do
                            Create(
                                {
                                    ["CanCollide"] = true,
                                    ["Anchored"] = true,
                                    ["Transparency"] = 1,
                                    ["Position"] = Vector3.new(Head.Position),
                                    ["CFrame"] = CFrame.new(Head.Position),
                                    ["Size"] = Vector3.new(20, 20, 20),
                                    ["Color"] = Color3.fromRGB(255, 0, 0),
                                    ["Material"] = "Glass",
                                    ["Name"] = string.rep("_", math.random(1, 1500)),
                                    ["Velocity"] = Vector3.new(9e9, 9e9, 9e9)
                                },
                                0,
                                Attachment,
                                1
                            )
                        end
                    end
                end
            end
        end
    end,
    ["unloopkill"] = function(Players)
        local Players = GetPlayers(Players)
        for i, v in next, Players do
            if Loops[v.Name] then
                Loops[v.Name] = false
            end
        end
    end,
    ["jail"] = function(Players)
        local Characters = GetCharacters(Players)
        for i, v in next, Characters do
            local Head, Attachment = v:FindFirstChild("Head"), v:FindFirstChild("HumanoidRootPart")
            if Head and Attachment then
                Create(
                    {
                        ["CanCollide"] = true,
                        ["Anchored"] = true,
                        ["Position"] = Vector3.new(Head.Position.X, Head.Position.Y + 1.5, Head.Position.Z),
                        ["CFrame"] = CFrame.new(Head.Position.X, Head.Position.Y + 1.5, Head.Position.Z),
                        ["Size"] = Vector3.new(6, .2, 6),
                        ["Color"] = Color3.fromRGB(255, 0, 0),
                        ["Material"] = "Glass",
                        ["Transparency"] = 1,
                        ["Name"] = string.rep("_", math.random(1, 1500))
                    },
                    20,
                    Attachment,
                    1
                )
                Create(
                    {
                        ["CanCollide"] = true,
                        ["Anchored"] = true,
                        ["Position"] = Vector3.new(Head.Position.X, Head.Position.Y - 5, Head.Position.Z),
                        ["CFrame"] = CFrame.new(Head.Position.X, Head.Position.Y - 5, Head.Position.Z),
                        ["Size"] = Vector3.new(6, .2, 6),
                        ["Color"] = Color3.fromRGB(255, 0, 0),
                        ["Material"] = "Glass",
                        ["Transparency"] = 1,
                        ["Name"] = string.rep("_", math.random(1, 1500))
                    },
                    20,
                    Attachment,
                    1
                )
                Create(
                    {
                        ["CanCollide"] = true,
                        ["Anchored"] = true,
                        ["Position"] = Vector3.new(Head.Position.X - 2, Head.Position.Y - 2, Head.Position.Z),
                        ["CFrame"] = CFrame.new(Head.Position.X - 2, Head.Position.Y - 2, Head.Position.Z),
                        ["Size"] = Vector3.new(.2, 7, 6),
                        ["Color"] = Color3.fromRGB(255, 0, 0),
                        ["Material"] = "Glass",
                        ["Transparency"] = 1,
                        ["Name"] = string.rep("_", math.random(1, 1500))
                    },
                    20,
                    Attachment,
                    1
                )
                Create(
                    {
                        ["CanCollide"] = true,
                        ["Anchored"] = true,
                        ["Position"] = Vector3.new(Head.Position.X + 2, Head.Position.Y - 2, Head.Position.Z),
                        ["CFrame"] = CFrame.new(Head.Position.X + 2, Head.Position.Y - 2, Head.Position.Z),
                        ["Size"] = Vector3.new(.2, 7, 6),
                        ["Color"] = Color3.fromRGB(255, 0, 0),
                        ["Material"] = "Glass",
                        ["Transparency"] = 1,
                        ["Name"] = string.rep("_", math.random(1, 1500))
                    },
                    20,
                    Attachment,
                    1
                )
                Create(
                    {
                        ["CanCollide"] = true,
                        ["Anchored"] = true,
                        ["Position"] = Vector3.new(Head.Position.X, Head.Position.Y - 2, Head.Position.Z - 2),
                        ["CFrame"] = CFrame.new(Head.Position.X, Head.Position.Y - 2, Head.Position.Z - 2),
                        ["Size"] = Vector3.new(6, 7, .2),
                        ["Color"] = Color3.fromRGB(255, 0, 0),
                        ["Material"] = "Glass",
                        ["Transparency"] = 1,
                        ["Name"] = string.rep("_", math.random(1, 1500))
                    },
                    20,
                    Attachment,
                    1
                )
                Create(
                    {
                        ["CanCollide"] = true,
                        ["Anchored"] = true,
                        ["Position"] = Vector3.new(Head.Position.X, Head.Position.Y - 2, Head.Position.Z + 2),
                        ["CFrame"] = CFrame.new(Head.Position.X, Head.Position.Y - 2, Head.Position.Z + 2),
                        ["Size"] = Vector3.new(6, 7, .2),
                        ["Color"] = Color3.fromRGB(255, 0, 0),
                        ["Material"] = "Glass",
                        ["Transparency"] = 1,
                        ["Name"] = string.rep("_", math.random(1, 1500))
                    },
                    20,
                    Attachment,
                    1
                )
            end
        end
    end,
    ["nowaterdamage"] = function()
        local Characters = GetCharacters(game:GetService("Players").LocalPlayer.Name)
        for i, v in next, Characters do
            local Env = getsenv(v:FindFirstChild("FallDamageScript"))
            Env.InOcean = function()
                return 0
            end
        end
    end
}
game:GetService("UserInputService").InputEnded:Connect(
    function(Input)
        if Input.KeyCode == Enum.KeyCode.BackSlash then
            TextBox.Visible = not TextBox.Visible
            if TextBox.Visible == true then
                TextBox.Text = ""
                TextBox:CaptureFocus()
                TextBox.Text = ""
            end
        end
    end
)
ScreenGui.Parent = game:GetService("CoreGui")
TextBox.Parent = ScreenGui
TextBox.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
TextBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.5, -100, 1, -100)
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Font = Enum.Font.Code
TextBox.PlaceholderText = "Input"
TextBox.Visible = false
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14
TextBox.TextWrapped = true
TextBox.FocusLost:Connect(
    function(Enter)
        if Enter then
            local Split = TextBox.Text:split("-")
            local Command = Split[1] or ""
            local Args = Split[2] or ""
            if Commands[string.lower(Command)] then
                if Args == "" then
                    Commands[string.lower(Command)]()
                else
                    Commands[string.lower(Command)](Args)
                end
            end
            TextBox.Text = ""
            TextBox.Visible = not TextBox.Visible
        end
    end
)
a =
    hookfunction(
    getrenv().require,
    newcclosure(
        function(...)
            local Args = {
                ...
            }
            if Args[1].Name == "Settings" then
                print "a"
                local A = a(Args[1])
                print "b"
                if typeof(A) == "function" then
                    return function()
                        return {
                            Tool = workspace:WaitForChild("renee188"):WaitForChild("Pistol"),
                            Damage = 100,
                            PrimaryIridiumCost = 0,
                            PrimaryFireRate = 25,
                            PrimaryAutomatic = true,
                            PrimaryInaccuracy = 0,
                            PrimaryRange = 4096,
                            PrimaryDamageType = "Bullet",
                            EffectArgs = {
                                Speed = 768,
                                Size = 0.25,
                                PartArgs = {
                                    Color = "Bright yellow",
                                    Material = "Neon",
                                    Transparency = 0
                                }
                            }
                        }
                    end
                end
            end
            return a(unpack(Args))
        end
    )
)
