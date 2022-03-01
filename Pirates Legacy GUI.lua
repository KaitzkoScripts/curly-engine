local ptk, theywannakill, bruhwhat
local STOPITBREAK = false
local bozo = {
    [1] = "DmgCentral",
    [2] = "calculateDmg",
    [3] = nil,
    [4] = "WHATDADOGDOIN",
    [5] = "1SS",
    [6] = "Sword",
    [7] = 93,
    [8] = "Stun",
    [9] = 0.6,
    [10] = nil,
    [11] = nil,
    [12] = Color3.new(0, 0, 1)
}
function wellokaythen()
    while true do
        if STOPITBREAK then
            break
        end
        task.wait()
        for i,v in ipairs(game:GetService("Players"):GetChildren()) do
            if v.Character ~= game.Players.LocalPlayer.Character then
                bozo[4] = v.Character
                game:GetService("ReplicatedStorage").Remotes.ServerHandler:FireServer(unpack(bozo))
            end
        end
    end
end
function zamntheydobelookingfine()
    STOPITBREAK = true
    task.wait(5)
    STOPITBREAK = false
end
function uhtheymightbedead(arethey)
    bruhwhat = string.split(arethey:WaitForChild("Head", 5).Overhead.Background.HealthAmount.Text, "/")
    if tonumber(bruhwhat[1]) == 0 then
        return true
    else
        return false
    end
end
function hedoesthebreakdance(omgheis)
    repeat
        bozo[4] = omgheis.Character
        if uhtheymightbedead(omgheis.Character) == true or STOPITBREAK == true then
            break
        end
        task.wait()
        game:GetService("ReplicatedStorage").Remotes.ServerHandler:FireServer(unpack(bozo))
    until uhtheymightbedead(omgheis.Character) == true
end
function wedoalittlefunny(trollge)
    repeat
        bozo[4] = trollge
        if uhtheymightbedead(trollge) or not shared.istoggled then
            break
        end
        task.wait()
        game:GetService("ReplicatedStorage").Remotes.ServerHandler:FireServer(unpack(bozo))
    until uhtheymightbedead(trollge) == true
end
function youwillneverreachthetruth()
    while true do
        task.wait(1)
        if not shared.istoggled then
            break
        end
        repeat
            for i,v in ipairs(game:GetService("Workspace"):GetChildren()) do
                if v.Name == theywannakill then
                    break
                end
            end
            task.wait()
        until true
        for i,v in ipairs(game:GetService("Workspace"):GetChildren()) do
            if (v.Name == theywannakill) then
                task.spawn(wedoalittlefunny, v)
            end
        end
    end
end

--== abc ==--

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("Pirates Legacy")

local b = w:CreateFolder("Functions")

local a = w:CreateFolder("AutoFarm")

local g = w:CreateFolder("GUI")

b:Box("Player (Display name or real username)","string",function(value) -- "number" or "string"
    ptk = value
end)

b:Button("Kill Player",function()
    for i,v in ipairs(game:GetService("Players"):GetChildren()) do
        if (v.DisplayName == ptk or v.Name == ptk) then
            task.spawn(hedoesthebreakdance, v)
            break
        end
    end
end)

b:Button("Damage Player",function()
    for i,v in ipairs(game:GetService("Players"):GetChildren()) do
        if (v.DisplayName == ptk or v.Name == ptk) then
            bozo[4] = v.Character
            game:GetService("ReplicatedStorage").Remotes.ServerHandler:FireServer(unpack(bozo))
            break
        end
    end
end)

b:Button("Loop kill all",function()
    wellokaythen()
end)

b:Label("Use this to stop loop kill all or kill player",{
    TextSize = 12;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
})

b:Button("Stop all kill loops",function()
    zamntheydobelookingfine()
end)

a:Label("Only re-enable if you have died, don't use it more than once",{
    TextSize = 12;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
})

a:Dropdown("Quest and Mob",{"Runaway","Bandit"},true,function(mob)
    theywannakill = mob
end)

a:Toggle("AutoFarm",function(bool)
    shared.istoggled = bool
    if shared.istoggled then
        task.spawn(youwillneverreachthetruth)
    end
end)

g:DestroyGui()