local m = game.Players.LocalPlayer:GetMouse()
local uis = game:GetService("UserInputService")
local vu = game:GetService("VirtualUser")
local vuscript = nil
local bruh = {}

function notify(title, text)
    game.StarterGui:SetCore("SendNotification", {
        Title = tostring(title),
        Text = tostring(text),
        Duration = 5
    })
end

m.Button1Down:Connect(function()
    if (uis:IsKeyDown(Enum.KeyCode.LeftControl) and string.find(m.Target.Name, "Tile")) then
        m.Target.BrickColor = BrickColor.new("Forest green")
        table.insert(bruh, m.Target)
    elseif uis:IsKeyDown(Enum.KeyCode.RightControl) then
        for _,v in next, bruh do
            v.Color = Color3.fromRGB(198, 237, 255)
            v = nil
        end
    elseif uis:IsKeyDown(Enum.KeyCode.Backspace) then
        m.Target.Color = Color3.fromRGB(198, 237, 255)
    elseif uis:IsKeyDown(Enum.KeyCode.Period) then
        notify("Recording", "Started recording")
        game.Players.LocalPlayer.Character.HumanoidRootPart:PivotTo(CFrame.new(264.93808, 1995.86084, -147.131821, 0, 0, 1, 0, 1, 0, -1, 0, 0))
        vu:StartRecording()
    elseif uis:IsKeyDown(Enum.KeyCode.Return) then
        notify("Recording", "Stopped recording")
        vuscript = vu:StopRecording()
        vuscript = string.gsub(tostring(vuscript), "SetKeUp", "SetKeyUp")
        vuscript = string.gsub(tostring(vuscript), "wait", "task.wait")
    elseif (uis:IsKeyDown(Enum.KeyCode.LeftBracket) or uis:IsKeyDown(Enum.KeyCode.RightBracket)) then
        if vuscript == nil then
            notify("No recording", "You have not recorded yet!")
            return
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart:PivotTo(CFrame.new(264.93808, 1995.86084, -147.131821, 0, 0, 1, 0, 1, 0, -1, 0, 0))
            loadstring(tostring(vuscript))()
        end
    end
end)
