local lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()

local plr
for _,v in pairs(workspace.Living:GetChildren()) do
    if v.Name == game.Players.LocalPlayer.Name then
        plr = v
        break
    end
end

local chosenstand = nil
local wlstands = {}

local w = lib:CreateWindow("Your Bizarre Adventure")
local sf = w:CreateFolder("Stand Farm")
local g = w:CreateFolder("GUI")

sf:Toggle("Stand farm", function(bool)
    shared.sftoggle = bool
    if shared.sftoggle then
        notif.new("message", "Stand farm enabled", "Use this message to check status of stand farm")
        while shared.sftoggle do
            task.wait()
            local tab = {
                "LearnSkill",
                {
                    ["Skill"] = nil,
                    ["SkillTreeType"] = "Character"
                }
            }
            tab[2]["Skill"] = "Vitality I"
            plr.RemoteFunction:InvokeServer(unpack(tab))
            tab[2]["Skill"] = "Vitality II"
            plr.RemoteFunction:InvokeServer(unpack(tab))
            tab[2]["Skill"] = "Vitality III"
            plr.RemoteFunction:InvokeServer(unpack(tab))
            tab[2]["Skill"] = "Worthiness I"
            plr.RemoteFunction:InvokeServer(unpack(tab))
            tab[2]["Skill"] = "Worthiness II"
            plr.RemoteFunction:InvokeServer(unpack(tab))
            task.wait(.9)
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(game.Players.LocalPlayer.Backpack:WaitForChild("Mysterious Arrow"))
            task.wait(3)
            plr.RemoteEvent:FireServer(unpack({
                "EndDialogue",
                {
                    ["NPC"] = "Mysterious Arrow",
                    ["Option"] = "Option1",
                    ["Dialogue"] = "Dialogue2"
                }
            }))
            task.wait(2.96)
            if not table.find(wlstands, game.Players.LocalPlayer.PlayerStats.Stand.Value) then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:WaitForChild("Rokakaka"))
                task.wait(5)
                plr.RemoteEvent:FireServer(unpack({
                    "EndDialogue",
                    {
                        ["NPC"] = "Rokakaka",
                        ["Dialogue"] = "Dialogue2",
                        ["Option"] = "Option1"
                    }
                }))
                task.wait(.1)
                repeat
                    task.wait()
                until game.Players.LocalPlayer.Character.Humanoid.Health ~= 0
            else
                notif.new("success", "Got a whitelisted stand", "You got"..game.Players.LocalPlayer.PlayerStats.Stand.Value)
                break
            end
        end
    end
end)

sf:Dropdown("Pick stand to whitelist", {"Platinum Sun", "The Universe", "White Poison", "Tentacle Green", "Violet Vine", "Six Pistols", "Golden Spirit", "Zipper Fingers", "Scarlet King", "Magician's Ember", "That Hand", "Airsmith", "Ocean Boy", "Ms. Vice President", "Ice Album", "Grey Rapier", "Void", "Violet Fog", "Anubiz", "Yellow Hot Chili Pepper", "Shining Sapphire", "Deadly King"}, true, function(Stand)
    chosenstand = Stand
end)

sf:Button("Whitelist stand", function()
    if chosenstand == nil then
        notif.new("error", "Stand not chosen", "Choose a stand first")
    else
        table.insert(wlstands, chosenstand)
    end
end)
sf:Button("Clear whitelist", function()
    table.clear(wlstands)
end)
sf:Button("Check whitelisted stands", function()
    for _,v in pairs(wlstands) do
        notif.new("message", "Whitelisted stand", v)
    end
end)

g:DestroyGui()