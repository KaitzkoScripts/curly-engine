local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stebulous/solaris-ui-lib/main/source.lua"))()
local helledppl = {}
local picked = nil
local usingmouse = false
local m = game.Players.LocalPlayer:GetMouse()

function hell(player)
    if not player then
        return
    end
    game.ReplicatedStorage.RemoteEvents.ShoveTool:FireServer(player.Character:WaitForChild("HumanoidRootPart"), Vector3.new(999, 999, 999))
    if not table.find(helledppl, player) then
        table.insert(helledppl, player)
    end
    coroutine.wrap(function()
        while true do
            task.wait(5)
            game.ReplicatedStorage.RemoteEvents.ShoveTool:FireServer(player.Character.HumanoidRootPart, Vector3.new(999, 999, 999))
            repeat task.wait() until player.Character
            if not player then
                break
            end
        end
    end)()
end

local win = SolarisLib:New({
    Name = "Ragdoll Physics",
    FolderToSave = "RP_Stuff"
})
local tab = win:Tab("Fun")
local sec = tab:Section("Have fun trolling")
local lab = sec:Label("Picked Player: None")
local drpdown = sec:Dropdown("Players", {"Refresh players!"}, "", "Dropdown", function(t)
    picked = t
    lab:Set(t)
end)
sec:Button("Refresh Players", function()
    local bruh = {}
    for _,v in pairs(game.Players:GetPlayers()) do
        table.insert(bruh, v.Name)
    end
    drpdown:Set(bruh)
end)
sec:Button("Fling Picked Player", function()
    if picked == nil then
        SolarisLib:Notification("Pick somebody", "Pick somebody first")
    else
        task.spawn(hell, game.Players[picked])
    end
end)
sec:Toggle("Use mouse to pick", false, "Toggle", function(goofy)
    usingmouse = goofy
end)

m.Button1Down:Connect(function()
    if usingmouse then
        local ratio = game.Players:GetPlayerFromCharacter(m.Target:FindFirstAncestorOfClass("Model"))
        if ratio then
            picked = ratio.Name
            lab:Set("Picked Player: "..ratio.Name)
        end
    end
end)

game.Players.PlayerAdded:Connect(function(zaplayer)
    if table.find(helledppl, zaplayer) then
        task.spawn(hell, plr)
    end
end)
